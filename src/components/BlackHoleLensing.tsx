"use client";

import { useEffect, useRef, useState } from "react";

// A real-time gravitational-lensing renderer, embedded in an article via a
// fenced ```blackholelensing block (see Reader's `pre` override). This is a
// genuine backward ray tracer for null geodesics in the Schwarzschild
// metric, run per-pixel per-frame in a WebGL2 fragment shader — the same
// architecture as every serious real-time black-hole render — rather than
// the site's usual SVG diagram pattern, because a lensed accretion-disk
// image is fundamentally a raster problem and an animated one at that.
//
// Units: Schwarzschild radius r_s = 1. Photon sphere at 1.5, disk annulus
// [3, 14] (ISCO to outer edge). Each fragment integrates the compact
// Cartesian form of the Schwarzschild null geodesic equation,
//
//   d²x/dλ² = -(3/2) h² x / r⁵ ,   h = |x × v| (conserved)
//
// via leapfrog steps from the camera outward, checking each step for a
// crossing of the disk plane. Rays that cross the plane in the empty gap
// inside the ISCO keep integrating — which is what lets them wrap behind
// the hole and strike the disk's far side, producing the lensed arcs above
// and below the shadow with no special-casing. The "Newtonian" toggle
// multiplies the bending term by zero: straight rays, no wraparound, a
// plain foreshortened ellipse — the visual difference between Newton and
// Einstein in one click.
//
// The disk is textured with value-noise streaks advected by differential
// (Keplerian) rotation and brightened on the approaching side by an
// approximate relativistic beaming factor; the shadow's rim carries a warm
// glow from rays that graze the photon sphere. Rendered continuously while
// on screen (IntersectionObserver pauses it when scrolled away), with a
// slow orbital drift; drag to orbit by hand, slider for inclination.
// Fixed dark cosmic palette regardless of site theme, as astronomical
// imagery rather than themed UI.

const VERT = `#version 300 es
precision highp float;
const vec2 pos[3] = vec2[3](vec2(-1.,-1.), vec2(3.,-1.), vec2(-1.,3.));
void main() { gl_Position = vec4(pos[gl_VertexID], 0., 1.); }
`;

