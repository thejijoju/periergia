import type { Config } from "tailwindcss";
import typography from "@tailwindcss/typography";

/**
 * Periergia "Reading Room" design system — distilled from Periergia.dc.html (3a/2a).
 * Spectral serif, ink #211d18, maroon accent #7c2d2d, warm muted greys, white ground.
 */
const config: Config = {
  content: [
    "./src/app/**/*.{ts,tsx}",
    "./src/components/**/*.{ts,tsx}",
  ],
  theme: {
    extend: {
      // Colors are CSS variables so the whole app flips with the theme.
      // Values live in globals.css (:root = dark default, [data-theme=light]).
      colors: {
        page: "var(--c-page)",
        card: "var(--c-card)",
        ink: "var(--c-ink)",
        maroon: "var(--c-maroon)",
        purple: "var(--c-purple)",
        "purple-soft": "var(--c-purple-soft)",
        muted: "var(--c-muted)",
        faint: "var(--c-faint)",
        whisper: "var(--c-whisper)",
        numeral: "var(--c-numeral)",
        pill: "var(--c-pill)",
        line: "var(--c-line)",
      },
      fontFamily: {
        sans: ["var(--font-inter)", "system-ui", "sans-serif"],
        serif: ["var(--font-spectral)", "Georgia", "serif"],
        mono: ["ui-monospace", "Menlo", "monospace"],
      },
    },
  },
  plugins: [typography],
};

export default config;
