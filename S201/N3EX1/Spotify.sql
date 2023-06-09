-- MySQL Script generated by MySQL Workbench
-- Thu May 18 10:03:56 2023
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
-- Table `mydb`.`Paypal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Paypal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Paypal` (
  `idPaypal` INT NOT NULL,
  `Name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idPaypal`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Name_UNIQUE` ON `mydb`.`Paypal` (`Name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`CreditCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CreditCard` ;

CREATE TABLE IF NOT EXISTS `mydb`.`CreditCard` (
  `idCreditCard` INT NOT NULL,
  `Number` INT NOT NULL,
  `SecurityCode` INT NOT NULL,
  `Expiration` DATE NOT NULL,
  PRIMARY KEY (`idCreditCard`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Number_UNIQUE` ON `mydb`.`CreditCard` (`Number` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Subscription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Subscription` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Subscription` (
  `idSubscription` INT NOT NULL AUTO_INCREMENT,
  `StartSubscription` DATE NOT NULL,
  `Renovation` DATE NOT NULL,
  `Paypal_idPaypal` INT NULL,
  `CreditCard_idCreditCard` INT NULL,
  PRIMARY KEY (`idSubscription`),
  CONSTRAINT `fk_Subscription_Paypal1`
    FOREIGN KEY (`Paypal_idPaypal`)
    REFERENCES `mydb`.`Paypal` (`idPaypal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Subscription_CreditCard1`
    FOREIGN KEY (`CreditCard_idCreditCard`)
    REFERENCES `mydb`.`CreditCard` (`idCreditCard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idSubscription_UNIQUE` ON `mydb`.`Subscription` (`idSubscription` ASC) VISIBLE;

CREATE INDEX `fk_Subscription_Paypal1_idx` ON `mydb`.`Subscription` (`Paypal_idPaypal` ASC) VISIBLE;

CREATE INDEX `fk_Subscription_CreditCard1_idx` ON `mydb`.`Subscription` (`CreditCard_idCreditCard` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Library`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Library` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Library` (
  `idLibrary` INT NOT NULL AUTO_INCREMENT,
  `Similars` VARCHAR(45) NULL,
  PRIMARY KEY (`idLibrary`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UserPremium`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UserPremium` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UserPremium` (
  `idUserPremium` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(15) NOT NULL,
  `UserName` VARCHAR(20) NOT NULL,
  `Birthday` DATE NOT NULL,
  `Sex` ENUM('Male', 'Female') NOT NULL,
  `Country` VARCHAR(20) NOT NULL,
  `ZIP` INT NOT NULL,
  `Subscription_idSubscription` INT NOT NULL,
  `Library_idLibrary` INT NOT NULL,
  PRIMARY KEY (`idUserPremium`),
  CONSTRAINT `fk_UserPremium_Subscription`
    FOREIGN KEY (`Subscription_idSubscription`)
    REFERENCES `mydb`.`Subscription` (`idSubscription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserPremium_Library1`
    FOREIGN KEY (`Library_idLibrary`)
    REFERENCES `mydb`.`Library` (`idLibrary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idUserFRee_UNIQUE` ON `mydb`.`UserPremium` (`idUserPremium` ASC) VISIBLE;

CREATE UNIQUE INDEX `Email_UNIQUE` ON `mydb`.`UserPremium` (`Email` ASC) VISIBLE;

CREATE UNIQUE INDEX `UserName_UNIQUE` ON `mydb`.`UserPremium` (`UserName` ASC) VISIBLE;

CREATE INDEX `fk_UserPremium_Subscription_idx` ON `mydb`.`UserPremium` (`Subscription_idSubscription` ASC) VISIBLE;

CREATE INDEX `fk_UserPremium_Library1_idx` ON `mydb`.`UserPremium` (`Library_idLibrary` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`UserFree`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UserFree` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UserFree` (
  `idUserFree` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(15) NOT NULL,
  `UserName` VARCHAR(20) NOT NULL,
  `Birthday` DATE NOT NULL,
  `Sex` ENUM('Male', 'Female') NOT NULL,
  `Country` VARCHAR(20) NOT NULL,
  `ZIP` INT NOT NULL,
  `Library_idLibrary` INT NOT NULL,
  PRIMARY KEY (`idUserFree`),
  CONSTRAINT `fk_UserFree_Library1`
    FOREIGN KEY (`Library_idLibrary`)
    REFERENCES `mydb`.`Library` (`idLibrary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idUserFRee_UNIQUE` ON `mydb`.`UserFree` (`idUserFree` ASC) VISIBLE;

CREATE UNIQUE INDEX `Email_UNIQUE` ON `mydb`.`UserFree` (`Email` ASC) VISIBLE;

CREATE UNIQUE INDEX `UserName_UNIQUE` ON `mydb`.`UserFree` (`UserName` ASC) VISIBLE;

CREATE INDEX `fk_UserFree_Library1_idx` ON `mydb`.`UserFree` (`Library_idLibrary` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`PaymentDate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PaymentDate` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PaymentDate` (
  `PaymentDate` INT NOT NULL,
  `OrderNumber` INT NOT NULL,
  `TotalPayments` INT NOT NULL,
  `Subscription_idSubscription` INT NOT NULL,
  CONSTRAINT `fk_SubscriptionDate_Subscription1`
    FOREIGN KEY (`Subscription_idSubscription`)
    REFERENCES `mydb`.`Subscription` (`idSubscription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `OrderNumber_UNIQUE` ON `mydb`.`PaymentDate` (`OrderNumber` ASC) VISIBLE;

CREATE INDEX `fk_SubscriptionDate_Subscription1_idx` ON `mydb`.`PaymentDate` (`Subscription_idSubscription` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`PlaylistDeleted`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PlaylistDeleted` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PlaylistDeleted` (
  `idPlaylistDeleted` INT NOT NULL,
  `DateDeleted` DATE NOT NULL,
  PRIMARY KEY (`idPlaylistDeleted`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idPlaylistDeleted_UNIQUE` ON `mydb`.`PlaylistDeleted` (`idPlaylistDeleted` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`PlayList`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PlayList` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PlayList` (
  `idPlayList` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `AudioAmount` INT NULL,
  `CreationDate` DATE NOT NULL,
  `UserPremium_idUserPremium` INT NULL,
  `UserFree_idUserFree` INT NULL,
  `PlaylistDeleted_idPlaylistDeleted` INT NULL,
  PRIMARY KEY (`idPlayList`),
  CONSTRAINT `fk_PlayList_UserPremium1`
    FOREIGN KEY (`UserPremium_idUserPremium`)
    REFERENCES `mydb`.`UserPremium` (`idUserPremium`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayList_UserFree1`
    FOREIGN KEY (`UserFree_idUserFree`)
    REFERENCES `mydb`.`UserFree` (`idUserFree`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PlayList_PlaylistDeleted1`
    FOREIGN KEY (`PlaylistDeleted_idPlaylistDeleted`)
    REFERENCES `mydb`.`PlaylistDeleted` (`idPlaylistDeleted`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_PlayList_UserPremium1_idx` ON `mydb`.`PlayList` (`UserPremium_idUserPremium` ASC) VISIBLE;

CREATE INDEX `fk_PlayList_UserFree1_idx` ON `mydb`.`PlayList` (`UserFree_idUserFree` ASC) VISIBLE;

CREATE INDEX `fk_PlayList_PlaylistDeleted1_idx` ON `mydb`.`PlayList` (`PlaylistDeleted_idPlaylistDeleted` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Artist` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Artist` (
  `idArtist` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Image` VARCHAR(45) NOT NULL,
  `Library_idLibrary` INT NOT NULL,
  PRIMARY KEY (`idArtist`),
  CONSTRAINT `fk_Artist_Library1`
    FOREIGN KEY (`Library_idLibrary`)
    REFERENCES `mydb`.`Library` (`idLibrary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idArtist_UNIQUE` ON `mydb`.`Artist` (`idArtist` ASC) VISIBLE;

CREATE INDEX `fk_Artist_Library1_idx` ON `mydb`.`Artist` (`Library_idLibrary` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Album` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Album` (
  `idAlbum` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(45) NOT NULL,
  `Launch` DATE NOT NULL,
  `Image` VARCHAR(45) NOT NULL,
  `Artist_idArtist` INT NOT NULL,
  `Library_idLibrary` INT NOT NULL,
  PRIMARY KEY (`idAlbum`),
  CONSTRAINT `fk_Album_Artist1`
    FOREIGN KEY (`Artist_idArtist`)
    REFERENCES `mydb`.`Artist` (`idArtist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Album_Library1`
    FOREIGN KEY (`Library_idLibrary`)
    REFERENCES `mydb`.`Library` (`idLibrary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idAlbum_UNIQUE` ON `mydb`.`Album` (`idAlbum` ASC) VISIBLE;

CREATE INDEX `fk_Album_Artist1_idx` ON `mydb`.`Album` (`Artist_idArtist` ASC) VISIBLE;

CREATE INDEX `fk_Album_Library1_idx` ON `mydb`.`Album` (`Library_idLibrary` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Song` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Song` (
  `idSong` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Duration` TIME NOT NULL,
  `PlayBack` INT NOT NULL,
  `Album_idAlbum` INT,
  `Library_idLibrary` INT,
  `PlayList_idPlayList` INT,
  PRIMARY KEY (`idSong`),
  CONSTRAINT `fk_Song_Album1`
    FOREIGN KEY (`Album_idAlbum`)
    REFERENCES `mydb`.`Album` (`idAlbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Song_Library1`
    FOREIGN KEY (`Library_idLibrary`)
    REFERENCES `mydb`.`Library` (`idLibrary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Song_PlayList1`
    FOREIGN KEY (`PlayList_idPlayList`)
    REFERENCES `mydb`.`PlayList` (`idPlayList`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Song_Album1_idx` ON `mydb`.`Song` (`Album_idAlbum` ASC) VISIBLE;

CREATE INDEX `fk_Song_Library1_idx` ON `mydb`.`Song` (`Library_idLibrary` ASC) VISIBLE;

CREATE INDEX `fk_Song_PlayList1_idx` ON `mydb`.`Song` (`PlayList_idPlayList` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
