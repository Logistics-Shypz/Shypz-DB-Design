-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Shypz_User
-- -----------------------------------------------------
-- Schema for User for Logistics Startup
DROP SCHEMA IF EXISTS `Shypz_User` ;

-- -----------------------------------------------------
-- Schema Shypz_User
--
-- Schema for User for Logistics Startup
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Shypz_User` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema Shypz_Vendor
-- -----------------------------------------------------
-- Schema for Vendor for Logistics Startup
DROP SCHEMA IF EXISTS `Shypz_Vendor` ;

-- -----------------------------------------------------
-- Schema Shypz_Vendor
--
-- Schema for Vendor for Logistics Startup
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Shypz_Vendor` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Shypz_User` ;

-- -----------------------------------------------------
-- Table `Shypz_User`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_User`.`User` ;

CREATE TABLE IF NOT EXISTS `Shypz_User`.`User` (
  `User_Id` INT NOT NULL AUTO_INCREMENT,
  `User_Name` VARCHAR(255) NOT NULL,
  `User_Email` VARCHAR(255) NOT NULL,
  `User_Password` VARCHAR(255) NOT NULL,
  `User_Mobile` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`User_Id`));

CREATE UNIQUE INDEX `User_Id_UNIQUE` ON `Shypz_User`.`User` (`User_Id` ASC);

CREATE UNIQUE INDEX `User_Name_UNIQUE` ON `Shypz_User`.`User` (`User_Name` ASC);

CREATE UNIQUE INDEX `User_Email_UNIQUE` ON `Shypz_User`.`User` (`User_Email` ASC);

CREATE UNIQUE INDEX `User_Mobile_UNIQUE` ON `Shypz_User`.`User` (`User_Mobile` ASC);


-- -----------------------------------------------------
-- Table `Shypz_User`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_User`.`Address` ;

CREATE TABLE IF NOT EXISTS `Shypz_User`.`Address` (
  `Address_Id` INT NOT NULL AUTO_INCREMENT,
  `Address_Line` VARCHAR(1000) NOT NULL,
  `Address_Area` VARCHAR(255) NOT NULL,
  `Address_City` VARCHAR(255) NOT NULL,
  `Address_Pincode` VARCHAR(45) NOT NULL,
  `Address_State` VARCHAR(100) NOT NULL,
  `Address_Country` VARCHAR(100) NOT NULL,
  `Address_User_Id` INT NOT NULL,
  PRIMARY KEY (`Address_Id`),
  CONSTRAINT `User_Id`
    FOREIGN KEY (`Address_User_Id`)
    REFERENCES `Shypz_User`.`User` (`User_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE UNIQUE INDEX `Address_Id_UNIQUE` ON `Shypz_User`.`Address` (`Address_Id` ASC);

CREATE INDEX `User_Id_idx` ON `Shypz_User`.`Address` (`Address_User_Id` ASC);


-- -----------------------------------------------------
-- Table `Shypz_User`.`User_Details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_User`.`User_Details` ;

CREATE TABLE IF NOT EXISTS `Shypz_User`.`User_Details` (
  `User_Detail_Id` INT NOT NULL AUTO_INCREMENT,
  `User_Query_IP_Address` INT UNSIGNED NOT NULL,
  `User_Query_Device` VARCHAR(45) NOT NULL,
  `User_Query_Device_Channel` VARCHAR(45) NOT NULL,
  `User_Generated_OTP` VARCHAR(45) NOT NULL,
  `User_First_Login_Date` DATETIME NOT NULL,
  `User_Last_Login_Date` DATETIME NOT NULL,
  `User_Location` VARCHAR(100) NOT NULL,
  `UD_User_ID` INT NOT NULL,
  PRIMARY KEY (`User_Detail_Id`),
  CONSTRAINT `User_Id`
    FOREIGN KEY (`UD_User_ID`)
    REFERENCES `Shypz_User`.`User` (`User_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE UNIQUE INDEX `User_Detail_Id_UNIQUE` ON `Shypz_User`.`User_Details` (`User_Detail_Id` ASC);

CREATE INDEX `User_Id_idx` ON `Shypz_User`.`User_Details` (`UD_User_ID` ASC);


-- -----------------------------------------------------
-- Table `Shypz_User`.`User_Property_Items_Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_User`.`User_Property_Items_Category` ;

CREATE TABLE IF NOT EXISTS `Shypz_User`.`User_Property_Items_Category` (
  `User_Item_Category_Id` INT NOT NULL,
  `User_Item_Category_Name` VARCHAR(255) NOT NULL,
  `User_Item_Category_Description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`User_Item_Category_Id`));

