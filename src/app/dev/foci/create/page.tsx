import { Metadata } from "next";
import { FocusForm } from "./FocusForm";

export const metadata: Metadata = {
  title: "Create a focus",
};

export default async function CreateFocus() {
  return <FocusForm />;
}
