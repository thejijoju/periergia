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
      colors: {
        ink: "#211d18",
        maroon: "#7c2d2d",
        muted: "#6b6258",
        faint: "#8a8076",
        whisper: "#a59a8a",
        numeral: "#bbae9c",
        pill: "#f0e9da",
        line: "rgba(33,29,24,.14)",
      },
      fontFamily: {
        serif: ["Spectral", "Georgia", "serif"],
        mono: ["ui-monospace", "Menlo", "monospace"],
      },
    },
  },
  plugins: [typography],
};

export default config;
