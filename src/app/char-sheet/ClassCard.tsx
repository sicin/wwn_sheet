"use client";

import { Class } from "@prisma/client";
import { FC } from "react";

// // Infer the type of the "class" key from Prisma-generated types
// type CharacterClass = Prisma.CharacterSelect["class"];

// // Define a Zod schema for the character class
// const characterClassSchema = z.string();

// interface ClassCardProps {
//   characterClass: CharacterClass;
// }

// interface ClassCardProps {
//   characterClass: string;
// }

export const ClassCard: FC<{ characterClass?: Class }> = ({
  characterClass,
}) => {
  return (
    <div>
      <h2 className="text-2xl font-bold"> The class is {characterClass}</h2>
    </div>
  );
};
