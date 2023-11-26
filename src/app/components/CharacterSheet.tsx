import { Character } from "@prisma/client";
import { ClassCard } from "./ClassCard";

export interface CharacterProps {
  character: Character;
}

export const CharacterSheetPage = ({ character }: CharacterProps) => {
  return (
    <>
      <ClassCard characterClass={character.class} />
      <div>
        {Object.keys(character).map((key) => (
          <div key={key}>
            <strong>{key}:</strong>{" "}
            {key === "class"
              ? "component done"
              : character[key as keyof Character]?.toString()}
          </div>
        ))}
      </div>
    </>
  );
};
