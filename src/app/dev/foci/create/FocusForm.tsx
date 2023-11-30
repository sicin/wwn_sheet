"use client";

import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import { PostFocus } from "@/app/api/create/PostFocus";

const schema = z.object({
  name: z.string().min(1, { message: "Required" }),
  baseDescription: z.string().min(1, { message: "Required" }),
  levelOneDescription: z.string().optional(),
  levelTwoDescription: z.string().optional(),
  isExpansion: z.boolean().default(false),
});

type FormData = z.infer<typeof schema>;

export const FocusForm = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<FormData>({
    resolver: zodResolver(schema),
  });

  const onSubmit = async (data: FormData) => {
    const createdFocus = await PostFocus(data);

    console.log("Created focus:", createdFocus);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input
        className="border-2 border-black bg-slate-200"
        type=""
        {...register("name", { required: true })}
      />
      {errors.name?.message && <p>{errors.name?.message.toString()}</p>}
      <input
        className="border-2 border-black bg-slate-200"
        type="text"
        {...register("baseDescription", { required: true })}
      />
      {errors.baseDescription?.message && (
        <p>{errors.baseDescription?.message.toString()}</p>
      )}
      <input
        className="border-2 border-black bg-slate-200"
        type="text"
        {...register("levelOneDescription")}
      />
      {errors.levelOneDescription?.message && (
        <p>{errors.levelOneDescription?.message.toString()}</p>
      )}
      <input
        className="border-2 border-black bg-slate-200"
        type="text"
        {...register("levelTwoDescription")}
      />
      {errors.levelTwoDescription?.message && (
        <p>{errors.levelTwoDescription?.message.toString()}</p>
      )}
      <input
        className="border-2 border-black bg-slate-200"
        type="checkbox"
        {...register("isExpansion")}
      />
      <button className=" bg-slate-100" type="submit">
        Submit
      </button>
    </form>
  );
};
