"use client";

import { useEffect, useState } from "react";

// Reads the current entry aloud via the Web Speech API (free, zero infra).
// Strips markdown to plain prose before speaking.
function toPlain(md: string): string {
  return md
    .replace(/[#>*_`~]/g, "")
    .replace(/\[(.*?)\]\(.*?\)/g, "$1")
    .replace(/\n{2,}/g, ". ")
    .replace(/\n/g, " ")
    .trim();
}

export function VoiceButton({ text }: { text: string }) {
  const [supported, setSupported] = useState(false);
  const [speaking, setSpeaking] = useState(false);

  useEffect(() => {
    setSupported(typeof window !== "undefined" && "speechSynthesis" in window);
    return () => {
      if (typeof window !== "undefined" && "speechSynthesis" in window) {
        window.speechSynthesis.cancel();
      }
    };
  }, []);

  // Stop speaking if the text changes (e.g. depth/level switched).
  useEffect(() => {
    if (typeof window !== "undefined" && "speechSynthesis" in window) {
      window.speechSynthesis.cancel();
      setSpeaking(false);
    }
  }, [text]);

  if (!supported) {
    return (
      <p className="font-sans italic text-[13px] text-faint">
        Audio narration needs a browser with speech support.
      </p>
    );
  }

  const toggle = () => {
    const synth = window.speechSynthesis;
    if (speaking) {
      synth.cancel();
      setSpeaking(false);
      return;
    }
    const utter = new SpeechSynthesisUtterance(toPlain(text));
    utter.rate = 1;
    utter.onend = () => setSpeaking(false);
    utter.onerror = () => setSpeaking(false);
    synth.cancel();
    synth.speak(utter);
    setSpeaking(true);
  };

  return (
    <button
      onClick={toggle}
      className="inline-flex items-center gap-2 font-sans text-[13.5px] text-ink border border-maroon rounded-full px-4 py-2 hover:bg-maroon hover:text-white transition-colors"
    >
      <svg width="15" height="16" viewBox="0 0 16 17" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round">
        {speaking ? (
          <>
            <rect x="4" y="3" width="3" height="11" rx="1" />
            <rect x="9" y="3" width="3" height="11" rx="1" />
          </>
        ) : (
          <polygon points="4,3 13,8.5 4,14" fill="currentColor" stroke="none" />
        )}
      </svg>
      {speaking ? "Pause narration" : "Listen to this entry"}
    </button>
  );
}
