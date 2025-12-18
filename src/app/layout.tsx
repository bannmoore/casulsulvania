import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import Link from "next/link";
import { logout } from "./actions";
import { getSessionUser } from "@/util/auth";
import { config } from "@/config";
import type { Viewport } from "next";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Casulsulvania" + (config.env === "development" ? " [DEV]" : ""),
};

export const viewport: Viewport = {
  width: "device-width",
  initialScale: 1.0,
};

export default async function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const user = await getSessionUser();

  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased`}
      >
        <header className="container m-auto flex p-4 items-center">
          <Link href="/">Casulsulvania</Link>
          <div className="flex-1">
            {user && (
              <div className="flex items-center justify-end gap-4">
                <form
                  action={async () => {
                    "use server";
                    await logout();
                  }}
                >
                  <button role="link" type="submit">
                    Log Out
                  </button>
                </form>
              </div>
            )}
          </div>
        </header>
        <main className="container m-auto p-4">{children}</main>
        <footer className="container m-auto p-4 mt-8">
          <p>&copy; Brittany Ann Moore, 2025</p>
          <p>This website is not endorsed by or affiliated with EA.</p>
        </footer>
      </body>
    </html>
  );
}
