"use client";

import { useCallback, useEffect, useState } from "react";
import type { Depth, Level } from "./types";
import type { Mode } from "./modes";

// Browser-saved progress + reader preferences. No accounts in v1 — everything
// lives in localStorage. Swappable for Supabase Auth + a `progress` table later.

const KEY = "periergia.v1";

interface ProgressState {
  visited: string[]; // node ids opened
  completed: string[]; // node ids whose quiz was passed
  prefs: { depth: Depth; level: Level; mode: Mode };
}

const DEFAULT: ProgressState = {
  visited: [],
  completed: [],
  prefs: { depth: "medium", level: "easy", mode: "read" },
};

function load(): ProgressState {
  if (typeof window === "undefined") return DEFAULT;
  try {
    const raw = window.localStorage.getItem(KEY);
    if (!raw) return DEFAULT;
    return { ...DEFAULT, ...JSON.parse(raw) };
  } catch {
    return DEFAULT;
  }
}

export function useProgress() {
  const [state, setState] = useState<ProgressState>(DEFAULT);
  const [hydrated, setHydrated] = useState(false);

  useEffect(() => {
    // eslint-disable-next-line react-hooks/set-state-in-effect -- one-time localStorage hydration
    setState(load());
    setHydrated(true);
  }, []);

  const persist = useCallback((next: ProgressState) => {
    setState(next);
    try {
      window.localStorage.setItem(KEY, JSON.stringify(next));
    } catch {
      /* storage unavailable — keep in-memory */
    }
  }, []);

  const markVisited = useCallback(
    (nodeId: string) => {
      setState((prev) => {
        if (prev.visited.includes(nodeId)) return prev;
        const next = { ...prev, visited: [...prev.visited, nodeId] };
        try {
          window.localStorage.setItem(KEY, JSON.stringify(next));
        } catch {
          /* ignore */
        }
        return next;
      });
    },
    [],
  );

  const markCompleted = useCallback(
    (nodeId: string) => {
      setState((prev) => {
        if (prev.completed.includes(nodeId)) return prev;
        const next = { ...prev, completed: [...prev.completed, nodeId] };
        try {
          window.localStorage.setItem(KEY, JSON.stringify(next));
        } catch {
          /* ignore */
        }
        return next;
      });
    },
    [],
  );

  const setPrefs = useCallback(
    (prefs: Partial<ProgressState["prefs"]>) => {
      persist({ ...state, prefs: { ...state.prefs, ...prefs } });
    },
    [persist, state],
  );

  return { state, hydrated, markVisited, markCompleted, setPrefs };
}
