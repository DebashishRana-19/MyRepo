/*
SQLyog Community v11.52 (32 bit)
MySQL - 5.5.30 : Database - e-shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
create database eshop;
USE `eshop`;

/*Table structure for table `addvalet` */

DROP TABLE IF EXISTS `addvalet`;

CREATE TABLE `addvalet` (
  `userid` varchar(100) DEFAULT NULL,
  `amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addvalet` */

/*Table structure for table `callback` */

DROP TABLE IF EXISTS `callback`;

CREATE TABLE `callback` (
  `pid` varchar(200) DEFAULT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `cat` varchar(200) DEFAULT NULL,
  `subcat` varchar(200) DEFAULT NULL,
  `des` varchar(200) DEFAULT NULL,
  `eid` varchar(200) DEFAULT NULL,
  `mbl` varchar(200) DEFAULT NULL,
  `sts` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `callback` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `ctid` varchar(1000) DEFAULT NULL,
  `ctname` varchar(1000) DEFAULT NULL,
  `subcat` varchar(1000) DEFAULT NULL,
  `crdate` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category` */

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `cate` varchar(200) DEFAULT NULL,
  `scate` varchar(200) DEFAULT NULL,
  `ename` varchar(200) DEFAULT NULL,
  `pwd` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `mbl` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employees` */

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `uname` varchar(200) DEFAULT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `feedback` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

/*Table structure for table `orderdetails` */

DROP TABLE IF EXISTS `orderdetails`;

CREATE TABLE `orderdetails` (
  `pname` varchar(1000) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orderdetails` */

insert  into `orderdetails`(`pname`,`total`,`image`,`email`,`status`) values ('Vegetables',778,'partner-4.png','rafiq@gmail.com','wait');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(100) NOT NULL,
  `productID` varchar(1000) DEFAULT NULL,
  `ctname` varchar(1000) DEFAULT NULL,
  `sub` varchar(1000) DEFAULT NULL,
  `ProductName` varchar(1000) DEFAULT NULL,
  `Desc_` varchar(1000) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `quantity` varbinary(1000) DEFAULT NULL,
  `price` varchar(1000) DEFAULT NULL,
  `cdate` varchar(1000) DEFAULT NULL,
  `udate` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `pnumber` int(11) DEFAULT NULL,
  `bimage` varchar(200) DEFAULT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `orgimage` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `price` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`pnumber`,`bimage`,`pname`,`description`,`orgimage`,`image`,`price`,`status`,`rating`) values (8309,'barcode-code128-signs-symbol-business-barcodes-barcode-code128-png-jYbTic-clipart.png','Vegetables','make your life happy','book3.png','partner-4.png','778','approved','5'),(112333,'product-12.jpg','Fruits','uhui','image_5.jpg','image_5.jpg','567','pending','5');

/*Table structure for table `raiting` */

DROP TABLE IF EXISTS `raiting`;

CREATE TABLE `raiting` (
  `pid` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `raiting` varchar(500) DEFAULT NULL,
  `tt` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `raiting` */

insert  into `raiting`(`pid`,`email`,`raiting`,`tt`) values ('8309','rafiq@gmail.com','3','good');

/*Table structure for table `seller` */

DROP TABLE IF EXISTS `seller`;

CREATE TABLE `seller` (
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `sname` varchar(200) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `orga` varchar(200) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `bnum` varchar(200) DEFAULT NULL,
  `logo` blob,
  `status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `seller` */

insert  into `seller`(`fname`,`lname`,`sname`,`pass`,`email`,`phone`,`orga`,`addr`,`bnum`,`logo`,`status`) values ('rafiq','mohd','rafiq','rafiq','rafiqmohammad186@gmail.com','08309050646','rafiq','siri, towers','708707087','f-col-st.png','approved'),('rafiq','rafiq','rafiq','rafoq','rafiq@gmail.com','6786767668','jgj','hgh','hjhg','image_1.jpg','pending');

/*Table structure for table `ureg` */

DROP TABLE IF EXISTS `ureg`;

CREATE TABLE `ureg` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `uid` varchar(1000) DEFAULT NULL,
  `uname` varchar(1000) DEFAULT NULL,
  `fname` varchar(1000) DEFAULT NULL,
  `lname` varchar(1000) DEFAULT NULL,
  `pass` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `phone` varchar(1000) DEFAULT NULL,
  `photo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `ureg` */

insert  into `ureg`(`id`,`uid`,`uname`,`fname`,`lname`,`pass`,`email`,`phone`,`photo`) values (1,'rafiq','rafiq',NULL,NULL,'rafiq',NULL,NULL,NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `zip` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`fname`,`lname`,`uname`,`pass`,`email`,`phone`,`country`,`zip`) values ('rafiq','1122','1122','1122','rafiq@gmail.com','7678789788','un','unu'),('rafiq','mohd','rafiq','rafiq','rafiqmohammad186@gmail.com','08309050646','India','500016');

/*Table structure for table `useraddress` */

DROP TABLE IF EXISTS `useraddress`;

CREATE TABLE `useraddress` (
  `fname` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `mno` varchar(1000) DEFAULT NULL,
  `fullname` varchar(1000) DEFAULT NULL,
  `saddr` varchar(100) DEFAULT NULL,
  `city1` varchar(100) DEFAULT NULL,
  `state1` varchar(100) DEFAULT NULL,
  `zip1` varchar(100) DEFAULT NULL,
  `ctry` varchar(110) DEFAULT NULL,
  `mno1` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `useraddress` */

/*Table structure for table `userhistory` */

DROP TABLE IF EXISTS `userhistory`;

CREATE TABLE `userhistory` (
  `uname` varchar(100) DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userhistory` */

/*Table structure for table `wishlist` */

DROP TABLE IF EXISTS `wishlist`;

CREATE TABLE `wishlist` (
  `pid` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wishlist` */

insert  into `wishlist`(`pid`,`email`) values ('8309','rafiqmohammad186@gmail.com'),('8309','rafiq@gmail.com'),('8309','rafiq@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
