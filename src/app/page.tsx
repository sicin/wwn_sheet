import prisma from "@/lib/prisma";
import { CharacterSheetComponent } from "./components/Character/CharacterSheet";
import { d6Throw, doubleThrow } from "@/lib/diceThrows";

export default async function Home() {
  const chars = await prisma.character.findMany({ orderBy: { id: "desc" } });
  const randomThrow = doubleThrow(d6Throw);

  return (
    <main>
      <h1 className="text-2xl font-bold">WWN Character Sheet</h1>
      <h2>Random 2xd6 throw: {randomThrow}</h2>
      <CharacterSheetComponent character={chars[0]} />
    </main>
  );
}
