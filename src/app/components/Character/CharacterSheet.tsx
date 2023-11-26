import { Character } from "@prisma/client";
import { ClassCard } from "./ClassCard";

export interface CharacterProps {
  character: Character;
}

const HpComponent = ({
  currentHp,
  maxHp,
}: {
  currentHp: number;
  maxHp: number;
}) => {
  return (
    <div>
      <h2 className="text-2xl font-bold">
        HP: {currentHp}/{maxHp}
      </h2>
    </div>
  );
};

export const CharacterSheetComponent = ({ character }: CharacterProps) => {
  return (
    <>
      <ClassCard characterClass={character.class} />
      <HpComponent currentHp={character.currentHp} maxHp={character.maxHp} />
      <div>
        {Object.keys(character).map((key) => (
          <div key={key}>
            <strong>{key}:</strong>{" "}
            {["class", "maxHp", "currentHp"].includes(key)
              ? "component done"
              : character[key as keyof Character]?.toString()}
          </div>
        ))}
      </div>
    </>
  );
};
