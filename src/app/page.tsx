import prisma from "@/lib/prisma";

export default async function Home() {
  const chars = await prisma.character.findMany({ orderBy: { id: "desc" } });
  return (
    <main>
      <h1 className="font-bold text-9xl">Hello world</h1>
      <div>{JSON.stringify(chars[0])}</div>
      <h2 className="font-bold text-2xl">WWN Character Sheet</h2>
    </main>
  );
}
