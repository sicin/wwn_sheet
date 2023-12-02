import { Metadata } from "next";
import { CreateCharacter } from "./CreateCharacter";

export const metadata: Metadata = {
  title: "Character Sheet",
};

export default function Create() {
  return (
    <div>
      <CreateCharacter />
    </div>
  );
}
