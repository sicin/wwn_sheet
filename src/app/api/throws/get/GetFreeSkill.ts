"use server";

import prisma from "@/lib/prisma";
import { BackgroundThrow } from "@prisma/client";

export const GetFreeSkill = async (
  backgroundThrowId: number,
): Promise<BackgroundThrow> => {
  const backgroundThrow = await prisma.backgroundThrow.findUniqueOrThrow({
    where: { id: backgroundThrowId },
  });
  return backgroundThrow;
};
