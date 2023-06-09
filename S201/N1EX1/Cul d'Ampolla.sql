-- MySQL Script generated by MySQL Workbench
-- Tue May 16 10:25:56 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optica` DEFAULT CHARACTER SET utf8 ;
USE `Optica` ;

-- -----------------------------------------------------
-- Table `Optica`.`Supplier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Supplier` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Supplier` (
  `idsupplier` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Adress` VARCHAR(100) NOT NULL,
  `Phone` INT NOT NULL,
  `FAX` INT NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idsupplier`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idsupplier_UNIQUE` ON `Optica`.`Supplier` (`idsupplier` ASC) VISIBLE;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `Optica`.`Supplier` (`Name` ASC) VISIBLE;

CREATE UNIQUE INDEX `Adress_UNIQUE` ON `Optica`.`Supplier` (`Adress` ASC) VISIBLE;

CREATE UNIQUE INDEX `Phone_UNIQUE` ON `Optica`.`Supplier` (`Phone` ASC) VISIBLE;

CREATE UNIQUE INDEX `FAX_UNIQUE` ON `Optica`.`Supplier` (`FAX` ASC) VISIBLE;

CREATE UNIQUE INDEX `NIF_UNIQUE` ON `Optica`.`Supplier` (`NIF` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Optica`.`Brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Brand` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Brand` (
  `idBrand` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Supplier_idsupplier` INT NOT NULL,
  PRIMARY KEY (`idBrand`),
  CONSTRAINT `fk_Brand_Supplier1`
    FOREIGN KEY (`Supplier_idsupplier`)
    REFERENCES `Optica`.`Supplier` (`idsupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idBrand_UNIQUE` ON `Optica`.`Brand` (`idBrand` ASC) VISIBLE;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `Optica`.`Brand` (`Name` ASC) VISIBLE;

CREATE INDEX `fk_Brand_Supplier1_idx` ON `Optica`.`Brand` (`Supplier_idsupplier` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Optica`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Employee` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Employee` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idEmployee_UNIQUE` ON `Optica`.`Employee` (`idEmployee` ASC) VISIBLE;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `Optica`.`Employee` (`Name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Optica`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Customer` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(60) NOT NULL,
  `Adress` VARCHAR(100) NOT NULL,
  `Phone` INT NOT NULL,
  `Mail` VARCHAR(50) NOT NULL,
  `RegisterDate` DATE NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  `Recomendation_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idCustomer`),
  CONSTRAINT `fk_Customer_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `Optica`.`Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Customer1`
    FOREIGN KEY (`Recomendation_idCustomer`)
    REFERENCES `Optica`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `Optica`.`Customer` (`Name` ASC) VISIBLE;

CREATE UNIQUE INDEX `Adress_UNIQUE` ON `Optica`.`Customer` (`Adress` ASC) VISIBLE;

CREATE UNIQUE INDEX `Phone_UNIQUE` ON `Optica`.`Customer` (`Phone` ASC) VISIBLE;

CREATE UNIQUE INDEX `Mail_UNIQUE` ON `Optica`.`Customer` (`Mail` ASC) VISIBLE;

CREATE UNIQUE INDEX `RegisterDate_UNIQUE` ON `Optica`.`Customer` (`RegisterDate` ASC) VISIBLE;

CREATE INDEX `fk_Customer_Employee1_idx` ON `Optica`.`Customer` (`Employee_idEmployee` ASC) VISIBLE;

CREATE INDEX `fk_Customer_Customer1_idx` ON `Optica`.`Customer` (`Recomendation_idCustomer` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Optica`.`Compra/Venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Compra/Venta` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Compra/Venta` (
  `idCul d'Ampolla` INT NOT NULL AUTO_INCREMENT,
  `Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idCul d'Ampolla`),
  CONSTRAINT `fk_Compra/Venta_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `Optica`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idCul d'Ampolla_UNIQUE` ON `Optica`.`Compra/Venta` (`idCul d'Ampolla` ASC) VISIBLE;

CREATE INDEX `fk_Compra/Venta_Customer1_idx` ON `Optica`.`Compra/Venta` (`Customer_idCustomer` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Optica`.`Glasses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Glasses` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Glasses` (
  `idGlasses` INT NOT NULL AUTO_INCREMENT,
  `GlassesGraduation D` DECIMAL(10) NOT NULL,
  `GlassesGraduation I` DECIMAL(10) NOT NULL,
  `GlassesFrame` VARCHAR(10) NOT NULL,
  `FrameColor` VARCHAR(20) NOT NULL,
  `GlassColor D` VARCHAR(20) NOT NULL,
  `GlassesColor I` VARCHAR(20) NOT NULL,
  `Price` INT NOT NULL,
  `Glassescol` VARCHAR(45) NOT NULL,
  `Brand_idBrand` INT NOT NULL,
  `Compra/Venta_idCul d'Ampolla` INT NOT NULL,
  PRIMARY KEY (`idGlasses`),
  CONSTRAINT `fk_Glasses_Brand1`
    FOREIGN KEY (`Brand_idBrand`)
    REFERENCES `Optica`.`Brand` (`idBrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Compra/Venta1`
    FOREIGN KEY (`Compra/Venta_idCul d'Ampolla`)
    REFERENCES `Optica`.`Compra/Venta` (`idCul d'Ampolla`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idGlasses_UNIQUE` ON `Optica`.`Glasses` (`idGlasses` ASC) VISIBLE;

CREATE INDEX `fk_Glasses_Brand1_idx` ON `Optica`.`Glasses` (`Brand_idBrand` ASC) VISIBLE;

CREATE INDEX `fk_Glasses_Compra/Venta1_idx` ON `Optica`.`Glasses` (`Compra/Venta_idCul d'Ampolla` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
