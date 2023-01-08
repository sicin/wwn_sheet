/*
  Warnings:

  - You are about to drop the column `background` on the `Character` table. All the data in the column will be lost.
  - The `totalMoney` column on the `Character` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `stashedMoney` column on the `Character` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `ClassAbilities` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ability_id` on the `ClassAbilities` table. All the data in the column will be lost.
  - You are about to drop the `Items` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Skills` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Spells` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[class]` on the table `ClassAbilities` will be added. If there are existing duplicate values, this will fail.
  - Made the column `goal` on table `Character` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `class` to the `ClassAbilities` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Character" DROP COLUMN "background",
ADD COLUMN     "backgroundDetails" TEXT,
ADD COLUMN     "languages" VARCHAR(256),
ADD COLUMN     "mageTradition" VARCHAR(32),
ADD COLUMN     "strain" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "unspentPoints" INTEGER NOT NULL DEFAULT 0,
ALTER COLUMN "occupation" DROP NOT NULL,
ALTER COLUMN "goal" SET NOT NULL,
ALTER COLUMN "goal" SET DEFAULT 'My goal is to be the very best, like no one ever was.',
DROP COLUMN "totalMoney",
ADD COLUMN     "totalMoney" INTEGER[] DEFAULT ARRAY[0, 0, 0]::INTEGER[],
DROP COLUMN "stashedMoney",
ADD COLUMN     "stashedMoney" INTEGER[] DEFAULT ARRAY[0, 0, 0]::INTEGER[];

-- AlterTable
ALTER TABLE "ClassAbilities" DROP CONSTRAINT "ClassAbilities_pkey",
DROP COLUMN "ability_id",
ADD COLUMN     "arcaneTradition" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "class" VARCHAR(32) NOT NULL,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "killingBlow" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "veteransLuck" BOOLEAN NOT NULL DEFAULT false,
ADD CONSTRAINT "ClassAbilities_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "Items";

-- DropTable
DROP TABLE "Skills";

-- DropTable
DROP TABLE "Spells";

-- CreateTable
CREATE TABLE "Background" (
    "backgroundId" INTEGER NOT NULL,
    "backgroundName" TEXT NOT NULL,
    "freeSkill" VARCHAR(32) NOT NULL,
    "quickSkills" TEXT[] DEFAULT ARRAY['skill1', 'skill2']::TEXT[],

    CONSTRAINT "Background_pkey" PRIMARY KEY ("backgroundId")
);

-- CreateTable
CREATE TABLE "Skillset" (
    "id" SERIAL NOT NULL,
    "admin" INTEGER,
    "connect" INTEGER,
    "convince" INTEGER,
    "craft" INTEGER,
    "exert" INTEGER,
    "heal" INTEGER,
    "know" INTEGER,
    "lead" INTEGER,
    "magic" INTEGER,
    "notice" INTEGER,
    "perform" INTEGER,
    "pray" INTEGER,
    "punch" INTEGER,
    "ride" INTEGER,
    "sail" INTEGER,
    "shoot" INTEGER,
    "sneak" INTEGER,
    "stab" INTEGER,
    "survive" INTEGER,
    "trade" INTEGER,
    "work" INTEGER,

    CONSTRAINT "Skillset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Item" (
    "itemId" SERIAL NOT NULL,
    "itemName" VARCHAR(128) NOT NULL,
    "costSilver" INTEGER NOT NULL,
    "encumbrance" INTEGER NOT NULL,
    "quantity" INTEGER,
    "quantityModifier" VARCHAR(64),
    "isWeightless" BOOLEAN NOT NULL DEFAULT false,
    "isWeightlessWorn" BOOLEAN NOT NULL DEFAULT false,
    "canBeBundled" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Item_pkey" PRIMARY KEY ("itemId")
);

-- CreateTable
CREATE TABLE "Weapon" (
    "weaponId" SERIAL NOT NULL,
    "weaponName" VARCHAR(128) NOT NULL,
    "costSilver" INTEGER NOT NULL,
    "encumbrance" INTEGER NOT NULL,
    "attribute" VARCHAR(10) NOT NULL,
    "traits" TEXT[],
    "shockDmg" INTEGER,
    "shockHit" INTEGER,
    "requiresAmmo" BOOLEAN NOT NULL DEFAULT false,
    "closeRange" INTEGER,
    "farRange" INTEGER,

    CONSTRAINT "Weapon_pkey" PRIMARY KEY ("weaponId")
);

-- CreateTable
CREATE TABLE "Armor" (
    "armorId" SERIAL NOT NULL,
    "armorName" VARCHAR(128) NOT NULL,
    "costSilver" INTEGER NOT NULL,
    "encumbrance" INTEGER NOT NULL,
    "armorClass" INTEGER NOT NULL,
    "isShield" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Armor_pkey" PRIMARY KEY ("armorId")
);

-- CreateTable
CREATE TABLE "Spell" (
    "spellId" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "description" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "tradition" VARCHAR(32),

    CONSTRAINT "Spell_pkey" PRIMARY KEY ("spellId")
);

-- CreateTable
CREATE TABLE "Art" (
    "artId" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "description" TEXT NOT NULL,
    "tradition" VARCHAR(32),

    CONSTRAINT "Art_pkey" PRIMARY KEY ("artId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Item_itemName_key" ON "Item"("itemName");

-- CreateIndex
CREATE UNIQUE INDEX "Weapon_weaponName_key" ON "Weapon"("weaponName");

-- CreateIndex
CREATE UNIQUE INDEX "Armor_armorName_key" ON "Armor"("armorName");

-- CreateIndex
CREATE UNIQUE INDEX "Spell_name_key" ON "Spell"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Art_name_key" ON "Art"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ClassAbilities_class_key" ON "ClassAbilities"("class");
