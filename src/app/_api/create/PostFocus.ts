"use server";

import { FocusFormData } from "@/app/dev/foci/create/FocusForm";
import prisma from "@/lib/prisma";
import { Focus } from "@prisma/client";

export const PostFocus = async (data: FocusFormData): Promise<Focus> => {
  return await prisma.focus.create({
    data: {
      name: data.name,
      baseDescription: data.baseDescription,
      levelOneDescription: data.levelOneDescription,
      levelTwoDescription: data.levelTwoDescription,
      isExpansion: data.isExpansion,
    },
  });
};
