/*
  Warnings:

  - You are about to drop the `Item` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Equipment" DROP CONSTRAINT "Equipment_item_id_fkey";

-- DropTable
DROP TABLE "Item";

-- CreateTable
CREATE TABLE "item" (
    "id" SERIAL NOT NULL,
    "quantity" INTEGER,
    "quantity_modifier" VARCHAR(64),
    "is_weightless" BOOLEAN NOT NULL DEFAULT false,
    "is_weightless_worn" BOOLEAN NOT NULL DEFAULT false,
    "can_be_bundled" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "item_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "item"("id") ON DELETE SET NULL ON UPDATE CASCADE;
