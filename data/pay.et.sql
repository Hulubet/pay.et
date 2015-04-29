/*
SQLyog Ultimate v11.33 (64 bit)
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
  `description` text,
  `ussd` varchar(50) DEFAULT NULL,
  `internet` varchar(50) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

insert  into `bank`(`id`,`name`,`code`,`description`,`ussd`,`internet`,`insert_time`,`last_update`) values (1,'Awash International Bank',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Commercial Bank of Ethiopia',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Development Bank of Ethiopia',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Construction and Business Bank',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Dashen Bank',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Wegagen Bank',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Bank of Abyssinia',NULL,NULL,NULL,NULL,NULL,NULL),(8,'United Bank',NULL,NULL,NULL,NULL,NULL,NULL),(9,'Nib International Bank',NULL,NULL,NULL,NULL,NULL,NULL),(10,'Cooperative Bank of Oromia',NULL,NULL,NULL,NULL,NULL,NULL),(11,'Lion International Bank',NULL,NULL,NULL,NULL,NULL,NULL),(12,'Zemen Bank',NULL,NULL,NULL,NULL,NULL,NULL),(13,'Oromia International Bank',NULL,NULL,NULL,NULL,NULL,NULL),(14,'Bunna International Bank',NULL,NULL,NULL,NULL,NULL,NULL),(15,'Berhan International Bank',NULL,NULL,NULL,NULL,NULL,NULL),(16,'Abay Bank',NULL,NULL,NULL,NULL,NULL,NULL),(17,'Addis International Bank',NULL,NULL,NULL,NULL,NULL,NULL),(18,'Debub Global Bank',NULL,NULL,NULL,NULL,NULL,NULL),(19,'Enat Bank',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `bank_account` */

DROP TABLE IF EXISTS `bank_account`;

CREATE TABLE `bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bank_branch_id` int(11) DEFAULT NULL,
  `account_number` int(11) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_branch_id` (`bank_branch_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `bank_account_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `bank_account_ibfk_1` FOREIGN KEY (`bank_branch_id`) REFERENCES `bank_branch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank_account` */

/*Table structure for table `bank_branch` */

DROP TABLE IF EXISTS `bank_branch`;

CREATE TABLE `bank_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_id` (`bank_id`),
  CONSTRAINT `bank_branch_ibfk_1` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank_branch` */

/*Table structure for table `bank_transaction` */

DROP TABLE IF EXISTS `bank_transaction`;

CREATE TABLE `bank_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_bank_account_id` int(11) NOT NULL,
  `to_bank_account_id` int(11) NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `balance` datetime DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_account_id` (`from_bank_account_id`),
  KEY `to_bank_account_id` (`to_bank_account_id`),
  CONSTRAINT `bank_transaction_ibfk_2` FOREIGN KEY (`to_bank_account_id`) REFERENCES `bank_account` (`id`),
  CONSTRAINT `bank_transaction_ibfk_1` FOREIGN KEY (`from_bank_account_id`) REFERENCES `bank_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank_transaction` */

/*Table structure for table `proxy_account` */

DROP TABLE IF EXISTS `proxy_account`;

CREATE TABLE `proxy_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bank_account_id` int(11) NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `bank_account_id` (`bank_account_id`),
  CONSTRAINT `proxy_account_ibfk_2` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_account` (`id`),
  CONSTRAINT `proxy_account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proxy_account` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET latin1 DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0-waiting,1 active, 2 blocked',
  `insert_time` datetime NOT NULL,
  `last_update` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FK_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`email`,`password`,`first_name`,`last_name`,`gender`,`status`,`insert_time`,`last_update`) values (1,'misikir@hulubet.com','$2y$11$Q7wMjWcwErhcS9ZVfrliEeEasjAOSjJdeUj6ngU4QMejVi5yxFWie','Misikir a','Adane','male',1,'2014-08-05 10:49:42','2015-02-01 09:29:32'),(2,'naty@gmail.com','$2y$11$Q7wMjWcwErhcS9ZVfrliEeEasjAOSjJdeUj6ngU4QMejVi5yxFWie','Natnael','Getahun','male',0,'2015-01-20 16:19:09','2015-01-21 03:19:39'),(3,'misiikir@hulubet.com','$2y$11$ORkeFzw3lPdoL1qVGM66UeYHiray3HPjy7XxhQgnshpMdRcgeZeQ6','MyName','adane','Male',0,'2015-01-21 02:17:45','2015-01-21 13:17:45');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
