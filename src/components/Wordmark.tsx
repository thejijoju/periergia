import Link from "next/link";

// The underlined "Periergia" wordmark — Inter Medium (500) with a black rule.
export function Wordmark({
  size = "lg",
  tagline = false,
}: {
  size?: "sm" | "lg";
  tagline?: boolean;
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
        className={`inline-block font-sans font-medium underline decoration-ink ${text} tracking-[-0.02em] text-ink`}
      >
        Periergia
      </Link>
      {tagline && (
        <div className="mt-4 sm:mt-5 font-sans text-[14px] sm:text-[16px] leading-[1.5] text-muted">
          A free library of everything worth knowing.
        </div>
      )}
    </div>
  );
}
