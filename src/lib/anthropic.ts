import "server-only";
import Anthropic from "@anthropic-ai/sdk";

// Lazy Claude client. The whole generation layer is gated on this being
// non-null so the app runs (with placeholders) when no key is configured.

let cached: Anthropic | null | undefined;

export function getAnthropic(): Anthropic | null {
  if (cached !== undefined) return cached;
  const apiKey = process.env.ANTHROPIC_API_KEY;
  cached = apiKey ? new Anthropic({ apiKey }) : null;
  return cached;
}

export function anthropicEnabled(): boolean {
  return getAnthropic() !== null;
}

/** Default to Opus 4.8; override with PERIERGIA_MODEL. */
export const MODEL = process.env.PERIERGIA_MODEL || "claude-opus-4-8";
