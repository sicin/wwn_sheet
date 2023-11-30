"use server";

import prisma from "@/lib/prisma";

export const PostFocus = async (data: any) => {
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
