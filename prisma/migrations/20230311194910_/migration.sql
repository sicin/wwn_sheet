/*
  Warnings:

  - The `class` column on the `Character` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `ClassAbilities` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Class" AS ENUM ('NONE', 'WARRIOR', 'EXPERT', 'MAGE', 'ADVENTURER');

-- AlterTable
ALTER TABLE "Character" DROP COLUMN "class",
ADD COLUMN     "class" "Class" NOT NULL DEFAULT 'NONE';

-- DropTable
DROP TABLE "ClassAbilities";

-- CreateTable
CREATE TABLE "ClassAbility" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "ClassAbility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CharacterToClassAbility" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToClassAbility_AB_unique" ON "_CharacterToClassAbility"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToClassAbility_B_index" ON "_CharacterToClassAbility"("B");

-- AddForeignKey
ALTER TABLE "_CharacterToClassAbility" ADD CONSTRAINT "_CharacterToClassAbility_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToClassAbility" ADD CONSTRAINT "_CharacterToClassAbility_B_fkey" FOREIGN KEY ("B") REFERENCES "ClassAbility"("id") ON DELETE CASCADE ON UPDATE CASCADE;
