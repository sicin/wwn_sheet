"use server";

import prisma from "@/lib/prisma";
import { Background } from "@prisma/client";

export const getAllBackgrounds = async (): Promise<Background[]> => {
  const backgrounds = await prisma.background.findMany({
    orderBy: { name: "desc" },
  });
  return backgrounds;
};
