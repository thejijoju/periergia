import Link from "next/link";

// The underlined "Periergia" wordmark from the design (Spectral 700, maroon rule).
export function Wordmark({
  size = "lg",
  tagline = false,
}: {
  size?: "sm" | "lg";
  tagline?: boolean;
}) {
  const text =
    size === "lg"
      ? "text-[32px] sm:text-[44px] lg:text-[52px] leading-none border-b-[2.5px] sm:border-b-[3px] pb-[6px] sm:pb-[9px]"
      : "text-[21px] leading-none border-b-[2.5px] pb-[5px]";
  return (
    <div className={tagline ? "text-center" : ""}>
      <Link
        href="/"
        className={`inline-block font-sans font-extrabold ${text} tracking-[-0.03em] border-maroon text-ink`}
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
