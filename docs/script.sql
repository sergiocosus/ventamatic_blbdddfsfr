SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `ventamatic` ;
CREATE SCHEMA IF NOT EXISTS `ventamatic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ventamatic` ;

-- -----------------------------------------------------
-- Table `ventamatic`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`states` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`municipalities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`municipalities` (
  `id` INT UNSIGNED NOT NULL,
  `state_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `state_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_municipality_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_municipality_state`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`states` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`localities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`localities` (
  `id` INT UNSIGNED NOT NULL,
  `municipality_id` INT UNSIGNED NOT NULL,
  `state_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`, `municipality_id`, `state_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_locality_municipality_idx` (`municipality_id` ASC),
  INDEX `fk_locality_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_locality_municipality`
    FOREIGN KEY (`municipality_id`)
    REFERENCES `ventamatic`.`municipalities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locality_state`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`municipalities` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`clients` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `cell_phone` VARCHAR(45) NULL,
  `adress` VARCHAR(100) NULL,
  `email` VARCHAR(200) NULL,
  `rfc` VARCHAR(20) NULL,
  `locality_id` INT UNSIGNED NULL,
  `municipality_id` INT UNSIGNED NULL,
  `state_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC),
  INDEX `fk_client_locality_idx` (`locality_id` ASC),
  INDEX `fk_client_municipality_idx` (`municipality_id` ASC),
  INDEX `fk_client_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_client_locality`
    FOREIGN KEY (`locality_id`)
    REFERENCES `ventamatic`.`localities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_municipality`
    FOREIGN KEY (`municipality_id`)
    REFERENCES `ventamatic`.`localities` (`municipality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_state`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`localities` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`providers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`providers` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `cell_phone` VARCHAR(45) NULL,
  `adress` VARCHAR(100) NULL,
  `email` VARCHAR(200) NULL,
  `rfc` VARCHAR(20) NULL,
  `locality_id` INT UNSIGNED NULL,
  `municipality_id` INT UNSIGNED NULL,
  `state_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC),
  INDEX `fk_client_locality_idx` (`locality_id` ASC),
  INDEX `fk_client_municipality_idx` (`municipality_id` ASC),
  INDEX `fk_client_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_client_locality0`
    FOREIGN KEY (`locality_id`)
    REFERENCES `ventamatic`.`localities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_municipality0`
    FOREIGN KEY (`municipality_id`)
    REFERENCES `ventamatic`.`localities` (`municipality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_state0`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`localities` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NOT NULL,
  `cell_phone` VARCHAR(45) NULL,
  `adress` VARCHAR(100) NULL,
  `email` VARCHAR(200) NULL,
  `rfc` VARCHAR(20) NULL,
  `locality_id` INT UNSIGNED NULL,
  `municipality_id` INT UNSIGNED NULL,
  `state_id` INT UNSIGNED NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `password` VARCHAR(60) NULL,
  `remember_token` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC),
  INDEX `fk_client_locality_idx` (`locality_id` ASC),
  INDEX `fk_client_municipality_idx` (`municipality_id` ASC),
  INDEX `fk_client_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_user_locality`
    FOREIGN KEY (`locality_id`)
    REFERENCES `ventamatic`.`localities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_municipality`
    FOREIGN KEY (`municipality_id`)
    REFERENCES `ventamatic`.`localities` (`municipality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_state`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`localities` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`branches` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`innings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`innings` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `branch_id` INT UNSIGNED NOT NULL,
  `status` ENUM('A','F') NOT NULL DEFAULT 'A' COMMENT 'A= Active\nF= Finished',
  `initial` DECIMAL(10,2) NULL,
  `final` DECIMAL(10,2) NULL,
  `calculed` DECIMAL(10,2) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_innings_branch_idx` (`branch_id` ASC),
  INDEX `fk_innings_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_innings_branch`
    FOREIGN KEY (`branch_id`)
    REFERENCES `ventamatic`.`branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_innings_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ventamatic`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`buys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`buys` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `provider_id` INT UNSIGNED NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_buys_branch_idx` (`branch_id` ASC),
  INDEX `fk_buys_user_idx` (`user_id` ASC),
  INDEX `fk_buys_provider_idx` (`provider_id` ASC),
  CONSTRAINT `fk_buys_branch`
    FOREIGN KEY (`branch_id`)
    REFERENCES `ventamatic`.`branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_buys_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ventamatic`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_buys_provider`
    FOREIGN KEY (`provider_id`)
    REFERENCES `ventamatic`.`providers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`products` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `minimum` INT UNSIGNED NULL,
  `unit` ENUM('U','KG', 'L') NOT NULL COMMENT 'U=Unit\nKG=kilograms\nL=liter',
  `bar_code` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `bar_code_UNIQUE` (`bar_code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`branch_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`branch_product` (
  `branch_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `stock` DECIMAL(10,3) UNSIGNED NULL DEFAULT 0,
  `price` DECIMAL(10,3) UNSIGNED NULL,
  `cost` DECIMAL(10,3) UNSIGNED NULL,
  PRIMARY KEY (`branch_id`, `product_id`),
  INDEX `fk_branch_product_idx` (`product_id` ASC),
  CONSTRAINT `fk_branch_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `ventamatic`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_branch`
    FOREIGN KEY (`branch_id`)
    REFERENCES `ventamatic`.`branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`branch_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`branch_user` (
  `branch_id` INT UNSIGNED NOT NULL COMMENT '	',
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`branch_id`, `user_id`),
  INDEX `fk_branch_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_branch_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ventamatic`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_branch`
    FOREIGN KEY (`branch_id`)
    REFERENCES `ventamatic`.`branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`sales` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `client_id` INT UNSIGNED NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_buys_branch_idx` (`branch_id` ASC),
  INDEX `fk_buys_user_idx` (`user_id` ASC),
  INDEX `fk_sale_client_idx` (`client_id` ASC),
  CONSTRAINT `fk_sale_branch`
    FOREIGN KEY (`branch_id`)
    REFERENCES `ventamatic`.`branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ventamatic`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sale_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `ventamatic`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`buy_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`buy_product` (
  `buy_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NULL,
  `cost` DECIMAL(10,2) UNSIGNED NULL,
  PRIMARY KEY (`buy_id`, `product_id`),
  INDEX `fk_buy_product_idx` (`product_id` ASC),
  CONSTRAINT `fk_buy_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `ventamatic`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_buy`
    FOREIGN KEY (`buy_id`)
    REFERENCES `ventamatic`.`buys` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`sale_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`sale_product` (
  `sale_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NULL,
  `price` DECIMAL(10,2) UNSIGNED NULL,
  PRIMARY KEY (`sale_id`, `product_id`),
  INDEX `fk_buy_product_idx` (`product_id` ASC),
  CONSTRAINT `fk_sale_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `ventamatic`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_sale`
    FOREIGN KEY (`sale_id`)
    REFERENCES `ventamatic`.`sales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
