-- MySQL Script generated by MySQL Workbench
-- Tue May 16 12:20:34 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Province`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Province` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Province` (
  `idProvince` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idProvince`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Locality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Locality` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Locality` (
  `idLocality` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Province_idProvince` INT NOT NULL,
  `Province_idProvince1` INT NOT NULL,
  `ZIP` INT NOT NULL,
  PRIMARY KEY (`idLocality`),
  CONSTRAINT `fk_Locality_Province`
    FOREIGN KEY (`Province_idProvince1`)
    REFERENCES `mydb`.`Province` (`idProvince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idLocality_UNIQUE` ON `mydb`.`Locality` (`idLocality` ASC) VISIBLE;

CREATE INDEX `fk_Locality_Province_idx` ON `mydb`.`Locality` (`Province_idProvince1` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Shop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Shop` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Shop` (
  `idShop` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Puesto` VARCHAR(45) NOT NULL,
  `Locality_idLocality` INT NOT NULL,
  PRIMARY KEY (`idShop`),
  CONSTRAINT `fk_Shop_Locality1`
    FOREIGN KEY (`Locality_idLocality`)
    REFERENCES `mydb`.`Locality` (`idLocality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idCategory_UNIQUE` ON `mydb`.`Shop` (`idShop` ASC) VISIBLE;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `mydb`.`Shop` (`Name` ASC) VISIBLE;

CREATE INDEX `fk_Shop_Locality1_idx` ON `mydb`.`Shop` (`Locality_idLocality` ASC) VISIBLE;

CREATE UNIQUE INDEX `Puesto_UNIQUE` ON `mydb`.`Shop` (`Puesto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `idCustomer` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(60) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Phone number` INT NOT NULL,
  `Locality_idLocality` INT NOT NULL,
  `Shop_idShop` INT NOT NULL,
  PRIMARY KEY (`idCustomer`),
  CONSTRAINT `fk_Customer_Locality1`
    FOREIGN KEY (`Locality_idLocality`)
    REFERENCES `mydb`.`Locality` (`idLocality`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Shop1`
    FOREIGN KEY (`Shop_idShop`)
    REFERENCES `mydb`.`Shop` (`idShop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idCustomer_UNIQUE` ON `mydb`.`Customer` (`idCustomer` ASC) VISIBLE;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `mydb`.`Customer` (`Name` ASC) VISIBLE;

CREATE UNIQUE INDEX `Surname_UNIQUE` ON `mydb`.`Customer` (`Surname` ASC) VISIBLE;

CREATE UNIQUE INDEX `Phone number_UNIQUE` ON `mydb`.`Customer` (`Phone number` ASC) VISIBLE;

CREATE INDEX `fk_Customer_Locality1_idx` ON `mydb`.`Customer` (`Locality_idLocality` ASC) VISIBLE;

CREATE INDEX `fk_Customer_Shop1_idx` ON `mydb`.`Customer` (`Shop_idShop` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Order` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `Date/Time` DATETIME NOT NULL,
  `Delivery/PickUp` VARCHAR(45) NOT NULL,
  `TotalPrice` INT NOT NULL,
  `Shop_idShop` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  CONSTRAINT `fk_Order_Shop1`
    FOREIGN KEY (`Shop_idShop`)
    REFERENCES `mydb`.`Shop` (`idShop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idOrder_UNIQUE` ON `mydb`.`Order` (`idOrder` ASC) VISIBLE;

CREATE UNIQUE INDEX `Date/Time_UNIQUE` ON `mydb`.`Order` (`Date/Time` ASC) VISIBLE;

CREATE UNIQUE INDEX `Delivery/PickUp_UNIQUE` ON `mydb`.`Order` (`Delivery/PickUp` ASC) VISIBLE;

CREATE INDEX `fk_Order_Shop1_idx` ON `mydb`.`Order` (`Shop_idShop` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Product` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `idProduct` INT NOT NULL,
  `Type` ENUM('Pizza', 'Burguer', 'Drinks') NOT NULL,
  `Description` VARCHAR(100) NOT NULL,
  `Image` VARCHAR(45) NOT NULL,
  `Price` INT NOT NULL,
  `Order_idOrder` INT NOT NULL,
  PRIMARY KEY (`idProduct`),
  CONSTRAINT `fk_Product_Order1`
    FOREIGN KEY (`Order_idOrder`)
    REFERENCES `mydb`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Product_Order1_idx` ON `mydb`.`Product` (`Order_idOrder` ASC) VISIBLE;

CREATE UNIQUE INDEX `Price_UNIQUE` ON `mydb`.`Product` (`Price` ASC) VISIBLE;

CREATE UNIQUE INDEX `Description_UNIQUE` ON `mydb`.`Product` (`Description` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idCategory_UNIQUE` ON `mydb`.`Category` (`idCategory` ASC) VISIBLE;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `mydb`.`Category` (`Name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Pizza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pizza` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pizza` (
  `idPizza` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Category_idCategory` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  PRIMARY KEY (`idPizza`),
  CONSTRAINT `fk_Pizza_Category1`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `mydb`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pizza_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `mydb`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idPizza_UNIQUE` ON `mydb`.`Pizza` (`idPizza` ASC) VISIBLE;

CREATE INDEX `fk_Pizza_Category1_idx` ON `mydb`.`Pizza` (`Category_idCategory` ASC) VISIBLE;

CREATE INDEX `fk_Pizza_Product1_idx` ON `mydb`.`Pizza` (`Product_idProduct` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Burguer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Burguer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Burguer` (
  `idBurguer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Product_idProduct` INT NOT NULL,
  PRIMARY KEY (`idBurguer`),
  CONSTRAINT `fk_Burguer_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `mydb`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Burguer_Product1_idx` ON `mydb`.`Burguer` (`Product_idProduct` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Employee` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `idEmployee` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `Shop_idShop` INT NOT NULL,
  `Order_idOrder` INT NOT NULL,
  PRIMARY KEY (`idEmployee`),
  CONSTRAINT `fk_Employee_Shop1`
    FOREIGN KEY (`Shop_idShop`)
    REFERENCES `mydb`.`Shop` (`idShop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Order1`
    FOREIGN KEY (`Order_idOrder`)
    REFERENCES `mydb`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idEmployee_UNIQUE` ON `mydb`.`Employee` (`idEmployee` ASC) VISIBLE;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `mydb`.`Employee` (`Name` ASC) VISIBLE;

CREATE UNIQUE INDEX `Surname_UNIQUE` ON `mydb`.`Employee` (`Surname` ASC) VISIBLE;

CREATE UNIQUE INDEX `PhoneNumber_UNIQUE` ON `mydb`.`Employee` (`PhoneNumber` ASC) VISIBLE;

CREATE UNIQUE INDEX `NIF_UNIQUE` ON `mydb`.`Employee` (`NIF` ASC) VISIBLE;

CREATE INDEX `fk_Employee_Shop1_idx` ON `mydb`.`Employee` (`Shop_idShop` ASC) VISIBLE;

CREATE INDEX `fk_Employee_Order1_idx` ON `mydb`.`Employee` (`Order_idOrder` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
