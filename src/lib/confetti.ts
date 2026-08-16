// ── Confetti ──────────────────────────────────────────────────────────────
// A short celebratory burst for a correct answer. Dependency-free: one
// full-screen canvas, ~2 seconds of particles under gravity, then gone.
// Deliberately restrained — the drills are answered hundreds of times, so
// the default burst is small and quick; callers pass a bigger count at
// streak milestones. Respects prefers-reduced-motion by doing nothing.

type Opts = {
  x?: number; // viewport coords of the burst origin; defaults to centre
  y?: number;
  count?: number;
};

const COLORS = ["#8b1e3f", "#6d28d9", "#d97706", "#059669", "#2563eb", "#db2777"];
const DURATION = 1800; // ms

let activeCanvas: HTMLCanvasElement | null = null;

export function fireConfetti(opts: Opts = {}) {
  if (typeof window === "undefined" || typeof document === "undefined") return;
  if (window.matchMedia?.("(prefers-reduced-motion: reduce)").matches) return;

  // One canvas at a time — rapid-fire correct answers reuse the burst rather
  // than stacking canvases.
  if (activeCanvas) activeCanvas.remove();

  const canvas = document.createElement("canvas");
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  canvas.style.cssText =
    "position:fixed;inset:0;width:100%;height:100%;pointer-events:none;z-index:9999";
  document.body.appendChild(canvas);
  activeCanvas = canvas;

  const ctx = canvas.getContext("2d");
  if (!ctx) {
    canvas.remove();
    activeCanvas = null;
    return;
  }

  const ox = opts.x ?? window.innerWidth / 2;
  const oy = opts.y ?? window.innerHeight * 0.35;
  const count = Math.min(opts.count ?? 60, 220);

  const parts = Array.from({ length: count }, () => {
    const angle = -Math.PI / 2 + (Math.random() - 0.5) * Math.PI * 0.9; // upward cone
    const speed = 4 + Math.random() * 7;
    return {
      x: ox,
      y: oy,
      vx: Math.cos(angle) * speed,
      vy: Math.sin(angle) * speed,
      w: 5 + Math.random() * 5,
      h: 3 + Math.random() * 4,
      rot: Math.random() * Math.PI,
      vrot: (Math.random() - 0.5) * 0.3,
      color: COLORS[Math.floor(Math.random() * COLORS.length)],
      drag: 0.985 - Math.random() * 0.01,
    };
  });

  const start = performance.now();

  const tick = (now: number) => {
    const t = now - start;
    if (t > DURATION || activeCanvas !== canvas) {
      canvas.remove();
      if (activeCanvas === canvas) activeCanvas = null;
      return;
    }
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    // Fade everything out over the last 400ms.
    ctx.globalAlpha = t > DURATION - 400 ? (DURATION - t) / 400 : 1;
    for (const p of parts) {
      p.vy += 0.18; // gravity
      p.vx *= p.drag;
      p.vy *= p.drag;
      p.x += p.vx;
      p.y += p.vy;
      p.rot += p.vrot;
      ctx.save();
      ctx.translate(p.x, p.y);
      ctx.rotate(p.rot);
      ctx.fillStyle = p.color;
      ctx.fillRect(-p.w / 2, -p.h / 2, p.w, p.h);
      ctx.restore();
    }
    requestAnimationFrame(tick);
  };
  requestAnimationFrame(tick);
}
