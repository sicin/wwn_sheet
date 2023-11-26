import prisma from "@/lib/prisma";
import { CharacterSheetComponent } from "./components/Character/CharacterSheet";

export default async function Home() {
  const chars = await prisma.character.findMany({ orderBy: { id: "desc" } });
  return (
    <main>
      <h1 className="text-2xl font-bold">WWN Character Sheet</h1>
      <CharacterSheetComponent character={chars[0]} />
    </main>
  );
}
