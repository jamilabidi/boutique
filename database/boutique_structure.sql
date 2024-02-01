-- Adminer 4.8.1 MySQL 10.6.16-MariaDB-0ubuntu0.22.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `idcategories` int(11) NOT NULL,
  `nameCategory` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategories`),
  UNIQUE KEY `idcategories_UNIQUE` (`idcategories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `command`;
CREATE TABLE `command` (
  `idcommand` int(11) NOT NULL,
  `date_of_command` date NOT NULL,
  `date_of_delivery` date NOT NULL,
  `customers_idcustomers` int(11) NOT NULL,
  PRIMARY KEY (`idcommand`),
  UNIQUE KEY `idcommand_UNIQUE` (`idcommand`),
  KEY `fk_command_customers1_idx` (`customers_idcustomers`),
  CONSTRAINT `fk_command_customers1` FOREIGN KEY (`customers_idcustomers`) REFERENCES `customers` (`idcustomers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `idcustomers` int(11) NOT NULL,
  `nameCustomers` varchar(45) NOT NULL,
  `surnameCustomers` varchar(45) DEFAULT NULL,
  `email` mediumtext NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idcustomers`),
  UNIQUE KEY `idcustomers_UNIQUE` (`idcustomers`),
  UNIQUE KEY `email_UNIQUE` (`email`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `idproducts` int(11) NOT NULL,
  `productsName` varchar(45) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `price HT` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `TVA` float DEFAULT NULL,
  `stock` varchar(45) DEFAULT NULL,
  `categories_idcategories` int(11) NOT NULL,
  `categories_idcategories1` int(11) NOT NULL,
  `price TTC` float DEFAULT NULL,
  `VAT taux` float DEFAULT NULL,
  PRIMARY KEY (`idproducts`,`categories_idcategories`),
  KEY `fk_products_categories1_idx` (`categories_idcategories1`),
  CONSTRAINT `fk_products_categories1` FOREIGN KEY (`categories_idcategories1`) REFERENCES `categories` (`idcategories`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


DROP TABLE IF EXISTS `products_has_command`;
CREATE TABLE `products_has_command` (
  `products_idproducts` int(11) NOT NULL,
  `products_categories_idcategories` int(11) NOT NULL,
  `command_idcommand` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`products_idproducts`,`products_categories_idcategories`,`command_idcommand`),
  KEY `fk_products_has_command_command1_idx` (`command_idcommand`),
  KEY `fk_products_has_command_products1_idx` (`products_idproducts`,`products_categories_idcategories`),
  CONSTRAINT `fk_products_has_command_command1` FOREIGN KEY (`command_idcommand`) REFERENCES `command` (`idcommand`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_command_products1` FOREIGN KEY (`products_idproducts`, `products_categories_idcategories`) REFERENCES `products` (`idproducts`, `categories_idcategories`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


-- 2024-02-01 11:21:14
