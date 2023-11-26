"use client";

import Link from "next/link";

export default function DevCreators() {
  return (
    <ul>
      <li>
        <Link href="/dev/foci">Foci</Link>
      </li>
      <li>
        <Link href="/dev/art">Art</Link>
      </li>
      <li>
        <Link href="/dev/spell">Spell</Link>
      </li>
    </ul>
  );
}
