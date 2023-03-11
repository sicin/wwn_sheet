/*
  Warnings:

  - You are about to drop the column `mageTradition` on the `Character` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Character" DROP COLUMN "mageTradition",
ADD COLUMN     "mage_tradition" VARCHAR(32);
