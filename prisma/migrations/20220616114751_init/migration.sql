/*
  Warnings:

  - Added the required column `location` to the `Architect` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nationality_id` to the `Architect` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `architect` ADD COLUMN `location` polygon NOT NULL,
    ADD COLUMN `nationality_id` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Plot` (
    `id_plot` INTEGER NOT NULL AUTO_INCREMENT,
    `cadastral_reference` VARCHAR(20) NOT NULL,
    `location` polygon NOT NULL,
    `surface` INTEGER NOT NULL,

    UNIQUE INDEX `Plot_id_plot_key`(`id_plot`),
    UNIQUE INDEX `Plot_cadastral_reference_key`(`cadastral_reference`),
    PRIMARY KEY (`id_plot`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Nationality` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `country` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `Nationality_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Architect` ADD CONSTRAINT `Architect_nationality_id_fkey` FOREIGN KEY (`nationality_id`) REFERENCES `Nationality`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
