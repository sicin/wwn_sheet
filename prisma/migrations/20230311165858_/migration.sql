/*
  Warnings:

  - You are about to drop the column `charisma` on the `Attributes` table. All the data in the column will be lost.
  - You are about to drop the column `constitution` on the `Attributes` table. All the data in the column will be lost.
  - You are about to drop the column `dexterityValuesId` on the `Attributes` table. All the data in the column will be lost.
  - You are about to drop the column `intelligence` on the `Attributes` table. All the data in the column will be lost.
  - You are about to drop the column `strengthValuesId` on the `Attributes` table. All the data in the column will be lost.
  - You are about to drop the column `wisdom` on the `Attributes` table. All the data in the column will be lost.
  - Added the required column `charisma_values_id` to the `Attributes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `constitution_values_id` to the `Attributes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dexterity_values_id` to the `Attributes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `intelligence_values_id` to the `Attributes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `strength_values_id` to the `Attributes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `wisdom_values_id` to the `Attributes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `attributes_id` to the `Character` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Attributes" DROP CONSTRAINT "Attributes_dexterityValuesId_fkey";

-- DropForeignKey
ALTER TABLE "Attributes" DROP CONSTRAINT "Attributes_strengthValuesId_fkey";

-- AlterTable
ALTER TABLE "Attributes" DROP COLUMN "charisma",
DROP COLUMN "constitution",
DROP COLUMN "dexterityValuesId",
DROP COLUMN "intelligence",
DROP COLUMN "strengthValuesId",
DROP COLUMN "wisdom",
ADD COLUMN     "charisma_values_id" INTEGER NOT NULL,
ADD COLUMN     "constitution_values_id" INTEGER NOT NULL,
ADD COLUMN     "dexterity_values_id" INTEGER NOT NULL,
ADD COLUMN     "intelligence_values_id" INTEGER NOT NULL,
ADD COLUMN     "strength_values_id" INTEGER NOT NULL,
ADD COLUMN     "wisdom_values_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Character" ADD COLUMN     "attributes_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_attributes_id_fkey" FOREIGN KEY ("attributes_id") REFERENCES "Attributes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attributes" ADD CONSTRAINT "Attributes_strength_values_id_fkey" FOREIGN KEY ("strength_values_id") REFERENCES "AttributeValues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attributes" ADD CONSTRAINT "Attributes_dexterity_values_id_fkey" FOREIGN KEY ("dexterity_values_id") REFERENCES "AttributeValues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attributes" ADD CONSTRAINT "Attributes_constitution_values_id_fkey" FOREIGN KEY ("constitution_values_id") REFERENCES "AttributeValues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attributes" ADD CONSTRAINT "Attributes_intelligence_values_id_fkey" FOREIGN KEY ("intelligence_values_id") REFERENCES "AttributeValues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attributes" ADD CONSTRAINT "Attributes_wisdom_values_id_fkey" FOREIGN KEY ("wisdom_values_id") REFERENCES "AttributeValues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attributes" ADD CONSTRAINT "Attributes_charisma_values_id_fkey" FOREIGN KEY ("charisma_values_id") REFERENCES "AttributeValues"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
