/*
  Warnings:

  - The primary key for the `Armor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `armorClass` on the `Armor` table. All the data in the column will be lost.
  - You are about to drop the column `armorId` on the `Armor` table. All the data in the column will be lost.
  - You are about to drop the column `armorName` on the `Armor` table. All the data in the column will be lost.
  - You are about to drop the column `costSilver` on the `Armor` table. All the data in the column will be lost.
  - You are about to drop the column `isShield` on the `Armor` table. All the data in the column will be lost.
  - The primary key for the `Art` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `artId` on the `Art` table. All the data in the column will be lost.
  - You are about to drop the column `developedAttribute` on the `AttributeValues` table. All the data in the column will be lost.
  - You are about to drop the column `scoreBoost` on the `AttributeValues` table. All the data in the column will be lost.
  - You are about to drop the column `backgroundId` on the `BackgroundThrows` table. All the data in the column will be lost.
  - You are about to drop the column `countTwice` on the `BackgroundThrows` table. All the data in the column will be lost.
  - You are about to drop the column `backgroundDetails` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `backgroundId` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `curentStrain` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `currentHp` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `isAlive` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `skillsetId` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `stashedMoney` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `totalMoney` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `unspentPoints` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `arcaneTradition` on the `ClassAbilities` table. All the data in the column will be lost.
  - You are about to drop the column `killingBlow` on the `ClassAbilities` table. All the data in the column will be lost.
  - You are about to drop the column `masterfulExpertise` on the `ClassAbilities` table. All the data in the column will be lost.
  - You are about to drop the column `quickLearner` on the `ClassAbilities` table. All the data in the column will be lost.
  - You are about to drop the column `veteransLuck` on the `ClassAbilities` table. All the data in the column will be lost.
  - You are about to drop the column `developedAttribute` on the `Foci` table. All the data in the column will be lost.
  - You are about to drop the column `snipersEye` on the `Foci` table. All the data in the column will be lost.
  - The primary key for the `Item` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `canBeBundled` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `costSilver` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `isWeightless` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `isWeightlessWorn` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `itemId` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `itemName` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `quantityModifier` on the `Item` table. All the data in the column will be lost.
  - The primary key for the `Spell` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `spellId` on the `Spell` table. All the data in the column will be lost.
  - The primary key for the `Weapon` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `closeRange` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `costSilver` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `farRange` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `requiresAmmo` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `shockDmg` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `shockHit` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `weaponId` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `weaponName` on the `Weapon` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Armor` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Item` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `Weapon` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `armor_class` to the `Armor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cost_silver` to the `Armor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Armor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `background_id` to the `BackgroundThrows` table without a default value. This is not possible if the table is not empty.
  - Added the required column `background_id` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `skillset_id` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cost_silver` to the `Item` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Item` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cost_silver` to the `Weapon` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Weapon` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "BackgroundThrows" DROP CONSTRAINT "BackgroundThrows_backgroundId_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_backgroundId_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_skillsetId_fkey";

-- DropIndex
DROP INDEX "Armor_armorName_key";

-- DropIndex
DROP INDEX "Item_itemName_key";

-- DropIndex
DROP INDEX "Weapon_weaponName_key";

-- AlterTable
ALTER TABLE "Armor" DROP CONSTRAINT "Armor_pkey",
DROP COLUMN "armorClass",
DROP COLUMN "armorId",
DROP COLUMN "armorName",
DROP COLUMN "costSilver",
DROP COLUMN "isShield",
ADD COLUMN     "armor_class" INTEGER NOT NULL,
ADD COLUMN     "cost_silver" INTEGER NOT NULL,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "is_shield" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "name" VARCHAR(128) NOT NULL,
ADD CONSTRAINT "Armor_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Art" DROP CONSTRAINT "Art_pkey",
DROP COLUMN "artId",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Art_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "AttributeValues" DROP COLUMN "developedAttribute",
DROP COLUMN "scoreBoost",
ADD COLUMN     "developed_attribute" INTEGER,
ADD COLUMN     "score_boost" INTEGER;

-- AlterTable
ALTER TABLE "BackgroundThrows" DROP COLUMN "backgroundId",
DROP COLUMN "countTwice",
ADD COLUMN     "background_id" INTEGER NOT NULL,
ADD COLUMN     "count_twice" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Character" DROP COLUMN "backgroundDetails",
DROP COLUMN "backgroundId",
DROP COLUMN "createdAt",
DROP COLUMN "curentStrain",
DROP COLUMN "currentHp",
DROP COLUMN "isAlive",
DROP COLUMN "skillsetId",
DROP COLUMN "stashedMoney",
DROP COLUMN "totalMoney",
DROP COLUMN "unspentPoints",
DROP COLUMN "updatedAt",
ADD COLUMN     "background_details" TEXT,
ADD COLUMN     "background_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "current_hp" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "current_strain" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "is_alive" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "skillset_id" INTEGER NOT NULL,
ADD COLUMN     "stashed_money" INTEGER[] DEFAULT ARRAY[0, 0, 0]::INTEGER[],
ADD COLUMN     "total_money" INTEGER[] DEFAULT ARRAY[0, 0, 0]::INTEGER[],
ADD COLUMN     "unspent_points" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "ClassAbilities" DROP COLUMN "arcaneTradition",
DROP COLUMN "killingBlow",
DROP COLUMN "masterfulExpertise",
DROP COLUMN "quickLearner",
DROP COLUMN "veteransLuck",
ADD COLUMN     "arcane_tradition" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "killing_blow" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "masterful_expertise" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "quick_learner" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "veterans_luck" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Foci" DROP COLUMN "developedAttribute",
DROP COLUMN "snipersEye",
ADD COLUMN     "developed_attribute" INTEGER,
ADD COLUMN     "snipers_eye" INTEGER;

-- AlterTable
ALTER TABLE "Item" DROP CONSTRAINT "Item_pkey",
DROP COLUMN "canBeBundled",
DROP COLUMN "costSilver",
DROP COLUMN "isWeightless",
DROP COLUMN "isWeightlessWorn",
DROP COLUMN "itemId",
DROP COLUMN "itemName",
DROP COLUMN "quantityModifier",
ADD COLUMN     "can_be_bundled" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "cost_silver" INTEGER NOT NULL,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "is_weightless" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "is_weightless_worn" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "name" VARCHAR(128) NOT NULL,
ADD COLUMN     "quantity_modifier" VARCHAR(64),
ADD CONSTRAINT "Item_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Spell" DROP CONSTRAINT "Spell_pkey",
DROP COLUMN "spellId",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Spell_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Weapon" DROP CONSTRAINT "Weapon_pkey",
DROP COLUMN "closeRange",
DROP COLUMN "costSilver",
DROP COLUMN "farRange",
DROP COLUMN "requiresAmmo",
DROP COLUMN "shockDmg",
DROP COLUMN "shockHit",
DROP COLUMN "weaponId",
DROP COLUMN "weaponName",
ADD COLUMN     "close_range" INTEGER,
ADD COLUMN     "cost_silver" INTEGER NOT NULL,
ADD COLUMN     "far_range" INTEGER,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "name" VARCHAR(128) NOT NULL,
ADD COLUMN     "requires_ammo" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "shock_dmg" INTEGER,
ADD COLUMN     "shock_hit" INTEGER,
ADD CONSTRAINT "Weapon_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "Armor_name_key" ON "Armor"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Item_name_key" ON "Item"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Weapon_name_key" ON "Weapon"("name");

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_background_id_fkey" FOREIGN KEY ("background_id") REFERENCES "Background"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_skillset_id_fkey" FOREIGN KEY ("skillset_id") REFERENCES "Skillset"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BackgroundThrows" ADD CONSTRAINT "BackgroundThrows_background_id_fkey" FOREIGN KEY ("background_id") REFERENCES "Background"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
