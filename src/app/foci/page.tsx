import prisma from "@/lib/prisma";
import { Metadata } from "next";
import { FocusCard } from "../components/Focus/FocusCard";

export const metadata: Metadata = {
  title: "Foci",
};

export default async function Foci() {
  const focuses = await prisma.focus.findMany({ orderBy: { id: "desc" } });
  return <FocusCard focuses={focuses} />;
}
