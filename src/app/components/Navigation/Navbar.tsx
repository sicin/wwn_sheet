"use client";

import { usePathname } from "next/navigation";
import Link from "next/link";

export const Navbar = () => {
  const pathname = usePathname();
  return (
    <header>
      <nav className="mb-2">
        <ul className="flex bg-slate-300">
          <li className="mr-6">logo</li>
          <li className="mr-6">
            <Link
              className={`${
                pathname === "/" ? "bg-blue-950 text-blue-200" : "text-gray-800"
              } hover:text-blue-800`}
              href="/"
            >
              Home
            </Link>
          </li>
          <li className="mr-6">
            <Link
              className={`${
                pathname === "/dev"
                  ? "bg-blue-950 text-blue-200"
                  : "text-gray-800"
              } hover:text-blue-800`}
              href="/dev"
            >
              Dev Tools
            </Link>
          </li>
          <li className="mr-6">
            <Link
              className={`${
                pathname === "/create"
                  ? "bg-blue-950 text-blue-200"
                  : "text-gray-800"
              } hover:text-blue-800`}
              href="/create"
            >
              Create Character
            </Link>
          </li>
          <li className="mr-6">
            <Link
              className={`${
                pathname === "/char-sheet"
                  ? "bg-blue-950 text-blue-200"
                  : "text-gray-800"
              } hover:text-blue-800`}
              href="/char-sheet"
            >
              Character Sheet
            </Link>
          </li>
        </ul>
      </nav>
    </header>
  );
};
