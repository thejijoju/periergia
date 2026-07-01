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
      ? "text-[34px] sm:text-[46px] lg:text-[56px] leading-none border-b-[2.5px] sm:border-b-[3px] pb-[7px] sm:pb-[10px]"
      : "text-[22px] leading-none border-b-[2.5px] pb-[7px]";
  return (
    <div className={tagline ? "text-center" : ""}>
      <Link
        href="/"
        className={`inline-block font-serif font-bold ${text} tracking-[-0.01em] border-maroon text-ink`}
      >
        Periergia
      </Link>
      {tagline && (
        <div className="mt-3 sm:mt-5 font-serif italic text-[13.5px] sm:text-[17px] leading-[1.5] text-muted">
          A free library of everything worth knowing.
        </div>
      )}
    </div>
  );
}
