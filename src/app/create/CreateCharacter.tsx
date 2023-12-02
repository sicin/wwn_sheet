"use client";

import { d6Throw, multiThrow } from "@/lib/diceThrows";
import { ChangeEvent, useState } from "react";

interface Attributes {
  str: number;
  dex: number;
  const: number;
  wis: number;
  cha: number;
  int: number;
}

const calculateModifier = (value: number): string => {
  if (value === 3) return "-2";
  if (value >= 4 && value <= 7) return "-1";
  if (value >= 13 && value <= 17) return "+1";
  if (value === 18) return "+2";
  return "0"; // Default case if value doesn't match any rule
};

const modifiersToAttributes = (attributes: Attributes): string => {
  const attributesStringArray = Object.entries(attributes).map(
    ([key, value]) =>
      `${key}: [score: ${value}, modifier: ${calculateModifier(value)}]`,
  );
  return attributesStringArray.join(", ");
};

export const CreateCharacter = () => {
  const [attributes, setAttributes] = useState<Attributes>({
    str: 0,
    dex: 0,
    const: 0,
    wis: 0,
    cha: 0,
    int: 0,
  });
  const [step, setStep] = useState<number>(0);
  const onButtonClick = () => {
    const lol = {
      ...attributes,
      str: multiThrow(3, d6Throw),
      dex: multiThrow(3, d6Throw),
      const: multiThrow(3, d6Throw),
      wis: multiThrow(3, d6Throw),
      cha: multiThrow(3, d6Throw),
      int: multiThrow(3, d6Throw),
    };
    setAttributes(lol);
    setStep(1);
  };

  const chooseAttributeToImprove = (e: ChangeEvent<HTMLSelectElement>) => {
    setAttributes({ ...attributes, [e.target.value]: 14 });
    setStep(2);
  };

  return (
    <div>
      <button disabled={step !== 0} onClick={onButtonClick}>
        Create character
      </button>
      <div>{modifiersToAttributes(attributes)}</div>
      {step === 1 && (
        <>
          <label htmlFor="attributesSelect">
            Choose attribute to set as 14:
          </label>
          <select
            disabled={step !== 1}
            onChange={chooseAttributeToImprove}
            name="attributes"
            id="attributesSelect"
          >
            {Object.keys(attributes).map((attribute) => (
              <option value={attribute} key={attribute}>
                {attribute}
              </option>
            ))}
          </select>
        </>
      )}
      {step === 2 && <div></div>}
    </div>
  );
};
