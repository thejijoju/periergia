"use client";

import { useEffect, useRef, useState } from "react";

// A real-time procedural Sun, embedded in an article via a fenced
// ```suninterior block (see Reader's `pre` override). Rendered per-pixel in
// a WebGL2 fragment shader like BlackHoleLensing: analytic ray-sphere
// intersection (no geodesics needed here — the Sun does not bend its own
// light appreciably), with two modes that mirror the Energy Transport
// chapter's argument.
//
// SURFACE: the photosphere as a boiling field of convective granules —
// time-evolving sharpened 3D value noise standing in for the ~2 million
// cells that tile the real Sun, with limb darkening (the disk dims and
// reddens toward the edge because an oblique line of sight exits at a
// shallower, cooler depth) and a faint corona with fbm streamers for rays
// that miss the disk.
//
// CUTAWAY: a quarter-wedge sliced out of the sphere, exposing the interior
// this sub-block is about: the fusing core out to ~0.25 R_sun, the
// radiative zone with its faint radial striations (energy random-walking
// outward as radiation), and the churning convective envelope from
// 0.713 R_sun to the surface, with thin bright rings marking the two
// boundaries — the outer one at the radius helioseismology fixes to 0.1%.
//
// Drag to rotate (the wedge is fixed to the Sun, so dragging turns it
// toward or away from view); slow auto-drift otherwise. Fixed dark cosmic
// palette regardless of site theme, as astronomical imagery. Rendering
// pauses via IntersectionObserver while scrolled off screen.

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
uniform float u_yaw;
uniform float u_cut;   // 1 = cutaway wedge, 0 = full surface

const float CAM_D = 3.1;
const float R_CORE = 0.25;
const float R_CONV = 0.713;

// -- hash / 3D value noise / fbm ----------------------------------------
float hash13(vec3 p3) {
  p3 = fract(p3 * 0.1031);
  p3 += dot(p3, p3.zyx + 31.32);
  return fract((p3.x + p3.y) * p3.z);
}
float vnoise3(vec3 p) {
  vec3 i = floor(p), f = fract(p);
  vec3 u = f * f * (3.0 - 2.0 * f);
  return mix(
    mix(mix(hash13(i), hash13(i + vec3(1, 0, 0)), u.x),
        mix(hash13(i + vec3(0, 1, 0)), hash13(i + vec3(1, 1, 0)), u.x), u.y),
    mix(mix(hash13(i + vec3(0, 0, 1)), hash13(i + vec3(1, 0, 1)), u.x),
        mix(hash13(i + vec3(0, 1, 1)), hash13(i + vec3(1, 1, 1)), u.x), u.y),
    u.z);
}
float fbm3(vec3 p) {
  float a = 0.5, s = 0.0;
  for (int i = 0; i < 4; i++) { s += a * vnoise3(p); p *= 2.17; a *= 0.5; }
  return s;
}

vec3 stars(vec3 d) {
  vec3 col = vec3(0.0008, 0.0008, 0.002);
  for (int s = 0; s < 2; s++) {
    float scale = s == 0 ? 34.0 : 70.0;
    vec3 cell = floor(d * scale);
    float h = hash13(cell);
    if (h > 0.985) {
      vec3 f = fract(d * scale) - 0.5;
      float sparkle = smoothstep(0.28, 0.0, length(f)) * (h - 0.985) / 0.015;
      col += vec3(0.85, 0.85, 1.0) * sparkle * (s == 0 ? 0.4 : 0.25);
    }
  }
  return col;
}

// -- photosphere: granulation + limb darkening --------------------------
vec3 shadeSurface(vec3 m, vec3 viewDir) {
  // time-evolving cells: bright rising centres, darker sinking lanes
  float g = fbm3(m * 42.0 + vec3(0.0, 0.0, u_time * 0.35));
  g = smoothstep(0.38, 0.66, g);
  vec3 lane = vec3(0.62, 0.22, 0.04);
  vec3 cell = vec3(1.25, 0.82, 0.34);
  vec3 col = mix(lane, cell, g);

  // a second, finer sparkle layer
  col *= 0.90 + 0.20 * vnoise3(m * 110.0 + u_time * 0.6);

  // limb darkening: oblique sight lines exit at a shallower, cooler depth
  float mu = max(dot(normalize(m), -viewDir), 0.0);
  float ld = 0.35 + 0.65 * pow(mu, 0.62);
  col *= ld * 1.25;
  // and redden toward the limb
  col = mix(col * vec3(1.0, 0.62, 0.38), col, smoothstep(0.0, 0.55, mu));
  return col;
}

