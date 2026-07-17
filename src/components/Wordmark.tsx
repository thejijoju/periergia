import Link from "next/link";
import { t } from "@/lib/i18n";

// The underlined "Periergia" wordmark — Inter Semibold (600) with a black rule.
export function Wordmark({
  size = "lg",
  tagline = false,
  lang = "en",
}: {
  size?: "sm" | "lg";
  tagline?: boolean;
  lang?: string;
}) {
  // Real text underline (skips ink around the "g" descender), black rule.
  const text =
    size === "lg"
      ? "text-[32px] sm:text-[44px] lg:text-[52px] leading-none decoration-[2.5px] sm:decoration-[3px] underline-offset-[7px] sm:underline-offset-[10px]"
      : "text-[21px] leading-none decoration-[2px] underline-offset-[6px]";
  return (
    <div className={tagline ? "text-center" : ""}>
      <Link
        href="/"
        className={`inline-block font-sans font-semibold underline decoration-ink ${text} tracking-[-0.02em] text-ink`}
      >
        Periergia
      </Link>
      {tagline && (
        <div className="mt-4 sm:mt-5 font-sans text-[14px] sm:text-[16px] leading-[1.5] text-muted">
          {t(lang, "tagline")}
        </div>
      )}
    </div>
  );
}
