import type { Metadata } from "next";
import { Inter, Spectral } from "next/font/google";
import "./globals.css";

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
  metadataBase: new URL(process.env.NEXT_PUBLIC_SITE_URL ?? "https://periergia.vercel.app"),
  title: "Periergia — a free library of everything worth knowing",
  description:
    "A living textbook for everything. Search any topic, then read it, listen to it, and test yourself — tuned to your depth, level, and way of learning.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${inter.variable} ${spectral.variable}`}>
      <body>{children}</body>
    </html>
  );
}
