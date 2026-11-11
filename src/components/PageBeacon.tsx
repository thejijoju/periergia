"use client";

import { useEffect } from "react";
import { isExcludedVisitor } from "@/lib/analyticsOptOut";

// Reports one article view to the demand log (/api/page-request) after the page
// has loaded. It used to be logged on the server while rendering, which forced
// every visit to be rendered from scratch; the page is cached now, so the visit
// is reported from the browser instead. Skips the owner's own browser (?mine).
export function PageBeacon({
  nodeId,
  title,
  path,
  cold,
}: {
  nodeId: string;
  title: string;
  path: string;
  cold: boolean;
}) {
  useEffect(() => {
    if (isExcludedVisitor()) return;
    try {
      fetch("/api/page-request", {
        method: "POST",
        headers: { "content-type": "application/json" },
        body: JSON.stringify({ nodeId, title, path, cold, referrer: document.referrer || null }),
        keepalive: true,
      }).catch(() => {});
    } catch {
      // Logging must never break the page.
    }
  }, [nodeId, title, path, cold]);
  return null;
}
