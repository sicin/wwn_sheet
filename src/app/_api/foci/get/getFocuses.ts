"use server";

import prisma from "@/lib/prisma";
import { Focus } from "@prisma/client";

export const getAllFocuses = async (): Promise<Focus[]> => {
  const focuses = await prisma.focus.findMany({
    orderBy: { name: "desc" },
  });
  return focuses;
};