// -- interior cross-section ---------------------------------------------
vec3 shadeInterior(vec3 m) {
  float r = length(m);
  vec3 col;
  if (r < R_CORE) {
    // the fusing core: blazing white-gold, brightest at the very centre
    float c = 1.0 - 0.5 * (r / R_CORE);
    col = vec3(1.0, 0.97, 0.86) * (1.6 + 1.2 * c);
  } else if (r < R_CONV) {
    // radiative zone: smooth orange gradient with faint radial striations —
    // energy leaking outward as photons, no bulk motion
    float t = (r - R_CORE) / (R_CONV - R_CORE);
    col = mix(vec3(1.0, 0.74, 0.28), vec3(0.88, 0.42, 0.10), t) * (1.15 - 0.45 * t);
    vec3 dir = m / r;
    float streak = fbm3(dir * 7.0 + vec3(0.0, 0.0, r * 3.0));
    col *= 0.93 + 0.14 * streak;
  } else {
    // convective envelope: churning animated cells — bulk motion carrying
    // the flux the opaque gas will no longer let radiation carry
    float churn = fbm3(m * 18.0 + vec3(0.0, u_time * 0.30, 0.0));
    churn = smoothstep(0.30, 0.75, churn);
    col = mix(vec3(0.80, 0.38, 0.10), vec3(1.02, 0.78, 0.40), churn) * 0.95;
  }

  // thin bright rings at the two boundaries
  float b1 = smoothstep(0.012, 0.0, abs(r - R_CORE));
  float b2 = smoothstep(0.009, 0.0, abs(r - R_CONV));
  col += vec3(1.0, 0.95, 0.8) * (b1 * 0.7 + b2 * 0.85);
  return col;
}

// corona + chromosphere rim for rays that miss the disk
vec3 corona(vec3 ro, vec3 rd) {
  float b = length(cross(ro, rd)); // perpendicular distance to centre
  vec3 col = stars(rd);
  if (b < 2.6) {
    float x = max(b - 1.0, 0.0);
    float glow = exp(-x * 4.5);
    // streamers: angular structure that slowly evolves
    vec3 closest = ro - rd * dot(ro, rd);
    float ang = atan(closest.y, length(closest.xz));
    float streamer = 0.55 + 0.45 * fbm3(vec3(ang * 2.2, x * 2.0, u_time * 0.03));
    col += vec3(1.0, 0.88, 0.62) * glow * streamer * 0.85;
    col += vec3(1.0, 0.62, 0.30) * exp(-x * 30.0) * 0.5; // chromosphere rim
  }
  return col;
}

