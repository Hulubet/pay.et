/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.17 : Database - pay.et
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pay.et` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pay.et`;

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `swift` varchar(50) DEFAULT NULL,
  `description` text,
  `ussd` varchar(50) DEFAULT NULL,
  `internet` varchar(50) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

LOCK TABLES `bank` WRITE;

UNLOCK TABLES;

/*Table structure for table `bank_account` */

DROP TABLE IF EXISTS `bank_account`;

CREATE TABLE `bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_branch_id` int(11) DEFAULT NULL,
  `account_number` int(11) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_branch_id` (`bank_branch_id`),
  CONSTRAINT `bank_account_ibfk_1` FOREIGN KEY (`bank_branch_id`) REFERENCES `bank_branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank_account` */

LOCK TABLES `bank_account` WRITE;

UNLOCK TABLES;

/*Table structure for table `bank_branch` */

DROP TABLE IF EXISTS `bank_branch`;

CREATE TABLE `bank_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `swift` varchar(50) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_id` (`bank_id`),
  CONSTRAINT `bank_branch_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank_branch` */

LOCK TABLES `bank_branch` WRITE;

UNLOCK TABLES;

/*Table structure for table `bank_transaction` */

DROP TABLE IF EXISTS `bank_transaction`;

CREATE TABLE `bank_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_account_id` int(11) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `balance` datetime DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_account_id` (`bank_account_id`),
  CONSTRAINT `bank_transaction_ibfk_1` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank_transaction` */

LOCK TABLES `bank_transaction` WRITE;

UNLOCK TABLES;

/*Table structure for table `provider_bank` */

DROP TABLE IF EXISTS `provider_bank`;

CREATE TABLE `provider_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_account_id` (`bank_account_id`),
  CONSTRAINT `provider_bank_ibfk_1` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `provider_bank` */

LOCK TABLES `provider_bank` WRITE;

UNLOCK TABLES;

/*Table structure for table `user_bank` */

DROP TABLE IF EXISTS `user_bank`;

CREATE TABLE `user_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_account` (`bank_account_id`,`user_id`),
  CONSTRAINT `user_bank_ibfk_1` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_bank` */

LOCK TABLES `user_bank` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
