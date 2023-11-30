import prisma from "@/lib/prisma";
import { Metadata } from "next";
import { FocusCard } from "./FocusCard";
import Link from "next/link";

export const metadata: Metadata = {
  title: "Foci",
};

export default async function Foci() {
  const focuses = await prisma.focus.findMany({ orderBy: { id: "desc" } });
  return (
    <>
      <Link href="/dev/foci/create">Create a focus</Link>
      <FocusCard focuses={focuses} />
    </>
  );
}
