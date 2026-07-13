import type { Metadata } from "next";
import { Inter, Spectral } from "next/font/google";
import { Analytics } from "@vercel/analytics/next";
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

export const metadata: Metadata = {
  metadataBase: new URL(SITE_URL),
  title: "Periergia — a free library of everything worth knowing",
  description:
    "A living textbook for everything. Search any topic, then read it, listen to it, and test yourself — tuned to your depth, level, and way of learning.",
  manifest: "/manifest.json",
};

// Dark is the default. This runs before paint: if the visitor previously chose
// light, flip the attribute now so there's no flash of the wrong theme.
const themeInit = `(function(){try{var t=localStorage.getItem('theme');if(t==='light')document.documentElement.setAttribute('data-theme','light');}catch(e){}})();`;

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" data-theme="dark" className={`${inter.variable} ${spectral.variable}`}>
      <head>
        <script dangerouslySetInnerHTML={{ __html: themeInit }} />
      </head>
      <body>
        {children}
        <Analytics />
      </body>
    </html>
  );
}
