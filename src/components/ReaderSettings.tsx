"use client";

import { useEffect, useRef, useState } from "react";

// Reader settings ("Aa" in the header): text size (A− / A+, or type a % from
// 80 to 160) and typeface for
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
  const [draft, setDraft] = useState("100");
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const d = document.documentElement;
    const s = parseFloat(getComputedStyle(d).getPropertyValue("--reader-scale"));
    if (s > 0) {
      setScale(s);
      setDraft(String(Math.round(s * 100)));
    }
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

  const MIN = 80;
  const MAX = 160;
  const setPct = (pct: number) => {
    const clamped = Math.max(MIN, Math.min(MAX, Math.round(pct)));
    const next = clamped / 100;
    setScale(next);
    setDraft(String(clamped));
    apply(next, font);
  };
  // A− / A+ jump to the next step below / above the current size, so a typed
  // value like 113% still moves in sensible steps.
  const smaller = () => {
    const lower = [...STEPS].reverse().find((v) => v < scale - 0.001);
    setPct((lower ?? MIN / 100) * 100);
  };
  const larger = () => {
    const higher = STEPS.find((v) => v > scale + 0.001);
    setPct((higher ?? MAX / 100) * 100);
  };
  const commitDraft = () => {
    const n = parseFloat(draft.replace(",", "."));
    if (Number.isFinite(n)) setPct(n);
    else setDraft(String(Math.round(scale * 100)));
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
            <button type="button" className={btn} onClick={smaller} disabled={scale <= MIN / 100 + 0.001} aria-label="Smaller text">
              <span className="text-[13px]">A−</span>
            </button>
            <label className="flex items-center justify-center gap-0.5 h-9 px-2 rounded-lg border border-line focus-within:border-purple">
              <span className="sr-only">Text size in percent ({MIN}–{MAX})</span>
              <input
                type="text"
                inputMode="numeric"
                value={draft}
                onChange={(e) => setDraft(e.target.value.replace(/[^0-9.,]/g, "").slice(0, 5))}
                onBlur={commitDraft}
                onKeyDown={(e) => {
                  if (e.key === "Enter") {
                    e.preventDefault();
                    commitDraft();
                  }
                }}
                className="w-10 bg-transparent text-right text-[13px] text-ink outline-none"
                aria-label={`Text size in percent (${MIN}–${MAX})`}
              />
              <span className="text-[13px] text-muted">%</span>
            </label>
            <button type="button" className={btn} onClick={larger} disabled={scale >= MAX / 100 - 0.001} aria-label="Larger text">
              <span className="text-[17px]">A+</span>
            </button>
          </div>
          <button type="button" onClick={() => setPct(100)} className="-mt-2 mb-3 text-[12px] text-muted hover:text-ink underline underline-offset-2">
            Reset to 100%
          </button>
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
