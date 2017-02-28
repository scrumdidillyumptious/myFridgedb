-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema myFridgeDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema myFridgeDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `myFridgeDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `myFridgeDB` ;

-- -----------------------------------------------------
-- Table `myFridgeDB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`users` (
  `userid` INT NOT NULL,
  `username` VARCHAR(30) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`userid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.`ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`ingredients` (
  `ingID` INT NOT NULL,
  `iname` VARCHAR(45) NULL,
  `dateLogged` INT NULL,
  `quantity` INT NULL,
  `expDate` INT NULL,
  `category` VARCHAR(60) NULL,
  `users_userid` INT NOT NULL,
  PRIMARY KEY (`ingID`, `users_userid`),
  INDEX `fk_ingredients_users1_idx` (`users_userid` ASC),
  CONSTRAINT `fk_ingredients_users1`
    FOREIGN KEY (`users_userid`)
    REFERENCES `myFridgeDB`.`users` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.`recipie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`recipie` (
  `rname` VARCHAR(200) NULL,
  `difficulty` INT NULL,
  `instructions` VARCHAR(250) NULL,
  `recipieID` INT NOT NULL,
  `category` VARCHAR(60) NULL,
  `users_userid` INT NOT NULL,
  PRIMARY KEY (`recipieID`, `users_userid`),
  INDEX `fk_recipie_users1_idx` (`users_userid` ASC),
  CONSTRAINT `fk_recipie_users1`
    FOREIGN KEY (`users_userid`)
    REFERENCES `myFridgeDB`.`users` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.`recipie_has_ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`recipie_has_ingredients` (
  `recipie_recipieID` INT NOT NULL,
  `ingredients_ingID` INT NOT NULL,
  PRIMARY KEY (`recipie_recipieID`, `ingredients_ingID`),
  INDEX `fk_recipie_has_ingredients_ingredients1_idx` (`ingredients_ingID` ASC),
  INDEX `fk_recipie_has_ingredients_recipie_idx` (`recipie_recipieID` ASC),
  CONSTRAINT `fk_recipie_has_ingredients_recipie`
    FOREIGN KEY (`recipie_recipieID`)
    REFERENCES `myFridgeDB`.`recipie` (`recipieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipie_has_ingredients_ingredients1`
    FOREIGN KEY (`ingredients_ingID`)
    REFERENCES `myFridgeDB`.`ingredients` (`ingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

