/*
  Warnings:

  - You are about to drop the column `baseDescription` on the `Focus` table. All the data in the column will be lost.
  - You are about to drop the column `isExpansion` on the `Focus` table. All the data in the column will be lost.
  - You are about to drop the column `levelOneDescription` on the `Focus` table. All the data in the column will be lost.
  - You are about to drop the column `levelTwoDescription` on the `Focus` table. All the data in the column will be lost.
  - Added the required column `base_description` to the `Focus` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Focus" DROP COLUMN "baseDescription",
DROP COLUMN "isExpansion",
DROP COLUMN "levelOneDescription",
DROP COLUMN "levelTwoDescription",
ADD COLUMN     "base_description" TEXT NOT NULL,
ADD COLUMN     "characterId" TEXT,
ADD COLUMN     "is_expansion" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "level_one_description" TEXT,
ADD COLUMN     "level_two_description" TEXT;

-- AddForeignKey
ALTER TABLE "Focus" ADD CONSTRAINT "Focus_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE SET NULL ON UPDATE CASCADE;
