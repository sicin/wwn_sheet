/*
  Warnings:

  - You are about to drop the column `name` on the `BackgroundThrows` table. All the data in the column will be lost.
  - You are about to drop the `Stats` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `backgroundId` to the `BackgroundThrows` table without a default value. This is not possible if the table is not empty.
  - Added the required column `skillsetId` to the `Character` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "BackgroundThrows" DROP COLUMN "name",
ADD COLUMN     "backgroundId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Character" ADD COLUMN     "skillsetId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Stats";

-- CreateTable
CREATE TABLE "Attributes" (
    "id" SERIAL NOT NULL,
    "strength" INTEGER NOT NULL DEFAULT 0,
    "dexterity" INTEGER NOT NULL DEFAULT 0,
    "constitution" INTEGER NOT NULL DEFAULT 0,
    "intelligence" INTEGER NOT NULL DEFAULT 0,
    "wisdom" INTEGER NOT NULL DEFAULT 0,
    "charisma" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Attributes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AttributeValues" (
    "id" SERIAL NOT NULL,
    "score" INTEGER NOT NULL,
    "scoreBoost" INTEGER,
    "modifier" INTEGER,
    "developedAttribute" INTEGER,

    CONSTRAINT "AttributeValues_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skill" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Skill_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_skillsetId_fkey" FOREIGN KEY ("skillsetId") REFERENCES "Skillset"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BackgroundThrows" ADD CONSTRAINT "BackgroundThrows_backgroundId_fkey" FOREIGN KEY ("backgroundId") REFERENCES "Background"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
