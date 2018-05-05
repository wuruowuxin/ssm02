/*
SQLyog Community v12.3.3 (64 bit)
MySQL - 5.1.47-community : Database - realestatel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`realestatel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `realestatel`;

/*Table structure for table `real_estate` */

DROP TABLE IF EXISTS `real_estate`;

CREATE TABLE `real_estate` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '使用自动增长赋值',
  `cardid` varchar(18) NOT NULL COMMENT '对应用户表主键',
  `projectname` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `hoursetype` varchar(20) NOT NULL COMMENT '如：两室',
  `area` int(10) NOT NULL,
  `buildtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `real_estate` */

insert  into `real_estate`(`id`,`cardid`,`projectname`,`address`,`hoursetype`,`area`,`buildtime`) values 
(1,'c001','中南海1号','地中海','三室两厅',500,'2018-04-01'),
(2,'c001','中南海2号','地中海1','三室两厅',200,'2013-04-01'),
(3,'c002','中南海3号','地中海2','三室两厅321',300,'2011-04-01'),
(4,'c001','中南海4号','地中海3','三室两厅1',500,'2012-04-01'),
(5,'c002','中南海5号','地中海4','三室两厅123',1500,'2017-04-01'),
(6,'c002','中南海6号','地中海5','三室两厅123',3500,'2018-04-01');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `cardid` varchar(18) NOT NULL COMMENT '使用身份证号作为id',
  `name` varchar(50) NOT NULL,
  `gender` int(1) NOT NULL COMMENT '根据身份证号最后一位数判断，单数时该字段填 1（表示女），双数时该字段填 0(表示男)',
  `createtime` date NOT NULL COMMENT '取服务器端系统当前时间',
  `password` varchar(50) NOT NULL COMMENT '长度 6 位（含）以上',
  `status` int(1) NOT NULL COMMENT '1 为正常，0 为冻结，默认为 1',
  PRIMARY KEY (`cardid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`cardid`,`name`,`gender`,`createtime`,`password`,`status`) values 
('c001','admin',1,'2018-04-01','123123',1),
('c002','wangfei',0,'1985-04-22','123123',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