const FRAG = `#version 300 es
precision highp float;
out vec4 outColor;

uniform vec2 u_res;
uniform float u_time;
uniform float u_inc;   // inclination, radians from face-on
uniform float u_yaw;   // manual + drift orbit angle
uniform float u_bend;  // 1 = GR, 0 = Newtonian straight lines

const float R_ISCO = 3.0;
const float R_OUT  = 14.0;
const float CAM_R  = 27.0;
const int   STEPS  = 220;

// -- tiny hash / value noise / fbm --------------------------------------
float hash12(vec2 p) {
  vec3 p3 = fract(vec3(p.xyx) * 0.1031);
  p3 += dot(p3, p3.yzx + 33.33);
  return fract((p3.x + p3.y) * p3.z);
}
float vnoise(vec2 p) {
  vec2 i = floor(p), f = fract(p);
  vec2 u = f * f * (3.0 - 2.0 * f);
  return mix(mix(hash12(i), hash12(i + vec2(1, 0)), u.x),
             mix(hash12(i + vec2(0, 1)), hash12(i + vec2(1, 1)), u.x), u.y);
}
float fbm(vec2 p) {
  float a = 0.5, s = 0.0;
  for (int i = 0; i < 4; i++) { s += a * vnoise(p); p *= 2.13; a *= 0.5; }
  return s;
}

// -- background starfield ------------------------------------------------
float hash13(vec3 p3) {
  p3 = fract(p3 * 0.1031);
  p3 += dot(p3, p3.zyx + 31.32);
  return fract((p3.x + p3.y) * p3.z);
}
vec3 stars(vec3 d) {
  vec3 col = vec3(0.0008, 0.0008, 0.002);
  // whisper of cool nebulosity — kept far below the gamma lift
  col += vec3(0.003, 0.0025, 0.006) * fbm(d.xy * 2.5 + d.z * 1.7);
  // point stars from 3D direction cells (2D cells streak near the poles)
  for (int s = 0; s < 2; s++) {
    float scale = s == 0 ? 34.0 : 70.0;
    vec3 cell = floor(d * scale);
    float h = hash13(cell);
    if (h > 0.982) {
      vec3 f = fract(d * scale) - 0.5;
      float sparkle = smoothstep(0.30, 0.0, length(f)) * (h - 0.982) / 0.018;
      col += vec3(0.85, 0.85, 1.0) * sparkle * (s == 0 ? 0.5 : 0.3);
    }
  }
  return col;
}

// -- accretion disk shading ---------------------------------------------
// hit: point in disk plane (y ~ 0); photonDir: direction the traced ray was
// travelling at the hit (i.e. away from camera — the physical photon moves
// opposite to it, toward the observer).
vec3 shadeDisk(vec3 hit, vec3 photonDir) {
  float r = length(hit.xz);
  float t = clamp((r - R_ISCO) / (R_OUT - R_ISCO), 0.0, 1.0);

  // Keplerian differential rotation: inner material laps outer, shearing
  // the noise field into trailing streaks.
  float omega = 0.45 * pow(r / R_ISCO, -1.5);
  float ang = u_time * omega;
  float c = cos(ang), s = sin(ang);
  vec2 q = mat2(c, -s, s, c) * hit.xz;
  float streak = fbm(vec2(r * 2.1, atan(q.y, q.x) * 3.0 + r * 1.4));
  streak = 0.55 + 0.9 * streak;

  // temperature: hot pale gold at the ISCO cooling quickly to deep ember red
  vec3 hot  = vec3(1.00, 0.96, 0.84);
  vec3 cool = vec3(0.90, 0.26, 0.05);
  vec3 base = mix(hot, cool, pow(t, 0.45));

  // radial emissivity falloff — steep enough that the outer disk fades to
  // dim embers while the ISCO burns white
  float emis = pow(R_ISCO / r, 3.0) * 3.0 + 0.008;

  // approximate relativistic beaming: circular-orbit speed in r_s units is
  // 1/sqrt(2(r-1)); brighten where the flow moves toward the observer.
  float beta = clamp(1.0 / sqrt(2.0 * max(r - 1.0, 0.6)), 0.0, 0.62) * u_bend;
  vec3 flow = normalize(vec3(-hit.z, 0.0, hit.x));
  float cosA = dot(flow, -photonDir);
  float dopp = pow(1.0 / max(1.0 - beta * cosA, 0.35), 3.0);

  return base * emis * streak * dopp;
}

void main() {
  vec2 uv = (gl_FragCoord.xy - 0.5 * u_res) / u_res.y;

  // camera: orbit of radius CAM_R at inclination u_inc, yaw u_yaw
  float ci = cos(u_inc), si = sin(u_inc);
  float cy = cos(u_yaw), sy = sin(u_yaw);
  vec3 camPos = CAM_R * vec3(si * cy, ci, si * sy);
  vec3 fwd = normalize(-camPos);
  vec3 right = normalize(cross(fwd, vec3(0.0, 1.0, 0.0)));
  vec3 up = cross(right, fwd);
  vec3 dir = normalize(fwd * 1.55 + uv.x * right + uv.y * up);

  vec3 p = camPos;
  vec3 v = dir;
  vec3 h3 = cross(p, v);
  float h2 = dot(h3, h3);

  vec3 col = vec3(0.0);
  float minR = 1e4;
  bool done = false;
  bool captured = false;

  for (int i = 0; i < STEPS; i++) {
    float r = length(p);
    minR = min(minR, r);

    if (r < 1.0) { done = true; captured = true; break; } // through the horizon: black
    if (r > 44.0 && dot(p, v) > 0.0) {   // escaped: starfield
      col = stars(normalize(v));
      done = true;
      break;
    }

    float dt = clamp(r * 0.10, 0.045, 0.9);
    // leapfrog on d²x/dλ² = -1.5 h² x / r⁵ (exact Schwarzschild null form)
    vec3 a = -1.5 * h2 * p / pow(r, 5.0) * u_bend;
    v += a * dt;
    vec3 pn = p + v * dt;

    // disk-plane crossing?
    if (p.y * pn.y < 0.0) {
      float f = p.y / (p.y - pn.y);
      vec3 hit = mix(p, pn, f);
      float rh = length(hit.xz);
      if (rh > R_ISCO && rh < R_OUT) {
        col = shadeDisk(hit, normalize(v));
        done = true;
        break;
      }
      // crossed in the gap or beyond the rim: keep going — this is what
      // wraps rays around to the disk's far side.
    }
    p = pn;
  }

  if (!done) { col = vec3(0.0); captured = true; } // exhausted steps in a photon orbit

  // warm photon-ring glow, only for rays that actually made it back out —
  // captured rays stay black, keeping the shadow's interior truly dark
  if (!captured) {
    float graze = abs(minR - 1.5);
    col += vec3(1.0, 0.82, 0.55) * u_bend * 0.045 / (0.06 + graze * graze * 14.0);
  }

  // filmic-ish tone map + gamma
  col = 1.0 - exp(-col * 1.15);
  col = pow(col, vec3(0.4545));
  outColor = vec4(col, 1.0);
}
`;

