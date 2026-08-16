"use client";

import { useCallback, useEffect, useState } from "react";

// ── Local exercise completion ─────────────────────────────────────────────
// Which exercises on which pages this reader has completed, kept in
// localStorage until accounts exist to hold it server-side. An id is the
// page path plus the exercise's identity (drill kind, checkpoint hash), so
// the same drill on two lessons tracks separately. "Done" is decided by the
// widget: a checkpoint when finished, a drill after three correct answers.
//
// The hook starts false and reads storage in an effect, so server and first
// client render agree (nothing is "done" during SSR) and the badge appears a
// tick later — invisible in practice, hydration-safe by construction.

const KEY = "periergia_exercise_done";

function load(): Record<string, 1> {
  try {
    const raw = window.localStorage.getItem(KEY);
    return raw ? (JSON.parse(raw) as Record<string, 1>) : {};
  } catch {
    return {};
  }
}

// Tiny stable hash for checkpoint specs (no crypto needed — just identity).
export function specHash(s: string): string {
  let h = 5381;
  for (let i = 0; i < Math.min(s.length, 400); i++) h = ((h << 5) + h + s.charCodeAt(i)) | 0;
  return (h >>> 0).toString(36);
}

export function useExerciseDone(kind: string): { done: boolean; markDone: () => void } {
  const [done, setDone] = useState(false);
  const [id, setId] = useState<string | null>(null);

  useEffect(() => {
    const full = `${window.location.pathname}#${kind}`;
    setId(full);
    setDone(!!load()[full]);
  }, [kind]);

  const markDone = useCallback(() => {
    setDone(true);
    if (!id) return;
    try {
      const d = load();
      if (!d[id]) {
        d[id] = 1;
        window.localStorage.setItem(KEY, JSON.stringify(d));
      }
    } catch {
      /* private mode — the badge lives for this session only */
    }
  }, [id]);

  return { done, markDone };
}
