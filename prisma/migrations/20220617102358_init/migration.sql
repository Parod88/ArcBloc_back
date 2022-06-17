-- CreateTable
CREATE TABLE `Architect` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `dateOf_birth` DATE NOT NULL,
    `id_nationality` INTEGER UNSIGNED NOT NULL,
    `id_studio` INTEGER UNSIGNED NOT NULL,
    `location` polygon NOT NULL,
    `signed_up` BOOLEAN NOT NULL DEFAULT false,
    `signed_in` BOOLEAN NOT NULL DEFAULT false,
    `typeOf_subscription` INTEGER UNSIGNED NOT NULL,

    UNIQUE INDEX `Architect_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `phone_number` INTEGER UNSIGNED NOT NULL,
    `location` polygon NOT NULL,
    `is_architect` BOOLEAN NOT NULL DEFAULT false,
    `is_client` BOOLEAN NOT NULL DEFAULT false,
    `typeOf_subscription` INTEGER UNSIGNED NOT NULL,

    UNIQUE INDEX `User_id_key`(`id`),
    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_phone_number_key`(`phone_number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Projects` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `yearOf_start` YEAR NOT NULL,
    `yearOf_finish` YEAR NOT NULL,
    `location` polygon NOT NULL,

    UNIQUE INDEX `Projects_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Studio` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `Studio_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Plot` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `cadastral_reference` VARCHAR(20) NOT NULL,
    `location` polygon NOT NULL,
    `surface` INTEGER NOT NULL,

    UNIQUE INDEX `Plot_id_key`(`id`),
    UNIQUE INDEX `Plot_cadastral_reference_key`(`cadastral_reference`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Nationality` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `country` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `Nationality_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Architect` ADD CONSTRAINT `Architect_id_studio_fkey` FOREIGN KEY (`id_studio`) REFERENCES `Studio`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Architect` ADD CONSTRAINT `Architect_id_nationality_fkey` FOREIGN KEY (`id_nationality`) REFERENCES `Nationality`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