export function BlackHoleLensing() {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const wrapRef = useRef<HTMLDivElement | null>(null);
  const [incDeg, setIncDeg] = useState(80);
  const [gr, setGr] = useState(true);
  const [failed, setFailed] = useState(false);
  const stateRef = useRef({ inc: 80, bend: 1, yawOffset: 0, dragging: false, lastX: 0, visible: true });

  stateRef.current.inc = incDeg;
  stateRef.current.bend = gr ? 1 : 0;

  useEffect(() => {
    const canvas = canvasRef.current;
    const wrap = wrapRef.current;
    if (!canvas || !wrap) return;

    const gl = canvas.getContext("webgl2", { antialias: false, alpha: false });
    if (!gl) { setFailed(true); return; }

    const compile = (type: number, src: string) => {
      const sh = gl.createShader(type)!;
      gl.shaderSource(sh, src);
      gl.compileShader(sh);
      if (!gl.getShaderParameter(sh, gl.COMPILE_STATUS)) {
        console.error(gl.getShaderInfoLog(sh));
        return null;
      }
      return sh;
    };
    const vs = compile(gl.VERTEX_SHADER, VERT);
    const fs = compile(gl.FRAGMENT_SHADER, FRAG);
    if (!vs || !fs) { setFailed(true); return; }
    const prog = gl.createProgram()!;
    gl.attachShader(prog, vs);
    gl.attachShader(prog, fs);
    gl.linkProgram(prog);
    if (!gl.getProgramParameter(prog, gl.LINK_STATUS)) { setFailed(true); return; }
    gl.useProgram(prog);

    const uRes = gl.getUniformLocation(prog, "u_res");
    const uTime = gl.getUniformLocation(prog, "u_time");
    const uInc = gl.getUniformLocation(prog, "u_inc");
    const uYaw = gl.getUniformLocation(prog, "u_yaw");
    const uBend = gl.getUniformLocation(prog, "u_bend");

    const dpr = Math.min(window.devicePixelRatio || 1, 2);
    const resize = () => {
      const w = Math.min(wrap.clientWidth, 560);
      const bw = Math.min(Math.round(w * dpr), 900);
      const bh = Math.round(bw * 0.72);
      if (canvas.width !== bw || canvas.height !== bh) {
        canvas.width = bw;
        canvas.height = bh;
        gl.viewport(0, 0, bw, bh);
      }
    };
    resize();
    const ro = new ResizeObserver(resize);
    ro.observe(wrap);

    const io = new IntersectionObserver(
      (entries) => { stateRef.current.visible = entries[0]?.isIntersecting ?? true; },
      { rootMargin: "100px" },
    );
    io.observe(canvas);

    let raf = 0;
    const t0 = performance.now();
    const draw = (now: number) => {
      raf = requestAnimationFrame(draw);
      if (!stateRef.current.visible) return;
      const t = (now - t0) / 1000;
      const st = stateRef.current;
      gl.uniform2f(uRes, canvas.width, canvas.height);
      gl.uniform1f(uTime, t);
      gl.uniform1f(uInc, (st.inc * Math.PI) / 180);
      gl.uniform1f(uYaw, st.yawOffset + t * 0.05);
      gl.uniform1f(uBend, st.bend);
      gl.drawArrays(gl.TRIANGLES, 0, 3);
    };
    raf = requestAnimationFrame(draw);

    return () => {
      cancelAnimationFrame(raf);
      ro.disconnect();
      io.disconnect();
      gl.deleteProgram(prog);
      gl.deleteShader(vs);
      gl.deleteShader(fs);
    };
  }, []);

  return (
    <figure className="my-7 rounded-xl border border-line bg-card p-4 sm:p-5">
      <div className="mb-3 flex flex-wrap items-center justify-center gap-2">
        {([true, false] as const).map((mode) => (
          <button
            key={String(mode)}
            type="button"
            onClick={() => setGr(mode)}
            className={`font-sans text-[11.5px] rounded-full px-3 py-1 transition-colors ${
              gr === mode ? "bg-purple text-page font-semibold" : "border border-line text-muted hover:text-ink hover:border-ink"
            }`}
          >
            {mode ? "General relativity" : "Newtonian (no lensing)"}
          </button>
        ))}
      </div>

      <div ref={wrapRef} className="mx-auto w-full max-w-[560px]">
        {failed ? (
          <div className="rounded-xl border border-line p-6 text-center font-sans text-[12.5px] text-muted">
            This visualization requires WebGL2, which your browser has disabled or does not support.
          </div>
        ) : (
          <canvas
            ref={canvasRef}
            className="block h-auto w-full cursor-grab touch-none rounded-xl active:cursor-grabbing"
            style={{ background: "#08070c" }}
            role="img"
            aria-label={`A live ray-traced rendering of a Schwarzschild black hole and its accretion disk, viewed at ${incDeg} degrees from face-on, ${gr ? "with" : "without"} gravitational light bending. Drag to orbit.`}
            onPointerDown={(e) => {
              stateRef.current.dragging = true;
              stateRef.current.lastX = e.clientX;
              e.currentTarget.setPointerCapture(e.pointerId);
            }}
            onPointerMove={(e) => {
              if (!stateRef.current.dragging) return;
              stateRef.current.yawOffset += (e.clientX - stateRef.current.lastX) * 0.006;
              stateRef.current.lastX = e.clientX;
            }}
            onPointerUp={() => { stateRef.current.dragging = false; }}
          />
        )}
      </div>

      <p className="mt-1 text-center font-sans text-[11.5px] text-faint">drag to orbit</p>

      <div className="mt-3 space-y-3">
        <label className="block">
          <span className="flex justify-between font-sans text-[12px] text-muted">
            <span>Inclination (from face-on)</span>
            <span className="tabular-nums">{incDeg}&deg;</span>
          </span>
          <input
            type="range" min={5} max={89} step={1} value={incDeg}
            onChange={(e) => setIncDeg(Number(e.target.value))}
            aria-label="Inclination" className="mt-1 w-full" style={{ accentColor: "var(--c-purple)" }}
          />
        </label>
      </div>

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        A live backward ray trace of null geodesics around a Schwarzschild black hole, computed per pixel, per frame, on your GPU &mdash; not a video and not a stylised drawing. In <span className="text-ink">general relativity</span>, light from the disk&rsquo;s far side is bent up and over the horizon and delivered as the arcs above and below the shadow, and material orbiting toward you is brightened by relativistic beaming &mdash; the same physics that shapes real black-hole images. Toggle to <span className="text-ink">Newtonian</span> and the bending term is set to zero: rays run straight, the wraparound vanishes, and the disk becomes an ordinary foreshortened ellipse. The swirling texture is the disk&rsquo;s differential rotation &mdash; inner material laps outer material, shearing the flow into trailing streaks.
      </figcaption>
    </figure>
  );
}
