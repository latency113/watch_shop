/*
  Warnings:

  - You are about to alter the column `order_date` on the `order` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.

*/
-- AlterTable
ALTER TABLE `order` MODIFY `order_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `payment_date` DATETIME(3) NULL;
