import { d6Throw, multiThrow } from "@/lib/diceThrows";

export default function Home() {
  const randomThrow = multiThrow(2, d6Throw);

  return (
    <main>
      <h2>Random 2d6 throw: {randomThrow}</h2>
    </main>
  );
}
