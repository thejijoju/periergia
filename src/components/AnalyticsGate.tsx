"use client";

import { useEffect } from "react";
import { Analytics } from "@vercel/analytics/next";
import { isExcludedVisitor, syncExcludeFromUrl } from "@/lib/analyticsOptOut";

// Wraps Vercel Web Analytics so we can (a) honor the `?mine` owner-exclusion
// flag and (b) drop events from an opted-out browser via beforeSend. Kept as a
// tiny client component because beforeSend is a function and can't be passed
// from the server-rendered layout.
export function AnalyticsGate() {
  useEffect(() => {
    const changed = syncExcludeFromUrl();
    if (changed === true) {
      // eslint-disable-next-line no-console
      console.log("[periergia] Your visits are now EXCLUDED from analytics on this browser.");
    } else if (changed === false) {
      // eslint-disable-next-line no-console
      console.log("[periergia] Your visits are now COUNTED in analytics on this browser.");
    }
  }, []);

  return <Analytics beforeSend={(event) => (isExcludedVisitor() ? null : event)} />;
}
