"use client";

import { useEffect, useRef, useState } from "react";

// Reader settings ("Aa" in the header): text size (A− / A+) and typeface for
// the article text. Stored in localStorage and applied to <html> — the layout's
// init script applies them before paint on every page, so there is no flash.
// --reader-scale and data-reader-font are read by .prose-reading (globals.css).
const STEPS = [0.85, 0.92, 1, 1.1, 1.2, 1.32, 1.46];
const FONTS = [
  { id: "sans", label: "Sans", sample: "font-sans" },
  { id: "serif", label: "Serif", sample: "font-serif" },
  { id: "readable", label: "Readable", sample: "" },
] as const;
type FontId = (typeof FONTS)[number]["id"];

function apply(scale: number, font: FontId) {
  const d = document.documentElement;
  d.style.setProperty("--reader-scale", String(scale));
  if (font === "sans") d.removeAttribute("data-reader-font");
  else d.setAttribute("data-reader-font", font);
  try {
    localStorage.setItem("reader-scale", String(scale));
    localStorage.setItem("reader-font", font);
  } catch {
    // private mode etc. — the choice still applies to this page
  }
}

export function ReaderSettings() {
  const [open, setOpen] = useState(false);
  const [scale, setScale] = useState(1);
  const [font, setFont] = useState<FontId>("sans");
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const d = document.documentElement;
    const s = parseFloat(getComputedStyle(d).getPropertyValue("--reader-scale"));
    if (s > 0) setScale(s);
    const f = d.getAttribute("data-reader-font");
    if (f === "serif" || f === "readable") setFont(f);
  }, []);

  useEffect(() => {
    if (!open) return;
    const onDoc = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    const onEsc = (e: KeyboardEvent) => e.key === "Escape" && setOpen(false);
    document.addEventListener("mousedown", onDoc);
    document.addEventListener("keydown", onEsc);
    return () => {
      document.removeEventListener("mousedown", onDoc);
      document.removeEventListener("keydown", onEsc);
    };
  }, [open]);

  const idx = STEPS.reduce((best, v, i) => (Math.abs(v - scale) < Math.abs(STEPS[best] - scale) ? i : best), 2);
  const setStep = (i: number) => {
    const next = STEPS[Math.max(0, Math.min(STEPS.length - 1, i))];
    setScale(next);
    apply(next, font);
  };
  const choose = (f: FontId) => {
    setFont(f);
    apply(scale, f);
  };

  const btn =
    "flex items-center justify-center h-9 rounded-lg border border-line text-ink hover:bg-pill disabled:opacity-35 disabled:hover:bg-transparent transition-colors";

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        aria-label="Text size and font"
        aria-haspopup="dialog"
        aria-expanded={open}
        title="Text size and font"
        className="shrink-0 px-2 py-1.5 rounded-full text-muted hover:text-ink hover:bg-pill transition-colors text-[15px] font-semibold leading-none"
      >
        <span className="text-[12px]">A</span>
        <span>a</span>
      </button>
      {open && (
        <div
          role="dialog"
          aria-label="Text size and font"
          className="absolute right-0 top-full mt-2 z-30 w-64 rounded-xl border border-line bg-page shadow-lg p-3 font-sans"
        >
          <p className="text-[12px] uppercase tracking-wide text-faint mb-2">Text size</p>
          <div className="grid grid-cols-[1fr_auto_1fr] items-center gap-2 mb-4">
            <button type="button" className={btn} onClick={() => setStep(idx - 1)} disabled={idx === 0} aria-label="Smaller text">
              <span className="text-[13px]">A−</span>
            </button>
            <button
              type="button"
              onClick={() => setStep(2)}
              className="text-[13px] text-muted hover:text-ink min-w-[3.5rem] text-center"
              title="Reset to 100%"
            >
              {Math.round(STEPS[idx] * 100)}%
            </button>
            <button type="button" className={btn} onClick={() => setStep(idx + 1)} disabled={idx === STEPS.length - 1} aria-label="Larger text">
              <span className="text-[17px]">A+</span>
            </button>
          </div>
          <p className="text-[12px] uppercase tracking-wide text-faint mb-2">Font</p>
          <div className="grid grid-cols-3 gap-2">
            {FONTS.map((f) => (
              <button
                key={f.id}
                type="button"
                onClick={() => choose(f.id)}
                aria-pressed={font === f.id}
                className={`${btn} flex-col h-auto py-2 ${font === f.id ? "border-purple text-purple" : ""}`}
                style={f.id === "readable" ? { fontFamily: "var(--font-atkinson), Verdana, sans-serif" } : undefined}
              >
                <span className={`text-[18px] leading-none ${f.sample}`}>Ag</span>
                <span className="text-[11px] mt-1 font-sans">{f.label}</span>
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
