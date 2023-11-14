-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema b3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema b3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `b3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `b3` ;

-- -----------------------------------------------------
-- Table `b3`.`governanca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`governanca` (
  `gov_id` VARCHAR(3) NOT NULL,
  `gov_nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`gov_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`setor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`setor` (
  `setor_id` INT(11) NOT NULL,
  `setor_nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`setor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`subsetor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`subsetor` (
  `sub_id` INT(11) NOT NULL,
  `sub_nome` VARCHAR(100) NOT NULL,
  `setor_id` INT(11) NOT NULL,
  PRIMARY KEY (`sub_id`),
  INDEX `fk_subsetor_setor` (`setor_id` ASC) VISIBLE,
  CONSTRAINT `fk_subsetor_setor`
    FOREIGN KEY (`setor_id`)
    REFERENCES `b3`.`setor` (`setor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`segmento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`segmento` (
  `seg_id` VARCHAR(3) NOT NULL,
  `seg_nome` VARCHAR(100) NOT NULL,
  `sub_id` INT(11) NOT NULL,
  PRIMARY KEY (`seg_id`),
  INDEX `fk_segmento_subsetor` (`sub_id` ASC) VISIBLE,
  CONSTRAINT `fk_segmento_subsetor`
    FOREIGN KEY (`sub_id`)
    REFERENCES `b3`.`subsetor` (`sub_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`empresa` (
  `emp_id` VARCHAR(5) NOT NULL,
  `emp_nome` VARCHAR(100) NOT NULL,
  `gov_id` VARCHAR(3) NULL DEFAULT NULL,
  `seg_id` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `fk_empresa_governanca` (`gov_id` ASC) VISIBLE,
  INDEX `fk_empresa_segmento` (`seg_id` ASC) VISIBLE,
  CONSTRAINT `fk_empresa_governanca`
    FOREIGN KEY (`gov_id`)
    REFERENCES `b3`.`governanca` (`gov_id`),
  CONSTRAINT `fk_empresa_segmento`
    FOREIGN KEY (`seg_id`)
    REFERENCES `b3`.`segmento` (`seg_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`acao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`acao` (
  `acao_id` VARCHAR(6) NOT NULL,
  `emp_id` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`acao_id`),
  INDEX `fk_acao_empresa` (`emp_id` ASC) VISIBLE,
  CONSTRAINT `fk_acao_empresa`
    FOREIGN KEY (`emp_id`)
    REFERENCES `b3`.`empresa` (`emp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`mercado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`mercado` (
  `mer_id` INT(11) NOT NULL,
  `mer_nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`mer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`cotacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`cotacao` (
  `cot_data` DATE NOT NULL,
  `cot_id` INT(11) NOT NULL,
  `cot_pabertura` DECIMAL(10,2) NOT NULL,
  `cot_pmax` DECIMAL(10,2) NOT NULL,
  `cot_pfechamento` DECIMAL(10,2) NOT NULL,
  `cot_qtdnegocios` INT(11) NOT NULL,
  `cot_qtdacoes` INT(11) NOT NULL,
  `cot_volumefin` DECIMAL(14,2) NOT NULL,
  `acao_id` VARCHAR(6) NOT NULL,
  `mer_id` INT(11) NOT NULL,
  PRIMARY KEY (`cot_id`),
  INDEX `fk_cotacao_acao` (`acao_id` ASC) VISIBLE,
  INDEX `fk_cotacao_mercado` (`mer_id` ASC) VISIBLE,
  CONSTRAINT `fk_cotacao_acao`
    FOREIGN KEY (`acao_id`)
    REFERENCES `b3`.`acao` (`acao_id`),
  CONSTRAINT `fk_cotacao_mercado`
    FOREIGN KEY (`mer_id`)
    REFERENCES `b3`.`mercado` (`mer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`tipo_indice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`tipo_indice` (
  `tipo_id` INT(11) NOT NULL,
  `tipo_nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`indice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`indice` (
  `ind_id` VARCHAR(6) NOT NULL,
  `ind_nome` VARCHAR(100) NOT NULL,
  `tipo_id` INT(11) NOT NULL,
  PRIMARY KEY (`ind_id`),
  INDEX `fk_indice_tipo_indice` (`tipo_id` ASC) VISIBLE,
  CONSTRAINT `fk_indice_tipo_indice`
    FOREIGN KEY (`tipo_id`)
    REFERENCES `b3`.`tipo_indice` (`tipo_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `b3`.`listagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `b3`.`listagem` (
  `ind_id` VARCHAR(6) NOT NULL,
  `acao_id` VARCHAR(6) NOT NULL,
  `list_quadrimestre` INT(11) NOT NULL,
  `list_ano` YEAR(4) NOT NULL,
  `list_qtdacoes` INT(11) NOT NULL,
  `list_percentual` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`ind_id`, `acao_id`, `list_quadrimestre`, `list_ano`),
  INDEX `fk_listagem_empresa` (`acao_id` ASC) VISIBLE,
  CONSTRAINT `fk_listagem_empresa`
    FOREIGN KEY (`acao_id`)
    REFERENCES `b3`.`acao` (`acao_id`),
  CONSTRAINT `fk_listagem_indice`
    FOREIGN KEY (`ind_id`)
    REFERENCES `b3`.`indice` (`ind_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;