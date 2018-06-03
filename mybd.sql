-- MySQL Script generated by MySQL Workbench
-- 06/02/18 18:40:50
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telefono` INT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedidos` (
  `Numero` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NULL,
  `idProductos` INT NOT NULL,
  `Cantidad` INT NULL,
  `Clientes_idClientes` INT NOT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Pedidos_Clientes1_idx` (`Clientes_idClientes` ASC),
  CONSTRAINT `fk_Pedidos_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `mydb`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `Nombre` VARCHAR(45) NULL,
  `Precio` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `idProductos_Numero` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idProductos_Numero`),
  INDEX `fk_Productos_Pedidos_idx` (`idProductos_Numero` ASC),
  CONSTRAINT `fk_Productos_Pedidos`
    FOREIGN KEY (`idProductos_Numero`)
    REFERENCES `mydb`.`Pedidos` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
