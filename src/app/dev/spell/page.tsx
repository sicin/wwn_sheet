import { SpellCard } from "@/app/components/Spell/SpellCard";
import { Metadata } from "next";
import prisma from "@/lib/prisma";

export const metadata: Metadata = {
  title: "Spells",
};

export default async function Spells() {
  const spells = await prisma.spell.findMany({ orderBy: { id: "desc" } });
  return <SpellCard spells={spells} />;
}
