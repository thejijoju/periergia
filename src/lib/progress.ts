"use client";

import { useCallback, useEffect, useState } from "react";
import type { Depth, Level } from "./types";
import { MODES, type Mode } from "./modes";

// Browser-saved progress + reader preferences. No accounts in v1 — everything
// lives in localStorage. Swappable for Supabase Auth + a `progress` table later.

const KEY = "periergia.v2";
// Previous key. The default reading prefs changed (deep-by-default), so on
// migration we keep the reader's progress but re-adopt the new default prefs
// instead of carrying the old medium/easy choice forward.
const LEGACY_KEY = "periergia.v1";

interface ProgressState {
  visited: string[]; // node ids opened
  completed: string[]; // node ids whose quiz was passed
  prefs: { depth: Depth; level: Level; mode: Mode };
}

const DEFAULT: ProgressState = {
  visited: [],
  completed: [],
  // Open at the deep, human-validated master version by default (masters are
  // authored at research/advanced). Simpler/shorter variants are one click away.
  prefs: { depth: "research", level: "advanced", mode: "read" },
};

function load(): ProgressState {
  if (typeof window === "undefined") return DEFAULT;
  try {
    const raw = window.localStorage.getItem(KEY);
    if (!raw) {
      // One-time migration from the previous key: keep the reader's progress,
      // but adopt the new deep-by-default prefs rather than the old ones.
      const legacy = window.localStorage.getItem(LEGACY_KEY);
      if (legacy) {
        const old = JSON.parse(legacy) as Partial<ProgressState>;
        return {
          visited: old.visited ?? [],
          completed: old.completed ?? [],
          prefs: DEFAULT.prefs,
        };
      }
      return DEFAULT;
    }
    const parsed = JSON.parse(raw) as Partial<ProgressState> & {
      prefs?: Partial<ProgressState["prefs"]> & { format?: string };
    };
    // Deep-merge prefs (a shallow spread would let old stored prefs wipe out
    // newer fields like `mode`), and migrate the legacy `format` pref.
    const prefs = { ...DEFAULT.prefs, ...(parsed.prefs ?? {}) };
    if (!parsed.prefs?.mode) {
      prefs.mode = parsed.prefs?.format === "voice" ? "listen" : "read";
    }
    // Guard against unknown/stale mode ids.
    if (!MODES.some((m) => m.id === prefs.mode)) prefs.mode = "read";
    return {
      visited: parsed.visited ?? [],
      completed: parsed.completed ?? [],
      prefs,
    };
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
