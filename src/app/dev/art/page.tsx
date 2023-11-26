import prisma from "@/lib/prisma";
import { ArtCard } from "@/app/components/Art/ArtCard";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Arts",
};

export default async function Arts() {
  const arts = await prisma.art.findMany({ orderBy: { id: "desc" } });
  return <ArtCard arts={arts} />;
}
