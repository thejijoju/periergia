"use client";

import { useEffect, useRef, useState } from "react";

// Rounded search field with a maroon voice-search mic (Web Speech API).
// Speech recognition is progressive-enhancement: the mic only appears when the
// browser supports it.
export function SearchBar({
  value,
  onChange,
  placeholder = "Search any topic…",
  size = "lg",
}: {
  value: string;
  onChange: (v: string) => void;
  placeholder?: string;
  size?: "sm" | "lg";
}) {
  const [supportsVoice, setSupportsVoice] = useState(false);
  const [listening, setListening] = useState(false);
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const recognitionRef = useRef<any>(null);

  useEffect(() => {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const w = window as any;
    const SR = w.SpeechRecognition || w.webkitSpeechRecognition;
    if (SR) {
      setSupportsVoice(true);
      const rec = new SR();
      rec.continuous = false;
      rec.interimResults = false;
      rec.lang = "en-US";
      rec.onresult = (e: { results: { [k: number]: { [k: number]: { transcript: string } } } }) => {
        onChange(e.results[0][0].transcript);
      };
      rec.onend = () => setListening(false);
      recognitionRef.current = rec;
    }
    return () => recognitionRef.current?.abort?.();
    // onChange is stable enough for this one-time setup
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const toggleVoice = () => {
    const rec = recognitionRef.current;
    if (!rec) return;
    if (listening) {
      rec.stop();
      setListening(false);
    } else {
      try {
        rec.start();
        setListening(true);
      } catch {
        /* already started */
      }
    }
  };

  const pad = size === "lg" ? "px-[17px] py-[11px]" : "px-4 py-2";
  const textSize = size === "lg" ? "text-[14px]" : "text-[13px]";

  return (
    <div className={`flex items-center gap-[10px] border-[1.5px] border-ink rounded-full ${pad}`}>
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none" stroke="#211d18" strokeWidth="1.6">
        <circle cx="7" cy="7" r="5" />
        <line x1="11" y1="11" x2="15" y2="15" />
      </svg>
      <input
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className={`flex-1 bg-transparent outline-none font-serif italic ${textSize} text-ink placeholder:text-faint`}
      />
      {supportsVoice && (
        <button
          type="button"
          onClick={toggleVoice}
          aria-label="Voice search"
          className={listening ? "text-maroon animate-pulse" : "text-maroon"}
        >
          <svg width="16" height="17" viewBox="0 0 16 17" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round">
            <rect x="6" y="2" width="4" height="7" rx="2" />
            <path d="M3.5 7.5a4.5 4.5 0 0 0 9 0" />
            <line x1="8" y1="12" x2="8" y2="14.5" />
          </svg>
        </button>
      )}
    </div>
  );
}
