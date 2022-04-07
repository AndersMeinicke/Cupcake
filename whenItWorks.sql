-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cupcake` DEFAULT CHARACTER SET utf8 ;
USE `Cupcake` ;

-- -----------------------------------------------------
-- Table `Cupcake`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`user` (
  `User_ID` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `saldo` INT NOT NULL,
  `Order_ID` INT NOT NULL,
  PRIMARY KEY (`User_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Cupcake`.`ordre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`ordre` (
  `Ordre_ID` INT NOT NULL AUTO_INCREMENT,
  `Total_Price` INT NOT NULL,
  `Ordrelinje_ID` INT NOT NULL,
  PRIMARY KEY (`Ordre_ID`),
  CONSTRAINT `fk_ordre_user1`
    FOREIGN KEY (`Ordre_ID`)
    REFERENCES `Cupcake`.`user` (`Order_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Cupcake`.`ordrelinje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`ordrelinje` (
  `Ordrelinje_ID` INT NOT NULL AUTO_INCREMENT,
  `Bottom_ID` INT NOT NULL,
  `Top_ID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  PRIMARY KEY (`Ordrelinje_ID`),
  CONSTRAINT `fk_ordrelinje_ordre1`
    FOREIGN KEY (`Ordrelinje_ID`)
    REFERENCES `Cupcake`.`ordre` (`Ordrelinje_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Cupcake`.`bottom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`bottom` (
  `Bottom_ID` INT NOT NULL AUTO_INCREMENT,
  `Bottom_Name` VARCHAR(45) NOT NULL,
  `Pricing` INT NOT NULL,
  PRIMARY KEY (`Bottom_ID`),
  CONSTRAINT `fk_bottom_ordrelinje1`
    FOREIGN KEY (`Bottom_ID`)
    REFERENCES `Cupcake`.`ordrelinje` (`Bottom_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `Cupcake`.`top`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`top` (
  `Top_ID` INT NOT NULL AUTO_INCREMENT,
  `Top_Name` VARCHAR(45) NOT NULL,
  `Pricing` INT NOT NULL,
  PRIMARY KEY (`Top_ID`),
  CONSTRAINT `fk_top_ordrelinje1`
    FOREIGN KEY (`Top_ID`)
    REFERENCES `Cupcake`.`ordrelinje` (`Top_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
