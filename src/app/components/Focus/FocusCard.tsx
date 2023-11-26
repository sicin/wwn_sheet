"use client";

import { Focus } from "@prisma/client";
import { FC } from "react";

export interface FocusProps {
  focus: Focus;
}

export const FocusCard: FC<{ focuses: Focus[] }> = ({ focuses }) => {
  return (
    <div>
      {focuses.map((focus) => (
        <div
          key={focus.id}
          className="max-w-sm overflow-hidden rounded shadow-lg"
        >
          <div className="px-6 py-4">
            <div className="mb-2 text-xl font-bold">{focus.name}</div>
            <p className="text-base text-black">{focus.baseDescription}</p>
            <p className="text-sm text-gray-700">{focus.levelOneDescription}</p>
            <p className="text-sm text-gray-700">{focus.levelTwoDescription}</p>
          </div>
          <div className="px-6 pb-2 pt-4">
            {focus.isExpansion ? (
              <span className="mb-2 mr-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700">
                expansion
              </span>
            ) : (
              "not expansion"
            )}
          </div>
        </div>
      ))}
    </div>
  );
};
