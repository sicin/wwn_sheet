import { Metadata } from "next";
import prisma from "@/lib/prisma";
import { CharacterSheetComponent } from "./CharacterSheet";

export const metadata: Metadata = {
  title: "Character Sheet",
};

export default async function CharacterSheet() {
  const chars = await prisma.character.findMany({ orderBy: { id: "desc" } });

  return (
    <>
      <h1 className="text-2xl font-bold">WWN Character Sheet</h1>
      <CharacterSheetComponent characters={chars} />
    </>
  );
}
