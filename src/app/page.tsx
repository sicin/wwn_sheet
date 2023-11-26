import prisma from "@/lib/prisma";

export default async function Home() {
  const chars = await prisma.character.findMany({ orderBy: { id: "desc" } });
  return (
    <main>
      <h1 className="text-9xl font-bold">Hello world</h1>
      <div>{JSON.stringify(chars[0])}</div>
      <h2 className="text-2xl font-bold">WWN Character Sheet</h2>
    </main>
  );
}
