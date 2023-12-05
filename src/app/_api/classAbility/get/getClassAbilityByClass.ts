"use server";

import prisma from "@/lib/prisma";
import { Class, ClassAbility } from "@prisma/client";

export const getClassAbilityByClass = async (
  charClass: Class,
): Promise<ClassAbility[]> => {
  const classAbilities = await prisma.classAbility.findMany({
    where: { class: charClass },
  });
  return classAbilities;
};
