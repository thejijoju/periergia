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
      ? "text-[34px] leading-none"
      : "text-[22px] leading-none";
  return (
    <div className={tagline ? "text-center" : ""}>
      <Link
        href="/"
        className={`inline-block font-serif font-bold ${text} tracking-[-0.01em] border-b-[2.5px] border-maroon pb-[7px] text-ink`}
      >
        Periergia
      </Link>
      {tagline && (
        <div className="mt-3 font-serif italic text-[13.5px] leading-[1.5] text-muted">
          A free library of everything
          <br />
          worth knowing.
        </div>
      )}
    </div>
  );
}