void main() {
  vec2 uv = (gl_FragCoord.xy - 0.5 * u_res) / u_res.y;

  // camera: fixed slight downward tilt; drag/drift rotates the SUN (model
  // space), so the cutaway wedge can be turned toward or away from view
  float pitch = -0.22;
  vec3 ro = vec3(0.0, -CAM_D * sin(pitch), CAM_D * cos(pitch));
  vec3 fwd = normalize(-ro);
  vec3 right = normalize(cross(fwd, vec3(0.0, 1.0, 0.0)));
  vec3 up = cross(right, fwd);
  vec3 rd = normalize(fwd * 1.30 + uv.x * right + uv.y * up);

  // world -> model rotation about y by -yaw
  float cy = cos(-u_yaw), sy = sin(-u_yaw);
  mat3 M = mat3(cy, 0.0, -sy, 0.0, 1.0, 0.0, sy, 0.0, cy);
  vec3 o = M * ro;
  vec3 d = M * rd;

  // ray-sphere, unit radius
  float bq = dot(o, d);
  float cq = dot(o, o) - 1.0;
  float disc = bq * bq - cq;

  vec3 col;
  if (disc < 0.0) {
    col = corona(o, d);
  } else {
    float t0 = -bq - sqrt(disc);
    float t1 = -bq + sqrt(disc);
    vec3 pNear = o + d * t0;

    bool inWedge = u_cut > 0.5 && pNear.x > 0.0 && pNear.z > 0.0;
    if (!inWedge) {
      col = shadeSurface(pNear, d);
    } else {
      // near hit is in the removed wedge: look for the cut faces —
      // plane x=0 (valid where z>0) and plane z=0 (valid where x>0)
      float best = 1e9;
      vec3 hit = vec3(0.0);
      if (abs(d.x) > 1e-6) {
        float t = -o.x / d.x;
        vec3 p = o + d * t;
        if (t > t0 && t < t1 && p.z > 0.0 && dot(p, p) < 1.0 && t < best) { best = t; hit = p; }
      }
      if (abs(d.z) > 1e-6) {
        float t = -o.z / d.z;
        vec3 p = o + d * t;
        if (t > t0 && t < t1 && p.x > 0.0 && dot(p, p) < 1.0 && t < best) { best = t; hit = p; }
      }
      if (best < 1e8) {
        col = shadeInterior(hit);
      } else {
        // ray passes through the void and strikes the far shell from
        // inside: show the back surface, dimmed
        col = shadeSurface(o + d * t1, d) * 0.55;
      }
    }
  }

  col = 1.0 - exp(-col * 1.05);
  col = pow(col, vec3(0.4545));
  outColor = vec4(col, 1.0);
}
`;

export function SunInterior() {
  const canvasRef = useRef<HTMLCanvasElement | null>(null);
  const wrapRef = useRef<HTMLDivElement | null>(null);
  const [cut, setCut] = useState(false);
  const [failed, setFailed] = useState(false);
  const stateRef = useRef({ cut: 0, yawOffset: -0.5, dragging: false, lastX: 0, visible: true });

  stateRef.current.cut = cut ? 1 : 0;

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
    const uYaw = gl.getUniformLocation(prog, "u_yaw");
    const uCut = gl.getUniformLocation(prog, "u_cut");

    const dpr = Math.min(window.devicePixelRatio || 1, 2);
    const resize = () => {
      const w = Math.min(wrap.clientWidth, 560);
      const bw = Math.min(Math.round(w * dpr), 900);
      const bh = Math.round(bw * 0.78);
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
      gl.uniform1f(uYaw, st.yawOffset + t * 0.04);
      gl.uniform1f(uCut, st.cut);
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
        {([false, true] as const).map((mode) => (
          <button
            key={String(mode)}
            type="button"
            onClick={() => setCut(mode)}
            className={`font-sans text-[11.5px] rounded-full px-3 py-1 transition-colors ${
              cut === mode ? "bg-purple text-page font-semibold" : "border border-line text-muted hover:text-ink hover:border-ink"
            }`}
          >
            {mode ? "Cutaway" : "Surface"}
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
            aria-label={
              cut
                ? "A live rendering of the Sun with a quarter wedge cut away, exposing the blazing core, the smooth radiative zone, and the churning convective envelope, with bright rings marking the boundaries at 0.25 and 0.713 solar radii. Drag to rotate."
                : "A live rendering of the Sun's boiling photosphere: bright convective granules separated by darker lanes, dimming and reddening toward the limb, with a faint streaming corona. Drag to rotate."
            }
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

      <p className="mt-1 text-center font-sans text-[11.5px] text-faint">drag to rotate</p>

      {cut && (
        <div className="mt-3 flex flex-wrap justify-center gap-x-5 gap-y-1 font-sans text-[11.5px] text-muted">
          <span><span className="mr-1.5 inline-block h-2.5 w-2.5 rounded-full align-middle" style={{ background: "#fff3d6" }} />core &mdash; to 0.25&thinsp;R&#9737;</span>
          <span><span className="mr-1.5 inline-block h-2.5 w-2.5 rounded-full align-middle" style={{ background: "#e08a2e" }} />radiative zone &mdash; to 0.713&thinsp;R&#9737;</span>
          <span><span className="mr-1.5 inline-block h-2.5 w-2.5 rounded-full align-middle" style={{ background: "#c96a1a" }} />convective zone &mdash; to the surface</span>
        </div>
      )}

      <figcaption className="mt-4 font-sans text-[12px] text-faint leading-snug">
        {cut ? (
          <>
            The Sun opened along a quarter wedge. The <span className="text-ink">core</span>, out to about 0.25&thinsp;R&#9737;, is where all the fusion happens. Above it the <span className="text-ink">radiative zone</span> is smooth and still: energy crosses it not by any bulk motion but as photons random-walking outward for tens of thousands of years. At <span className="text-ink">0.713&thinsp;R&#9737;</span> &mdash; the bright outer ring, a boundary helioseismology fixes to about 0.1% &mdash; hydrogen begins to recombine, the opacity soars, and radiation can no longer carry the flux: the outer envelope <span className="text-ink">convects</span>, churning bodily all the way to the surface you see in the other mode.
          </>
        ) : (
          <>
            The photosphere as a live procedural rendering: bright <span className="text-ink">granules</span> of hot rising gas, separated by darker lanes where cooler gas sinks back down &mdash; the visible tops of the convective cells this chapter derives, roughly a thousand kilometres across and turning over every eight to ten minutes on the real Sun. The disk dims and reddens toward the <span className="text-ink">limb</span> because an oblique line of sight escapes from a shallower, cooler layer. Switch to the cutaway to see the structure underneath.
          </>
        )}
      </figcaption>
    </figure>
  );
}
