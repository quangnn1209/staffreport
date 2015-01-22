SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema staffreport
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `staffreport` DEFAULT CHARACTER SET utf8 ;
USE `staffreport` ;

-- -----------------------------------------------------
-- Table `staffreport`.`division`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staffreport`.`division` ;

CREATE TABLE IF NOT EXISTS `staffreport`.`division` (
  `division_id` INT NOT NULL AUTO_INCREMENT,
  `division_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`division_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `staffreport`.`team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staffreport`.`team` ;

CREATE TABLE IF NOT EXISTS `staffreport`.`team` (
  `team_id` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(30) NOT NULL,
  `create_date` DATE NOT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `division_id` INT NOT NULL,
  PRIMARY KEY (`team_id`),
  INDEX `fk_team_division1_idx` (`division_id` ASC),
  CONSTRAINT `fk_team_division1`
    FOREIGN KEY (`division_id`)
    REFERENCES `staffreport`.`division` (`division_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `staffreport`.`Employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staffreport`.`Employees` ;

CREATE TABLE IF NOT EXISTS `staffreport`.`Employees` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `emp_full_name` VARCHAR(30) NOT NULL,
  `join_date` DATE NOT NULL,
  `emp_skills` TEXT NULL,
  `emp_birthday` DATE NULL,
  `emp_phone` VARCHAR(20) NULL,
  `emp_contact` VARCHAR(50) NULL,
  `emp_avatar` VARCHAR(100) NULL,
  `emp_status` INT NULL,
  `division_id` INT NULL,
  `team_id` INT NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `fk_Employees_division1_idx` (`division_id` ASC),
  INDEX `fk_Employees_team1_idx` (`team_id` ASC),
  CONSTRAINT `fk_Employees_division1`
    FOREIGN KEY (`division_id`)
    REFERENCES `staffreport`.`division` (`division_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employees_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `staffreport`.`team` (`team_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffreport`.`EmployeeHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staffreport`.`EmployeeHistory` ;

CREATE TABLE IF NOT EXISTS `staffreport`.`EmployeeHistory` (
  `emp_history_id` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(30) NULL,
  `division_name` VARCHAR(30) NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `emp_id` INT NOT NULL,
  PRIMARY KEY (`emp_history_id`),
  INDEX `fk_EmployeeHistory_Employees1_idx` (`emp_id` ASC),
  CONSTRAINT `fk_EmployeeHistory_Employees1`
    FOREIGN KEY (`emp_id`)
    REFERENCES `staffreport`.`Employees` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffreport`.`Admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staffreport`.`Admin` ;

CREATE TABLE IF NOT EXISTS `staffreport`.`Admin` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `emp_id` INT NULL,
  PRIMARY KEY (`admin_id`),
  INDEX `fk_Admin_Employees1_idx` (`emp_id` ASC),
  CONSTRAINT `fk_Admin_Employees1`
    FOREIGN KEY (`emp_id`)
    REFERENCES `staffreport`.`Employees` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `staffreport`.`test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `staffreport`.`test` ;

CREATE TABLE IF NOT EXISTS `staffreport`.`test` (
  `test_id` INT NOT NULL AUTO_INCREMENT,
  `test_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`test_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
