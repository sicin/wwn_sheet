"use client";

import { d6Throw, multiThrow } from "@/lib/diceThrows";
import { ChangeEvent, useCallback, useEffect, useState } from "react";
import { getAllBackgrounds } from "../api/backgrounds/getAllBackgrounds";
import { GetFreeSkill } from "../api/throws/get/GetFreeSkill";

interface Attributes {
  str: number;
  dex: number;
  const: number;
  wis: number;
  cha: number;
  int: number;
}

interface Background {
  id: number;
  name: string;
  description: string;
  freeSkillId: number;
}

type Skills = {
  [key: string]: number;
};

const calculateModifier = (value: number): number => {
  if (value === 3) return -2;
  if (value >= 4 && value <= 7) return -1;
  if (value >= 13 && value <= 17) return 1;
  if (value === 18) return 2;
  return 0;
};

const modifiersToAttributes = (attributes: Attributes): string => {
  const attributesStringArray = Object.entries(attributes).map(
    ([key, value]) =>
      `${key}: [score: ${value}, modifier: ${
        calculateModifier(value) > 0
          ? `+${calculateModifier(value)}`
          : calculateModifier(value)
      }]`,
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
  const [skills, setSkills] = useState<Skills>({});
  const [selectedAttribute, setSelectedAttribute] = useState<
    string | undefined
  >(undefined);
  const [step, setStep] = useState<number>(0);
  const [backgrounds, setBackgrounds] = useState<Background[]>([]);
  const [selectedBackground, setSelectedBackground] = useState<
    Background | undefined
  >(undefined);
  const onButtonClick = () => {
    const newAttributes = Object.keys(attributes).reduce(
      (result, attribute) => {
        result[attribute as keyof Attributes] = multiThrow(3, d6Throw);
        return result;
      },
      {} as Attributes,
    );
    setAttributes(newAttributes);
    setStep(1);
  };
  const getBackgrounds = useCallback(async () => {
    const fetchedBackgrounds = await getAllBackgrounds();
    setBackgrounds(fetchedBackgrounds);
  }, []);

  useEffect(() => {
    if (step === 2) {
      getBackgrounds();
    }
  }, [step, getBackgrounds]);

  const chooseAttributeToImprove = (e: ChangeEvent<HTMLSelectElement>) => {
    setAttributes({ ...attributes, [e.target.value]: 14 });
    setSelectedAttribute(e.target.value);

    setStep(2);
  };

  const handleBackgroundChange = (e: ChangeEvent<HTMLSelectElement>) => {
    const selectedId = parseInt(e.target.value, 10);
    const selected = backgrounds.find(
      (background) => background.id === selectedId,
    );
    setSelectedBackground(selected);
  };
  const handleChooseBackground = async () => {
    if (selectedBackground) {
      const freeSkill = await GetFreeSkill(selectedBackground.freeSkillId);
      setSkills({ [freeSkill.name]: 0 });
    }
    setStep(3);
  };

  return (
    <div className="flex flex-col">
      <div>
        <div>New Character</div>
        <div>Stats:</div>
        <div>{modifiersToAttributes(attributes)}</div>
        {step >= 3 && (
          <>
            <div>Background:</div>
            <div>{selectedBackground?.name}</div>
            <div>{selectedBackground?.description}</div>
            <div>Skills:</div>
            {Object.keys(skills).map((skill) => (
              <div key={skill}>
                <div>
                  {skill}: {skills[skill]}
                </div>
              </div>
            ))}
          </>
        )}
      </div>
      <div>
        {step === 0 && (
          <button disabled={step !== 0} onClick={onButtonClick}>
            Create new character
          </button>
        )}
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
              value={selectedAttribute ? selectedAttribute : ""}
            >
              <option value="" disabled hidden>
                -- Select Attribute --
              </option>
              {Object.keys(attributes).map((attribute) => (
                <option value={attribute} key={attribute}>
                  {attribute}
                </option>
              ))}
            </select>
          </>
        )}
        {step === 2 && (
          <div>
            <label htmlFor="backgroundSelect">Choose background:</label>
            <select
              disabled={step !== 2}
              onChange={handleBackgroundChange}
              name="background"
              id="backgroundSelect"
              value={selectedBackground ? selectedBackground.id : ""}
            >
              <option value="" disabled hidden>
                -- Select Background --
              </option>
              {backgrounds.map((background) => (
                <option value={background.id} key={background.name}>
                  {background.name}
                </option>
              ))}
            </select>
            {selectedBackground && (
              <div>
                <h3>{selectedBackground.name}</h3>
                <p>{selectedBackground.description}</p>
                <button
                  //   disabled={!selectedBackground}
                  onClick={handleChooseBackground}
                >
                  Confirm your choice
                </button>
              </div>
            )}
          </div>
        )}
        {step === 3 && (
          <div>
            Choose one:
            <div className="flex w-1/2 flex-col gap-4">
              <button
                onClick={() => console.log("p")}
                className="border-2 border-black"
              >
                Gain the background&apos;s listed quick skills. Choose this if
                you just want the common skills of the role and don&apos;t want
                to bother more with it.
              </button>
              <button
                onClick={() => console.log("p")}
                className="border-2 border-black"
              >
                Pick two skills from the background&apos;s Learning table,
                except for the &quot;Any Skill&quot; choice. Choose this if you
                have specific preferences for your PC&apos;s skills.
              </button>
              <button
                onClick={() => console.log("p")}
                className="border-2 border-black"
              >
                Roll three times, splitting the rolls as you wish between the
                Growth and Learning tables for your background. Choose this if
                you don&apos;t mind accepting the dice&apos;s decision in
                exchange for an extra skill or a chance at improved attributes.
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
