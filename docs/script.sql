SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `ventamatic` ;
CREATE SCHEMA IF NOT EXISTS `ventamatic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ventamatic` ;

-- -----------------------------------------------------
-- Table `ventamatic`.`state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`state` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`municipality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`municipality` (
  `id` INT NOT NULL,
  `state_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `state_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_municipality_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_municipality_state`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`locality`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`locality` (
  `id` INT NOT NULL,
  `municipality_id` INT NOT NULL,
  `state_id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`, `municipality_id`, `state_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_locality_municipality_idx` (`municipality_id` ASC),
  INDEX `fk_locality_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_locality_municipality`
    FOREIGN KEY (`municipality_id`)
    REFERENCES `ventamatic`.`municipality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locality_state`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`municipality` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `lastName` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `cellPhone` VARCHAR(45) NULL,
  `adress` VARCHAR(100) NULL,
  `email` VARCHAR(200) NULL,
  `rfc` VARCHAR(20) NULL,
  `locality_id` INT NULL,
  `municipality_id` INT NULL,
  `state_id` INT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC),
  INDEX `fk_client_locality_idx` (`locality_id` ASC),
  INDEX `fk_client_municipality_idx` (`municipality_id` ASC),
  INDEX `fk_client_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_client_locality`
    FOREIGN KEY (`locality_id`)
    REFERENCES `ventamatic`.`locality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_municipality`
    FOREIGN KEY (`municipality_id`)
    REFERENCES `ventamatic`.`locality` (`municipality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_state`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`locality` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`provider` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `lastName` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `cellPhone` VARCHAR(45) NULL,
  `adress` VARCHAR(100) NULL,
  `email` VARCHAR(200) NULL,
  `rfc` VARCHAR(20) NULL,
  `locality_id` INT NULL,
  `municipality_id` INT NULL,
  `state_id` INT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC),
  INDEX `fk_client_locality_idx` (`locality_id` ASC),
  INDEX `fk_client_municipality_idx` (`municipality_id` ASC),
  INDEX `fk_client_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_client_locality0`
    FOREIGN KEY (`locality_id`)
    REFERENCES `ventamatic`.`locality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_municipality0`
    FOREIGN KEY (`municipality_id`)
    REFERENCES `ventamatic`.`locality` (`municipality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_state0`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`locality` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ventamatic`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventamatic`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `lastName` VARCHAR(45) NULL,
  `firstName` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `cellPhone` VARCHAR(45) NULL,
  `adress` VARCHAR(100) NULL,
  `email` VARCHAR(200) NULL,
  `rfc` VARCHAR(20) NULL,
  `locality_id` INT NULL,
  `municipality_id` INT NULL,
  `state_id` INT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `rfc_UNIQUE` (`rfc` ASC),
  INDEX `fk_client_locality_idx` (`locality_id` ASC),
  INDEX `fk_client_municipality_idx` (`municipality_id` ASC),
  INDEX `fk_client_state_idx` (`state_id` ASC),
  CONSTRAINT `fk_client_locality00`
    FOREIGN KEY (`locality_id`)
    REFERENCES `ventamatic`.`locality` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_municipality00`
    FOREIGN KEY (`municipality_id`)
    REFERENCES `ventamatic`.`locality` (`municipality_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_state00`
    FOREIGN KEY (`state_id`)
    REFERENCES `ventamatic`.`locality` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
