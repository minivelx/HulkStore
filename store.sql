/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.11-MariaDB : Database - store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`store` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `store`;

/*Table structure for table `categoriaproducto` */

DROP TABLE IF EXISTS `categoriaproducto`;

CREATE TABLE `categoriaproducto` (
  `Codigo` varchar(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `categoriaproducto` */

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `CodProducto` varchar(10) NOT NULL,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`CodProducto`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`CodProducto`) REFERENCES `producto` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `inventario` */

/*Table structure for table `kardex` */

DROP TABLE IF EXISTS `kardex`;

CREATE TABLE `kardex` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CodProducto` varchar(10) NOT NULL,
  `Ingreso` int(11) NOT NULL,
  `Salida` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `CodProducto` (`CodProducto`),
  CONSTRAINT `kardex_ibfk_1` FOREIGN KEY (`CodProducto`) REFERENCES `producto` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `kardex` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `Codigo` varchar(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `CodCategoria` varchar(10) DEFAULT NULL,
  `PrecioVenta` decimal(10,0) NOT NULL,
  `Activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `CodCategoria` (`CodCategoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`CodCategoria`) REFERENCES `categoriaproducto` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `producto` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
