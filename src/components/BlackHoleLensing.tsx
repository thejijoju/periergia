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
const float R_OUT  = 20.0;
const float CAM_R  = 34.0;
const int   STEPS  = 240;

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
// The disk is a translucent particle cloud, not an opaque surface: this
// returns premultiplied emission in .rgb and opacity in .a, and the ray
// march accumulates several plane crossings through it — which is what
// gives the render its layered, cloudy depth, with the lensed far-side
// image showing through the near material.
// hit: point in disk plane (y ~ 0); photonDir: direction the traced ray
// was travelling at the hit (away from camera — the physical photon moves
// opposite to it, toward the observer).
vec4 shadeDisk(vec3 hit, vec3 photonDir) {
  float r = length(hit.xz);
  float t = clamp((r - R_ISCO) / (R_OUT - R_ISCO), 0.0, 1.0);

  // Keplerian shear frame: rotate the sampling coordinates by the local
  // orbital angle so inner material visibly laps outer material.
  float omega = 0.5 * pow(r / R_ISCO, -1.5);
  float ca = cos(u_time * omega), sa = sin(u_time * omega);
  vec2 q = mat2(ca, -sa, sa, ca) * hit.xz;

  // two broad trailing spiral arms, perturbed so they read as wisps
  float arm = 0.55 + 0.45 * sin(2.0 * atan(q.y, q.x) + 3.5 * log(r) + 2.2 * fbm(q * 0.35));

  // granular "particle" texture: sharpened noise specks at two scales,
  // the finer layer twinkling cell-by-cell
  float grain = pow(vnoise(q * 3.0), 3.0) * 2.0;
  float tw = 0.7 + 0.3 * sin(u_time * 2.4 + hash12(floor(q * 6.5)) * 6.283);
  grain += pow(vnoise(q * 6.5 + 31.7), 4.0) * 2.8 * tw;

  // density: sharp inner cutoff at the ISCO, ragged wispy outer fade
  float rag = fbm(q * 0.5 + 7.3);
  float outer = smoothstep(1.05, 0.40, (r / R_OUT) * (0.80 + 0.55 * rag));
  float inner = smoothstep(R_ISCO - 0.1, R_ISCO + 1.2, r);
  float dens = inner * outer * arm * (0.22 + grain);

  // monochrome silver: warm-white core cooling to faint blue-grey wisps
  vec3 base = mix(vec3(1.00, 0.99, 0.96), vec3(0.52, 0.58, 0.72), pow(t, 0.5));
  float emis = pow(R_ISCO / r, 1.9) * 2.6 + 0.04;

  // approximate relativistic beaming: circular-orbit speed in r_s units is
  // 1/sqrt(2(r-1)); brighten where the flow moves toward the observer.
  float beta = clamp(1.0 / sqrt(2.0 * max(r - 1.0, 0.6)), 0.0, 0.62) * u_bend;
  vec3 flow = normalize(vec3(-hit.z, 0.0, hit.x));
  float cosA = dot(flow, -photonDir);
  float dopp = pow(1.0 / max(1.0 - beta * cosA, 0.4), 2.5);

  float alpha = clamp(dens * 0.8, 0.0, 0.92);
  return vec4(base * emis * dopp * dens * 1.6, alpha);
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
  float T = 1.0;   // transmittance: how much of what lies further along the ray still shows
  float minR = 1e4;
  bool captured = false;
  bool escaped = false;

  for (int i = 0; i < STEPS; i++) {
    float r = length(p);
    minR = min(minR, r);

    if (r < 1.0) { captured = true; break; } // through the horizon
    if (r > 62.0 && dot(p, v) > 0.0) { escaped = true; break; }

    float dt = clamp(r * 0.10, 0.045, 0.9);
    // leapfrog on d²x/dλ² = -1.5 h² x / r⁵ (exact Schwarzschild null form)
    vec3 a = -1.5 * h2 * p / pow(r, 5.0) * u_bend;
    v += a * dt;
    vec3 pn = p + v * dt;

    // disk-plane crossing? The disk is translucent, so accumulate emission
    // and keep marching — later crossings (the lensed far side wrapping
    // behind the hole) blend through the nearer material.
    if (p.y * pn.y < 0.0) {
      float f = p.y / (p.y - pn.y);
      vec3 hit = mix(p, pn, f);
      float rh = length(hit.xz);
      if (rh > R_ISCO && rh < R_OUT) {
        vec4 d = shadeDisk(hit, normalize(v));
        col += T * d.rgb;
        T *= 1.0 - d.a;
        if (T < 0.04) break; // effectively opaque from here back
      }
    }
    p = pn;
  }

  if (escaped) col += T * stars(normalize(v));
  // captured or step-exhausted rays contribute nothing further: whatever
  // disk light was accumulated in front of the shadow stays, and the
  // remainder is black.

  // warm photon-ring glow for rays that grazed the photon sphere and made
  // it back out; captured rays keep the shadow's interior dark
  if (!captured) {
    float graze = abs(minR - 1.5);
    col += vec3(1.0, 0.92, 0.78) * u_bend * 0.045 / (0.06 + graze * graze * 14.0);
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
