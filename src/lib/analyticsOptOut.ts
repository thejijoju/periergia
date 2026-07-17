// Owner / self-visit exclusion for analytics.
//
// Visiting any page with `?mine` sets a flag in the browser's localStorage;
// from then on BOTH analytics paths skip this browser — Vercel Web Analytics
// (via a beforeSend in AnalyticsGate) and the self-hosted /api/track beacon (a
// guard in Reader). This keeps the site owner's own refreshing out of the
// visitor numbers. Visit `?mine=0` or `?trackme` to start counting again.
//
// It is per-browser, not per-user: set it once in each browser/device you use
// to view the live site.

export const EXCLUDE_KEY = "periergia_exclude";

// True when this browser has opted out of analytics.
export function isExcludedVisitor(): boolean {
  if (typeof window === "undefined") return false;
  try {
    return window.localStorage.getItem(EXCLUDE_KEY) === "1";
  } catch {
    return false;
  }
}

// Read the URL for the opt-out toggle and persist it. Returns the new state
// when the URL changed it (so the caller can confirm to the user), else null.
export function syncExcludeFromUrl(): boolean | null {
  if (typeof window === "undefined") return null;
  try {
    const q = new URLSearchParams(window.location.search);
    if (q.has("mine")) {
      const on = q.get("mine") !== "0" && q.get("mine") !== "false";
      if (on) window.localStorage.setItem(EXCLUDE_KEY, "1");
      else window.localStorage.removeItem(EXCLUDE_KEY);
      return on;
    }
    if (q.has("trackme")) {
      window.localStorage.removeItem(EXCLUDE_KEY);
      return false;
    }
  } catch {
    // ignore — never let analytics wiring break a page
  }
  return null;
}
