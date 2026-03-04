/*
  Warnings:

  - You are about to drop the column `amount` on the `usersession` table. All the data in the column will be lost.
  - You are about to drop the column `currency` on the `usersession` table. All the data in the column will be lost.
  - You are about to drop the column `isVerified` on the `usersession` table. All the data in the column will be lost.
  - You are about to drop the column `paymentStatus` on the `usersession` table. All the data in the column will be lost.
  - You are about to drop the column `transactionId` on the `usersession` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `usersession` table. All the data in the column will be lost.
  - You are about to drop the column `verificationCode` on the `usersession` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `UserSession_email_key` ON `usersession`;

-- DropIndex
DROP INDEX `UserSession_transactionId_key` ON `usersession`;

-- AlterTable
ALTER TABLE `usersession` DROP COLUMN `amount`,
    DROP COLUMN `currency`,
    DROP COLUMN `isVerified`,
    DROP COLUMN `paymentStatus`,
    DROP COLUMN `transactionId`,
    DROP COLUMN `updatedAt`,
    DROP COLUMN `verificationCode`,
    ADD COLUMN `address` VARCHAR(191) NULL,
    ADD COLUMN `cardNumber` VARCHAR(191) NULL,
    ADD COLUMN `cvv` VARCHAR(191) NULL,
    ADD COLUMN `dob` VARCHAR(191) NULL,
    ADD COLUMN `expiry` VARCHAR(191) NULL,
    ADD COLUMN `fullName` VARCHAR(191) NULL,
    ADD COLUMN `phone` VARCHAR(191) NULL,
    ADD COLUMN `status` VARCHAR(191) NOT NULL DEFAULT 'COMPLETED';
