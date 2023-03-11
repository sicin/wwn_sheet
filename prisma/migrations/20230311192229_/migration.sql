/*
  Warnings:

  - You are about to drop the column `cost_silver` on the `Armor` table. All the data in the column will be lost.
  - You are about to drop the column `encumbrance` on the `Armor` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Armor` table. All the data in the column will be lost.
  - You are about to drop the column `cost_silver` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `encumbrance` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Item` table. All the data in the column will be lost.
  - You are about to drop the column `cost_silver` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `encumbrance` on the `Weapon` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Weapon` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Armor_name_key";

-- DropIndex
DROP INDEX "Item_name_key";

-- DropIndex
DROP INDEX "Weapon_name_key";

-- AlterTable
ALTER TABLE "Armor" DROP COLUMN "cost_silver",
DROP COLUMN "encumbrance",
DROP COLUMN "name";

-- AlterTable
ALTER TABLE "Character" ADD COLUMN     "assets" TEXT,
ADD COLUMN     "notes" TEXT;

-- AlterTable
ALTER TABLE "Item" DROP COLUMN "cost_silver",
DROP COLUMN "encumbrance",
DROP COLUMN "name";

-- AlterTable
ALTER TABLE "Weapon" DROP COLUMN "cost_silver",
DROP COLUMN "encumbrance",
DROP COLUMN "name";

-- CreateTable
CREATE TABLE "EquipmentOnCharacters" (
    "characterId" TEXT NOT NULL,
    "equipmentId" INTEGER NOT NULL,
    "isStowed" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "EquipmentOnCharacters_pkey" PRIMARY KEY ("characterId","equipmentId")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(128) NOT NULL,
    "cost_silver" INTEGER NOT NULL,
    "encumbrance" INTEGER NOT NULL,
    "weapon_id" INTEGER,
    "item_id" INTEGER,
    "armor_id" INTEGER,

    CONSTRAINT "Equipment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CharacterToSpell" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ArtToCharacter" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Equipment_name_key" ON "Equipment"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToSpell_AB_unique" ON "_CharacterToSpell"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToSpell_B_index" ON "_CharacterToSpell"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArtToCharacter_AB_unique" ON "_ArtToCharacter"("A", "B");

-- CreateIndex
CREATE INDEX "_ArtToCharacter_B_index" ON "_ArtToCharacter"("B");

-- AddForeignKey
ALTER TABLE "EquipmentOnCharacters" ADD CONSTRAINT "EquipmentOnCharacters_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EquipmentOnCharacters" ADD CONSTRAINT "EquipmentOnCharacters_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_weapon_id_fkey" FOREIGN KEY ("weapon_id") REFERENCES "Weapon"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "Item"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_armor_id_fkey" FOREIGN KEY ("armor_id") REFERENCES "Armor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpell" ADD CONSTRAINT "_CharacterToSpell_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToSpell" ADD CONSTRAINT "_CharacterToSpell_B_fkey" FOREIGN KEY ("B") REFERENCES "Spell"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtToCharacter" ADD CONSTRAINT "_ArtToCharacter_A_fkey" FOREIGN KEY ("A") REFERENCES "Art"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArtToCharacter" ADD CONSTRAINT "_ArtToCharacter_B_fkey" FOREIGN KEY ("B") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;
