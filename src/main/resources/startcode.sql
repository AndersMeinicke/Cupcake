-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = ''ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'';

-- -----------------------------------------------------
-- Schema Cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cupcake` DEFAULT CHARACTER SET utf8;
USE `Cupcake`;

-- -----------------------------------------------------
-- Table `Cupcake`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`User`
(
    `User_ID`  INT         NOT NULL AUTO_INCREMENT,
    `Email`    VARCHAR(45) NOT NULL,
    `Password` VARCHAR(45) NOT NULL,
    `Role`     VARCHAR(45) NOT NULL,
    `Saldo`    INT         NOT NULL,
    PRIMARY KEY (`User_ID`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cupcake`.`Ordre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Ordre`
(
    `Ordre_ID`      INT NOT NULL AUTO_INCREMENT,
    `User_ID`       INT NOT NULL,
    `Total_Price`   INT NOT NULL,
    `Ordrelinje_ID` INT NOT NULL,
    PRIMARY KEY (`Ordre_ID`),
    INDEX `fk_Ordre_User1_idx` (`User_ID` ASC) VISIBLE,
    CONSTRAINT `fk_Ordre_User1`
        FOREIGN KEY (`User_ID`)
            REFERENCES `Cupcake`.`User` (`User_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cupcake`.`Ordrelinje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Ordrelinje`
(
    `Ordrelinje_ID` INT NOT NULL AUTO_INCREMENT,
    `Bottom_ID`     INT NOT NULL,
    `Top_ID`        INT NOT NULL,
    `Quantity`      INT NOT NULL,
    `Order_ID`      INT NOT NULL,
    PRIMARY KEY (`Ordrelinje_ID`),
    INDEX `fk_Ordrelinje_Ordre1_idx` (`Order_ID` ASC) VISIBLE,
    CONSTRAINT `fk_Ordrelinje_Ordre1`
        FOREIGN KEY (`Order_ID`)
            REFERENCES `Cupcake`.`Ordre` (`Ordre_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cupcake`.`Top`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Top`
(
    `Top_ID`   INT         NOT NULL AUTO_INCREMENT,
    `Top_Name` VARCHAR(45) NOT NULL,
    `Pricing`  INT         NOT NULL,
    PRIMARY KEY (`Top_ID`),
    CONSTRAINT `fk_Top_Ordrelinje1`
        FOREIGN KEY (`Top_ID`)
            REFERENCES `Cupcake`.`Ordrelinje` (`Top_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cupcake`.`Bottom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cupcake`.`Bottom`
(
    `Bottom_ID`   INT         NOT NULL AUTO_INCREMENT,
    `Bottom_Name` VARCHAR(45) NOT NULL,
    `Pricing`     INT         NOT NULL,
    PRIMARY KEY (`Bottom_ID`),
    CONSTRAINT `fk_Bottom_Ordrelinje1`
        FOREIGN KEY (`Bottom_ID`)
            REFERENCES `Cupcake`.`Ordrelinje` (`Bottom_ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
