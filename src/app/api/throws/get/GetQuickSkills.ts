"use server";

import prisma from "@/lib/prisma";
import { BackgroundThrow, Background } from "@prisma/client";

export const GetQuickSkills = async (
  background: number,
): Promise<BackgroundThrow[]> => {
  const quickSkills = await prisma.background
    .findUniqueOrThrow({
      where: { id: background },
    })
    .quickSkills();
  return quickSkills;
};
