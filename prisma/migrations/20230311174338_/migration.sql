/*
  Warnings:

  - You are about to drop the column `characterId` on the `Focus` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Focus" DROP CONSTRAINT "Focus_characterId_fkey";

-- AlterTable
ALTER TABLE "Focus" DROP COLUMN "characterId";

-- CreateTable
CREATE TABLE "_CharacterToFocus" (
    "A" TEXT NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CharacterToFocus_AB_unique" ON "_CharacterToFocus"("A", "B");

-- CreateIndex
CREATE INDEX "_CharacterToFocus_B_index" ON "_CharacterToFocus"("B");

-- AddForeignKey
ALTER TABLE "_CharacterToFocus" ADD CONSTRAINT "_CharacterToFocus_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CharacterToFocus" ADD CONSTRAINT "_CharacterToFocus_B_fkey" FOREIGN KEY ("B") REFERENCES "Focus"("id") ON DELETE CASCADE ON UPDATE CASCADE;
