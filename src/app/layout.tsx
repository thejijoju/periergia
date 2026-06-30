import type { Metadata } from "next";
import { Spectral } from "next/font/google";
import "./globals.css";

const spectral = Spectral({
  subsets: ["latin"],
  weight: ["300", "400", "500", "600", "700"],
  style: ["normal", "italic"],
  variable: "--font-spectral",
  display: "swap",
});

export const metadata: Metadata = {
  title: "Periergia — a free library of everything worth knowing",
  description:
    "A living textbook for everything. Search any topic, then read it, listen to it, and test yourself — tuned to your depth, level, and way of learning.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={spectral.variable}>
      <body>{children}</body>
    </html>
  );
}
