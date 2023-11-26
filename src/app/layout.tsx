import type { Metadata, Viewport } from "next";
import { Averia_Sans_Libre } from "next/font/google";
import "./globals.css";

const averia = Averia_Sans_Libre({
  weight: ["400", "700"],
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "WWN Character Sheet",
  description: "Worlds Without Number Character Sheet",
  authors: { name: "Ryszard Siciński" },
  icons: { icon: "./favicon.ico" },
};

export const viewport: Viewport = {
  themeColor: "white",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className={averia.className}>{children}</body>
    </html>
  );
}