CREATE UNIQUE INDEX `User_Item_Category_Id_UNIQUE` ON `Shypz_User`.`User_Property_Items_Category` (`User_Item_Category_Id` ASC);

CREATE UNIQUE INDEX `User_Item_Category_Name_UNIQUE` ON `Shypz_User`.`User_Property_Items_Category` (`User_Item_Category_Name` ASC);


-- -----------------------------------------------------
-- Table `Shypz_User`.`User_Property_Items_SubCategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_User`.`User_Property_Items_SubCategory` ;

CREATE TABLE IF NOT EXISTS `Shypz_User`.`User_Property_Items_SubCategory` (
  `User_Item_SubCategory_Id` INT NOT NULL,
  `User_Item_SubCategory_Name` VARCHAR(255) NOT NULL,
  `User_Item_Cat_Id` INT NOT NULL,
  PRIMARY KEY (`User_Item_SubCategory_Id`),
  CONSTRAINT `User_Item_Cat_Id`
    FOREIGN KEY (`User_Item_Cat_Id`)
    REFERENCES `Shypz_User`.`User_Property_Items_Category` (`User_Item_Category_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE UNIQUE INDEX `User_Item_Category_Id_UNIQUE` ON `Shypz_User`.`User_Property_Items_SubCategory` (`User_Item_SubCategory_Id` ASC);

CREATE UNIQUE INDEX `User_Item_Category_Name_UNIQUE` ON `Shypz_User`.`User_Property_Items_SubCategory` (`User_Item_SubCategory_Name` ASC);

CREATE INDEX `User_Item_Cat_Id_idx` ON `Shypz_User`.`User_Property_Items_SubCategory` (`User_Item_Cat_Id` ASC);


-- -----------------------------------------------------
-- Table `Shypz_User`.`User_Booking_Quote_Query`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_User`.`User_Booking_Quote_Query` ;

CREATE TABLE IF NOT EXISTS `Shypz_User`.`User_Booking_Quote_Query` (
  `User_Booking_Quote_Id` INT NOT NULL AUTO_INCREMENT,
  `User_Type` VARCHAR(255) NOT NULL,
  `User_Source_Location` VARCHAR(255) NOT NULL,
  `User_Destination_Location` VARCHAR(255) NOT NULL,
  `User_ETM` DATETIME NOT NULL,
  `User_Is_Apartment` TINYINT(1) NOT NULL,
  `User_Is_Bunglow` TINYINT(1) NOT NULL,
  `Is_Packing_Required_Source` TINYINT(1) NOT NULL,
  `Is_Loading_Required_Source` TINYINT(1) NOT NULL,
  `Is_Elevator_Available_Source` TINYINT(1) NOT NULL,
  `Is_Unpacking_Required_Destination` TINYINT(1) NOT NULL,
  `Is_Unloading_Required_Destination` TINYINT(1) NOT NULL,
  `Is_Elevator_Required_Destination` TINYINT(1) NOT NULL,
  `UB_User_Id` INT NOT NULL,
  PRIMARY KEY (`User_Booking_Quote_Id`),
  CONSTRAINT `UB_User_Id`
    FOREIGN KEY (`UB_User_Id`)
    REFERENCES `Shypz_User`.`User` (`User_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE UNIQUE INDEX `User_Booking_Quote_Id_UNIQUE` ON `Shypz_User`.`User_Booking_Quote_Query` (`User_Booking_Quote_Id` ASC);

CREATE INDEX `UB_User_Id_idx` ON `Shypz_User`.`User_Booking_Quote_Query` (`UB_User_Id` ASC);

USE `Shypz_Vendor` ;

-- -----------------------------------------------------
-- Table `Shypz_Vendor`.`Vendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_Vendor`.`Vendor` ;

CREATE TABLE IF NOT EXISTS `Shypz_Vendor`.`Vendor` (
  `Vendor_Id` INT NOT NULL AUTO_INCREMENT,
  `Vendor_Name` VARCHAR(255) NOT NULL,
  `Vendor_Mobile` VARCHAR(10) NOT NULL,
  `Vendor_Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Vendor_Id`));

CREATE UNIQUE INDEX `Vendor_Id_UNIQUE` ON `Shypz_Vendor`.`Vendor` (`Vendor_Id` ASC);

CREATE UNIQUE INDEX `Vendor_Email_UNIQUE` ON `Shypz_Vendor`.`Vendor` (`Vendor_Email` ASC);

CREATE UNIQUE INDEX `Vendor_Mobile_UNIQUE` ON `Shypz_Vendor`.`Vendor` (`Vendor_Mobile` ASC);

CREATE UNIQUE INDEX `Vendor_Name_UNIQUE` ON `Shypz_Vendor`.`Vendor` (`Vendor_Name` ASC);


-- -----------------------------------------------------
-- Table `Shypz_Vendor`.`Vendor_Vehicles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_Vendor`.`Vendor_Vehicles` ;

CREATE TABLE IF NOT EXISTS `Shypz_Vendor`.`Vendor_Vehicles` (
  `Vendor_Vehicle_Id` INT NOT NULL AUTO_INCREMENT,
  `Vendor_Vehicle_Name` VARCHAR(255) NOT NULL,
  `Vendor_Vehicle_Type` VARCHAR(255) NOT NULL,
  `Vendor_Vehicle_Qty` INT NOT NULL,
  `Vendor_Vehicle_Capacity` VARCHAR(45) NULL,
  `Vendor_Vehicle_Vendor_Id` INT NOT NULL,
  PRIMARY KEY (`Vendor_Vehicle_Id`),
  CONSTRAINT `Vendor_Vehicle_Vendor_Id`
    FOREIGN KEY (`Vendor_Vehicle_Vendor_Id`)
    REFERENCES `Shypz_Vendor`.`Vendor` (`Vendor_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE UNIQUE INDEX `Vendor_Id_UNIQUE` ON `Shypz_Vendor`.`Vendor_Vehicles` (`Vendor_Vehicle_Id` ASC);

CREATE INDEX `Vendor_Vehicle_Vendor_Id_idx` ON `Shypz_Vendor`.`Vendor_Vehicles` (`Vendor_Vehicle_Vendor_Id` ASC);


-- -----------------------------------------------------
-- Table `Shypz_Vendor`.`Vendor_Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_Vendor`.`Vendor_Address` ;

CREATE TABLE IF NOT EXISTS `Shypz_Vendor`.`Vendor_Address` (
  `Vendor_Address_Id` INT NOT NULL AUTO_INCREMENT,
  `Vendor_Address_Line` VARCHAR(255) NOT NULL,
  `Vendor_Address_City` VARCHAR(255) NOT NULL,
  `Vendor_Address_State` VARCHAR(255) NOT NULL,
  `Vendor_Address_Vendor_Id` INT NOT NULL,
  PRIMARY KEY (`Vendor_Address_Id`),
  CONSTRAINT `Vendor_Address_User_Id`
    FOREIGN KEY (`Vendor_Address_Vendor_Id`)
    REFERENCES `Shypz_Vendor`.`Vendor` (`Vendor_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE UNIQUE INDEX `Vendor_Address_Id_UNIQUE` ON `Shypz_Vendor`.`Vendor_Address` (`Vendor_Address_Id` ASC);

CREATE INDEX `Vendor_Address_User_Id_idx` ON `Shypz_Vendor`.`Vendor_Address` (`Vendor_Address_Vendor_Id` ASC);


-- -----------------------------------------------------
-- Table `Shypz_Vendor`.`Vendor_Vehicles_Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Shypz_Vendor`.`Vendor_Vehicles_Location` ;

CREATE TABLE IF NOT EXISTS `Shypz_Vendor`.`Vendor_Vehicles_Location` (
  `Vendor_Vehicle_Location_Id` INT NOT NULL AUTO_INCREMENT,
  `Vendor_Vehicle_Source_Location` VARCHAR(255) NOT NULL,
  `Vendor_Vehicle_Destination_Location` VARCHAR(255) NOT NULL,
  `Vendor_Vehicle_Current_Location` VARCHAR(255) NOT NULL,
  `Vendor_Vehicle_Location_Vendor_Id` INT NOT NULL,
  PRIMARY KEY (`Vendor_Vehicle_Location_Id`),
  CONSTRAINT `Vendor_Vehicle_Location_Vendor_Id`
    FOREIGN KEY (`Vendor_Vehicle_Location_Vendor_Id`)
    REFERENCES `Shypz_Vendor`.`Vendor` (`Vendor_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE UNIQUE INDEX `Vendor_Id_UNIQUE` ON `Shypz_Vendor`.`Vendor_Vehicles_Location` (`Vendor_Vehicle_Location_Id` ASC);

CREATE INDEX `Vendor_Vehicle_Vendor_Id_idx` ON `Shypz_Vendor`.`Vendor_Vehicles_Location` (`Vendor_Vehicle_Location_Vendor_Id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
