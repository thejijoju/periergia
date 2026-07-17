"use client";

import { useEffect, useRef, useState } from "react";
import { LANGS, LANG_COOKIE, normalizeLang, getLang } from "@/lib/i18n";

function readCookie(name: string): string | null {
  if (typeof document === "undefined") return null;
  const m = document.cookie.match(new RegExp("(?:^|; )" + name + "=([^;]*)"));
  return m ? decodeURIComponent(m[1]) : null;
}

// Header language picker: shows the current language with a caret and opens a
// scrollable list of all supported languages. Choosing one stores a cookie and
// reloads so the server re-renders the page (and article) in that language.
export function LanguageSwitcher() {
  const [open, setOpen] = useState(false);
  const [lang, setLang] = useState("en");
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    setLang(normalizeLang(readCookie(LANG_COOKIE)));
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

  const choose = (code: string) => {
    document.cookie = `${LANG_COOKIE}=${code}; path=/; max-age=31536000; samesite=lax`;
    setOpen(false);
    window.location.reload();
  };

  const current = getLang(lang);
  const label = current.code === "en" ? "Eng" : current.nativeName;

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        aria-label="Language"
        aria-haspopup="listbox"
        aria-expanded={open}
        className="flex items-center gap-1 text-[13px] text-muted hover:text-purple transition-colors px-1.5 py-1 rounded-md"
      >
        <span className="max-w-[10ch] truncate">{label}</span>
        <svg width="10" height="10" viewBox="0 0 12 12" fill="none" stroke="currentColor" strokeWidth="1.6">
          <path d="M2.5 4.5 6 8l3.5-3.5" strokeLinecap="round" strokeLinejoin="round" />
        </svg>
      </button>
      {open && (
        <ul
          role="listbox"
          className="absolute right-0 mt-1 max-h-72 w-48 overflow-y-auto rounded-xl border border-line bg-page shadow-lg py-1 z-30"
        >
          {LANGS.map((l) => (
            <li key={l.code}>
              <button
                type="button"
                onClick={() => choose(l.code)}
                dir={l.rtl ? "rtl" : "ltr"}
                className={`w-full text-left px-3 py-1.5 text-[13px] hover:bg-pill transition-colors flex items-center justify-between gap-2 ${
                  l.code === lang ? "text-purple font-medium" : "text-ink"
                }`}
              >
                <span>{l.nativeName}</span>
                <span className="text-[11px] text-faint">{l.englishName.split(/[ (]/)[0]}</span>
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
