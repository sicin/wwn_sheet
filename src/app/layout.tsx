import type { Metadata } from "next";
import { Averia_Sans_Libre } from "next/font/google";
import "./globals.css";

const averia = Averia_Sans_Libre({
  weight: ["400", "700"],
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "WWN_SHEET App",
  description: "Worlds Without Number Character Sheet",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <head>
        <title>Layout.tsx</title>
        <meta charSet="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="author" content="Richard Sicinski" />
        <link rel="icon" href="/favicon.ico" />
        <meta name="theme-color" content="#ffffff" />
      </head>
      <body className={averia.className}>{children}</body>
    </html>
  );
}
