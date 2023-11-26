"use client";

import { Art } from "@prisma/client";
import { FC } from "react";

export interface ArtProps {
  art: Art;
}

export const ArtCard: FC<{ arts: Art[] }> = ({ arts }) => {
  return (
    <div>
      {arts.map((art) => (
        <div
          key={art.id}
          className="max-w-sm overflow-hidden rounded shadow-lg"
        >
          <div className="px-6 py-4">
            <div className="mb-2 text-xl font-bold">{art.name}</div>
            <p className="text-base text-black">{art.description}</p>
            <div className="px-6 pb-2 pt-4">
              {art.tradition ? (
                <span className="mb-2 mr-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700">
                  {art.tradition}
                </span>
              ) : (
                "no tradition"
              )}
            </div>
          </div>
        </div>
      ))}
    </div>
  );
};
