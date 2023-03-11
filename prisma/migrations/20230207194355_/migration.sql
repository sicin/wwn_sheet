/*
  Warnings:

  - You are about to drop the column `mx_hp` on the `Character` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Character" DROP COLUMN "mx_hp",
ADD COLUMN     "max_hp" INTEGER NOT NULL DEFAULT 0;
