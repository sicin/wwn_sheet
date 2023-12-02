"use server";

import prisma from "@/lib/prisma";
import { Background } from "@prisma/client";

export const GetBackground = async (
  backgroundName: string,
): Promise<Background> => {
  const background = await prisma.background.findUniqueOrThrow({
    where: { name: backgroundName },
  });
  return background;
};
