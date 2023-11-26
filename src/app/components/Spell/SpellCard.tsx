"use client";

import { Spell } from "@prisma/client";
import { FC } from "react";

export interface FocusProps {
  spell: Spell;
}

export const SpellCard: FC<{ spells: Spell[] }> = ({ spells }) => {
  return (
    <div>
      {spells.map((spell) => (
        <div
          key={spell.id}
          className="max-w-sm overflow-hidden rounded shadow-lg"
        >
          <div className="px-6 py-4">
            <div className="mb-2 text-xl font-bold">{spell.name}</div>
            <p className="text-base text-black">{spell.description}</p>
            <p className="text-sm text-gray-700">Spell level: {spell.level}</p>
          </div>
          <div className="px-6 pb-2 pt-4">
            {spell.tradition ? (
              <span className="mb-2 mr-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700">
                {spell.tradition}
              </span>
            ) : (
              "no tradition"
            )}
          </div>
        </div>
      ))}
    </div>
  );
};
