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
CREATE SCHEMA IF NOT EXISTS `myFridgeDB` DEFAULT CHARACTER SET utf8 ;
USE `myFridgeDB` ;

-- -----------------------------------------------------
-- Table `myFridgeDB`.`ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`ingredients` (
  `ingID` INT GENERATED ALWAYS AS () VIRTUAL,
  `iname` VARCHAR(45) NULL,
  `dateLogged` INT NULL,
  `quantity` INT NULL,
  `expDate` INT NULL,
  PRIMARY KEY (`ingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.`icategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`icategory` (
  `icatID` INT GENERATED ALWAYS AS (0) VIRTUAL,
  `icname` VARCHAR(45) NULL,
  `desc` VARCHAR(45) NULL,
  PRIMARY KEY (`icatID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.`recipie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`recipie` (
  `desc` VARCHAR(200) NOT NULL,
  `difficult` INT NULL,
  `instructions` VARCHAR(200) NULL,
  `recipieID` INT GENERATED ALWAYS AS (0) VIRTUAL,
  PRIMARY KEY (`recipieID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.`ingredients_has_recipie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`ingredients_has_recipie` (
  `ingredients_ingID` INT NOT NULL,
  `recipie_recipieID` INT NOT NULL,
  PRIMARY KEY (`ingredients_ingID`, `recipie_recipieID`),
  INDEX `fk_ingredients_has_recipie_recipie1_idx` (`recipie_recipieID` ASC),
  INDEX `fk_ingredients_has_recipie_ingredients_idx` (`ingredients_ingID` ASC),
  CONSTRAINT `fk_ingredients_has_recipie_ingredients`
    FOREIGN KEY (`ingredients_ingID`)
    REFERENCES `myFridgeDB`.`ingredients` (`ingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredients_has_recipie_recipie1`
    FOREIGN KEY (`recipie_recipieID`)
    REFERENCES `myFridgeDB`.`recipie` (`recipieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.`icategory_has_ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`icategory_has_ingredients` (
  `icategory_icatID` INT NOT NULL,
  `ingredients_ingID` INT NOT NULL,
  PRIMARY KEY (`icategory_icatID`, `ingredients_ingID`),
  INDEX `fk_icategory_has_ingredients_ingredients1_idx` (`ingredients_ingID` ASC),
  INDEX `fk_icategory_has_ingredients_icategory1_idx` (`icategory_icatID` ASC),
  CONSTRAINT `fk_icategory_has_ingredients_icategory1`
    FOREIGN KEY (`icategory_icatID`)
    REFERENCES `myFridgeDB`.`icategory` (`icatID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_icategory_has_ingredients_ingredients1`
    FOREIGN KEY (`ingredients_ingID`)
    REFERENCES `myFridgeDB`.`ingredients` (`ingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.` rcategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.` rcategory` (
  `rcatID` INT GENERATED ALWAYS AS (0) VIRTUAL,
  `rcname` VARCHAR(45) NULL,
  `desc` VARCHAR(45) NULL,
  PRIMARY KEY (`rcatID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myFridgeDB`.`recipie_has_ rcategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myFridgeDB`.`recipie_has_ rcategory` (
  `recipie_recipieID` INT NOT NULL,
  ` rcategory_rcatID` INT NOT NULL,
  PRIMARY KEY (`recipie_recipieID`, ` rcategory_rcatID`),
  INDEX `fk_recipie_has_ rcategory_ rcategory1_idx` (` rcategory_rcatID` ASC),
  INDEX `fk_recipie_has_ rcategory_recipie1_idx` (`recipie_recipieID` ASC),
  CONSTRAINT `fk_recipie_has_ rcategory_recipie1`
    FOREIGN KEY (`recipie_recipieID`)
    REFERENCES `myFridgeDB`.`recipie` (`recipieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipie_has_ rcategory_ rcategory1`
    FOREIGN KEY (` rcategory_rcatID`)
    REFERENCES `myFridgeDB`.` rcategory` (`rcatID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
