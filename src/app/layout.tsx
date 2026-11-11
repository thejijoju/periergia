import type { Metadata } from "next";
import { Atkinson_Hyperlegible, Inter, Spectral } from "next/font/google";
import { AnalyticsGate } from "@/components/AnalyticsGate";
import "./globals.css";
import { SITE_URL } from "@/lib/site";

// Inter drives the modern, "younger" UI (Medium-like). Spectral stays available
// for long-form reading in the reader.
const inter = Inter({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700", "800"],
  variable: "--font-inter",
  display: "swap",
});

const spectral = Spectral({
  subsets: ["latin"],
  weight: ["300", "400", "500", "600", "700"],
  style: ["normal", "italic"],
  variable: "--font-spectral",
  display: "swap",
});

// Atkinson Hyperlegible: the "Readable" choice in the reader settings, designed
// for low-vision readers (clearly distinct letter shapes).
const atkinson = Atkinson_Hyperlegible({
  subsets: ["latin"],
  weight: ["400", "700"],
  style: ["normal", "italic"],
  variable: "--font-atkinson",
  display: "swap",
});

export const metadata: Metadata = {
  metadataBase: new URL(SITE_URL),
  title: "Periergia — a free library of everything worth knowing",
  description:
    "A living textbook for everything. Search any topic, then read it, listen to it, and test yourself — tuned to your depth, level, and way of learning.",
  manifest: "/manifest.json",
};

// Dark is the default. This runs before paint: if the visitor previously chose
// light, flip the attribute now so there's no flash of the wrong theme.
// The reader's text size and typeface (ReaderSettings) are applied the same way.
const themeInit = `(function(){try{var d=document.documentElement;var t=localStorage.getItem('theme');if(t==='light')d.setAttribute('data-theme','light');var s=parseFloat(localStorage.getItem('reader-scale'));if(s>=0.8&&s<=1.6)d.style.setProperty('--reader-scale',String(s));var f=localStorage.getItem('reader-font');if(f==='serif'||f==='readable')d.setAttribute('data-reader-font',f);}catch(e){}})();`;

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" data-theme="dark" suppressHydrationWarning className={`${inter.variable} ${spectral.variable} ${atkinson.variable}`}>
      <head>
        <script dangerouslySetInnerHTML={{ __html: themeInit }} />
      </head>
      <body>
        {children}
        <AnalyticsGate />
      </body>
    </html>
  );
}
