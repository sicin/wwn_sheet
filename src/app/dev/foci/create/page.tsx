import prisma from "@/lib/prisma";
import { Metadata } from "next";
import { FocusForm } from "./FocusForm";

export const metadata: Metadata = {
  title: "Create a focus",
};

export default async function CreateFocus() {
  const focuses = await prisma.focus.findMany({ orderBy: { id: "desc" } });
  return <FocusForm />;
}
