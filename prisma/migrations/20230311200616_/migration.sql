/*
  Warnings:

  - You are about to drop the `Armor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Art` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AttributeValues` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Attributes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Background` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `BackgroundThrows` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Character` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ClassAbility` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Equipment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EquipmentOnCharacters` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Focus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Skill` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Skillset` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Spell` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Weapon` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Attributes" DROP CONSTRAINT "Attributes_charisma_values_id_fkey";

-- DropForeignKey
ALTER TABLE "Attributes" DROP CONSTRAINT "Attributes_constitution_values_id_fkey";

-- DropForeignKey
ALTER TABLE "Attributes" DROP CONSTRAINT "Attributes_dexterity_values_id_fkey";

-- DropForeignKey
ALTER TABLE "Attributes" DROP CONSTRAINT "Attributes_intelligence_values_id_fkey";

-- DropForeignKey
ALTER TABLE "Attributes" DROP CONSTRAINT "Attributes_strength_values_id_fkey";

-- DropForeignKey
ALTER TABLE "Attributes" DROP CONSTRAINT "Attributes_wisdom_values_id_fkey";

-- DropForeignKey
ALTER TABLE "BackgroundThrows" DROP CONSTRAINT "BackgroundThrows_background_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_attributes_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_background_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_skillset_id_fkey";

-- DropForeignKey
ALTER TABLE "Equipment" DROP CONSTRAINT "Equipment_armor_id_fkey";

-- DropForeignKey
ALTER TABLE "Equipment" DROP CONSTRAINT "Equipment_item_id_fkey";

-- DropForeignKey
ALTER TABLE "Equipment" DROP CONSTRAINT "Equipment_weapon_id_fkey";

-- DropForeignKey
ALTER TABLE "EquipmentOnCharacters" DROP CONSTRAINT "EquipmentOnCharacters_characterId_fkey";

-- DropForeignKey
ALTER TABLE "EquipmentOnCharacters" DROP CONSTRAINT "EquipmentOnCharacters_equipmentId_fkey";

-- DropForeignKey
ALTER TABLE "_ArtToCharacter" DROP CONSTRAINT "_ArtToCharacter_A_fkey";

-- DropForeignKey
ALTER TABLE "_ArtToCharacter" DROP CONSTRAINT "_ArtToCharacter_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToClassAbility" DROP CONSTRAINT "_CharacterToClassAbility_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToClassAbility" DROP CONSTRAINT "_CharacterToClassAbility_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToFocus" DROP CONSTRAINT "_CharacterToFocus_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToFocus" DROP CONSTRAINT "_CharacterToFocus_B_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToSpell" DROP CONSTRAINT "_CharacterToSpell_A_fkey";

-- DropForeignKey
ALTER TABLE "_CharacterToSpell" DROP CONSTRAINT "_CharacterToSpell_B_fkey";

-- DropTable
DROP TABLE "Armor";

-- DropTable
DROP TABLE "Art";

-- DropTable
DROP TABLE "AttributeValues";

-- DropTable
DROP TABLE "Attributes";

-- DropTable
DROP TABLE "Background";

-- DropTable
DROP TABLE "BackgroundThrows";

-- DropTable
DROP TABLE "Character";

-- DropTable
DROP TABLE "ClassAbility";

-- DropTable
DROP TABLE "Equipment";

-- DropTable
DROP TABLE "EquipmentOnCharacters";

-- DropTable
DROP TABLE "Focus";

-- DropTable
DROP TABLE "Skill";

-- DropTable
DROP TABLE "Skillset";

-- DropTable
DROP TABLE "Spell";

-- DropTable
DROP TABLE "Weapon";

-- CreateTable
CREATE TABLE "character" (
    "id" TEXT NOT NULL,
    "class" "Class" NOT NULL DEFAULT 'NONE',
    "mage_tradition" VARCHAR(32),
    "species" VARCHAR(64) NOT NULL DEFAULT 'Human',
    "languages" VARCHAR(32)[] DEFAULT ARRAY['Native', 'Trade Cant']::VARCHAR(32)[],
    "assets" TEXT,
    "notes" TEXT,
    "background_details" TEXT,
    "occupation" VARCHAR(64) NOT NULL DEFAULT 'Not chosen',
    "name" VARCHAR(256) NOT NULL DEFAULT 'Anonymous',
    "homeland" VARCHAR(256),
    "goal" VARCHAR(256) NOT NULL DEFAULT 'My goal is to be the very best, like no one ever was.',
    "description" TEXT,
    "image" TEXT,
    "experience" INTEGER NOT NULL DEFAULT 0,
    "unspent_points" INTEGER NOT NULL DEFAULT 0,
    "renown" INTEGER NOT NULL DEFAULT 0,
    "max_hp" INTEGER NOT NULL DEFAULT 0,
    "current_hp" INTEGER NOT NULL DEFAULT 0,
    "condition" VARCHAR(64),
    "current_strain" INTEGER NOT NULL DEFAULT 0,
    "total_money" INTEGER[] DEFAULT ARRAY[0, 0, 0]::INTEGER[],
    "stashed_money" INTEGER[] DEFAULT ARRAY[0, 0, 0]::INTEGER[],
    "is_alive" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "background_id" INTEGER NOT NULL,
    "skillset_id" INTEGER NOT NULL,
    "attributes_id" INTEGER NOT NULL,

    CONSTRAINT "character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "class_ability" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "class_ability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "equipment_on_characters" (
    "characterId" TEXT NOT NULL,
    "equipmentId" INTEGER NOT NULL,
    "isStowed" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "equipment_on_characters_pkey" PRIMARY KEY ("characterId","equipmentId")
);

-- CreateTable
CREATE TABLE "equipment" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(128) NOT NULL,
    "cost_silver" INTEGER NOT NULL,
    "encumbrance" INTEGER NOT NULL,
    "weapon_id" INTEGER,
    "item_id" INTEGER,
    "armor_id" INTEGER,

    CONSTRAINT "equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "weapon" (
    "id" SERIAL NOT NULL,
    "attribute" VARCHAR(10) NOT NULL,
    "traits" TEXT[],
    "shock_dmg" INTEGER,
    "shock_hit" INTEGER,
    "requires_ammo" BOOLEAN NOT NULL DEFAULT false,
    "close_range" INTEGER,
    "far_range" INTEGER,

    CONSTRAINT "weapon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "armor" (
    "id" SERIAL NOT NULL,
    "armor_class" INTEGER NOT NULL,
    "is_shield" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "armor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "background" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "background_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "background_throw" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(32) NOT NULL,
    "skill" VARCHAR(32) NOT NULL,
    "count_twice" BOOLEAN NOT NULL DEFAULT false,
    "background_id" INTEGER NOT NULL,

    CONSTRAINT "background_throw_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attributes" (
    "id" SERIAL NOT NULL,
    "strength_values_id" INTEGER NOT NULL,
    "dexterity_values_id" INTEGER NOT NULL,
    "constitution_values_id" INTEGER NOT NULL,
    "intelligence_values_id" INTEGER NOT NULL,
    "wisdom_values_id" INTEGER NOT NULL,
    "charisma_values_id" INTEGER NOT NULL,

    CONSTRAINT "attributes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attribute_values" (
    "id" SERIAL NOT NULL,
    "score" INTEGER NOT NULL,
    "score_boost" INTEGER,
    "modifier" INTEGER,
    "developed_attribute" INTEGER,

    CONSTRAINT "attribute_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skill" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skillset" (
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

    CONSTRAINT "skillset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "focus" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(256) NOT NULL,
    "base_description" TEXT NOT NULL,
    "level_one_description" TEXT,
    "level_two_description" TEXT,
    "is_expansion" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "focus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spell" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "description" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "tradition" VARCHAR(32),

    CONSTRAINT "spell_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "art" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(64) NOT NULL,
    "description" TEXT NOT NULL,
    "tradition" VARCHAR(32),

    CONSTRAINT "art_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "equipment_name_key" ON "equipment"("name");

-- CreateIndex
CREATE UNIQUE INDEX "skill_name_key" ON "skill"("name");

-- CreateIndex
CREATE UNIQUE INDEX "focus_name_key" ON "focus"("name");

-- CreateIndex
CREATE UNIQUE INDEX "spell_name_key" ON "spell"("name");

-- CreateIndex
CREATE UNIQUE INDEX "art_name_key" ON "art"("name");

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_background_id_fkey" FOREIGN KEY ("background_id") REFERENCES "background"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_skillset_id_fkey" FOREIGN KEY ("skillset_id") REFERENCES "skillset"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "character" ADD CONSTRAINT "character_attributes_id_fkey" FOREIGN KEY ("attributes_id") REFERENCES "attributes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_on_characters" ADD CONSTRAINT "equipment_on_characters_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment_on_characters" ADD CONSTRAINT "equipment_on_characters_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "equipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_weapon_id_fkey" FOREIGN KEY ("weapon_id") REFERENCES "weapon"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "item"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "equipment" ADD CONSTRAINT "equipment_armor_id_fkey" FOREIGN KEY ("armor_id") REFERENCES "armor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "background_throw" ADD CONSTRAINT "background_throw_background_id_fkey" FOREIGN KEY ("background_id") REFERENCES "background"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_strength_values_id_fkey" FOREIGN KEY ("strength_values_id") REFERENCES "attribute_values"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_dexterity_values_id_fkey" FOREIGN KEY ("dexterity_values_id") REFERENCES "attribute_values"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_constitution_values_id_fkey" FOREIGN KEY ("constitution_values_id") REFERENCES "attribute_values"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_intelligence_values_id_fkey" FOREIGN KEY ("intelligence_values_id") REFERENCES "attribute_values"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_wisdom_values_id_fkey" FOREIGN KEY ("wisdom_values_id") REFERENCES "attribute_values"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attributes" ADD CONSTRAINT "attributes_charisma_values_id_fkey" FOREIGN KEY ("charisma_values_id") REFERENCES "attribute_values"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToClassAbility" ADD CONSTRAINT "_CharacterToClassAbility_A_fkey" FOREIGN KEY ("A") REFERENCES "character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToClassAbility" ADD CONSTRAINT "_CharacterToClassAbility_B_fkey" FOREIGN KEY ("B") REFERENCES "class_ability"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFocus" ADD CONSTRAINT "_CharacterToFocus_A_fkey" FOREIGN KEY ("A") REFERENCES "character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFocus" ADD CONSTRAINT "_CharacterToFocus_B_fkey" FOREIGN KEY ("B") REFERENCES "focus"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpell" ADD CONSTRAINT "_CharacterToSpell_A_fkey" FOREIGN KEY ("A") REFERENCES "character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpell" ADD CONSTRAINT "_CharacterToSpell_B_fkey" FOREIGN KEY ("B") REFERENCES "spell"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtToCharacter" ADD CONSTRAINT "_ArtToCharacter_A_fkey" FOREIGN KEY ("A") REFERENCES "art"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtToCharacter" ADD CONSTRAINT "_ArtToCharacter_B_fkey" FOREIGN KEY ("B") REFERENCES "character"("id") ON DELETE CASCADE ON UPDATE CASCADE;
