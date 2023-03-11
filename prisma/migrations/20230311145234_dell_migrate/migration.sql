/*
  Warnings:

  - You are about to drop the `Foci` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[name]` on the table `Skill` will be added. If there are existing duplicate values, this will fail.

*/
-- DropTable
DROP TABLE "Foci";

-- CreateTable
CREATE TABLE "Focus" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "baseDescription" TEXT NOT NULL,
    "levelOneDescription" TEXT,
    "levelTwoDescription" TEXT,
    "isExpansion" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Focus_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Focus_name_key" ON "Focus"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Skill_name_key" ON "Skill"("name");
