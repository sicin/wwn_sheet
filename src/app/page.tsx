import { d6Throw, doubleThrow } from "@/lib/diceThrows";

export default function Home() {
  const randomThrow = doubleThrow(d6Throw);

  return (
    <main>
      <h2>Random 2xd6 throw: {randomThrow}</h2>
    </main>
  );
}
