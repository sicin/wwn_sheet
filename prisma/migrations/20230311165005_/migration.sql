/*
  Warnings:

  - You are about to drop the column `dexterity` on the `Attributes` table. All the data in the column will be lost.
  - You are about to drop the column `strength` on the `Attributes` table. All the data in the column will be lost.
  - Added the required column `dexterityValuesId` to the `Attributes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `strengthValuesId` to the `Attributes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Attributes" DROP COLUMN "dexterity",
DROP COLUMN "strength",
ADD COLUMN     "dexterityValuesId" INTEGER NOT NULL,
ADD COLUMN     "strengthValuesId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Attributes" ADD CONSTRAINT "Attributes_strengthValuesId_fkey" FOREIGN KEY ("strengthValuesId") REFERENCES "AttributeValues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attributes" ADD CONSTRAINT "Attributes_dexterityValuesId_fkey" FOREIGN KEY ("dexterityValuesId") REFERENCES "AttributeValues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
