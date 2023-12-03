import { Class } from "@prisma/client";
import { d6Throw, multiThrow } from "./diceThrows";

enum FocusType {
  ANY = "ANY",
  WARRIOR = "WARRIOR",
  EXPERT = "EXPERT",
}

type WarriorLevelInfo = {
  hitDice: number;
  attackBonus: number;
  focusPicks: FocusType[];
};

export const mapClassToTable = (
  characterClass: Class,
  level: number,
): WarriorLevelInfo => {
  if (level < 1 || level > 10) {
    throw new Error("Level must be between 1 and 10.");
  }

  const warriorTable: { [key: number]: WarriorLevelInfo } = {
    1: {
      hitDice: multiThrow(1, d6Throw) + 2,
      attackBonus: 1,
      focusPicks: [FocusType.ANY, FocusType.WARRIOR],
    },
    2: {
      hitDice: multiThrow(2, d6Throw) + 4,
      attackBonus: 2,
      focusPicks: [FocusType.ANY],
    },
    3: { hitDice: multiThrow(3, d6Throw) + 6, attackBonus: 3, focusPicks: [] },
  };

  switch (characterClass) {
    case "WARRIOR":
    default:
      return warriorTable[level];
  }
};
