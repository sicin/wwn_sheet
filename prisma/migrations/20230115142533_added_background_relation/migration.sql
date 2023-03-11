/*
  Warnings:

  - The primary key for the `Background` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `backgroundId` on the `Background` table. All the data in the column will be lost.
  - You are about to drop the column `backgroundName` on the `Background` table. All the data in the column will be lost.
  - You are about to drop the column `freeSkill` on the `Background` table. All the data in the column will be lost.
  - You are about to drop the column `quickSkills` on the `Background` table. All the data in the column will be lost.
  - You are about to drop the column `hp` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `strain` on the `Character` table. All the data in the column will be lost.
  - The `languages` column on the `Character` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `description` to the `Background` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Background` table without a default value. This is not possible if the table is not empty.
  - Added the required column `backgroundId` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Made the column `occupation` on table `Character` required. This step will fail if there are existing NULL values in that column.
  - Made the column `name` on table `Character` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Background" DROP CONSTRAINT "Background_pkey",
DROP COLUMN "backgroundId",
DROP COLUMN "backgroundName",
DROP COLUMN "freeSkill",
DROP COLUMN "quickSkills",
ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "name" VARCHAR(32) NOT NULL,
ADD CONSTRAINT "Background_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Character" DROP COLUMN "hp",
DROP COLUMN "strain",
ADD COLUMN     "backgroundId" INTEGER NOT NULL,
ADD COLUMN     "condition" VARCHAR(64),
ADD COLUMN     "curentStrain" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "currentHp" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "maxHp" INTEGER NOT NULL DEFAULT 0,
ALTER COLUMN "occupation" SET NOT NULL,
ALTER COLUMN "name" SET NOT NULL,
DROP COLUMN "languages",
ADD COLUMN     "languages" VARCHAR(32)[] DEFAULT ARRAY['Native', 'Trade Cant']::VARCHAR(32)[];

-- CreateTable
CREATE TABLE "BackgroundThrows" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(32) NOT NULL,
    "type" VARCHAR(32) NOT NULL,
    "skill" VARCHAR(32) NOT NULL,
    "countTwice" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "BackgroundThrows_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_backgroundId_fkey" FOREIGN KEY ("backgroundId") REFERENCES "Background"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
