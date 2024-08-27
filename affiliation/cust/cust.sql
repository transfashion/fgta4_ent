-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_cust`;


CREATE TABLE IF NOT EXISTS `mst_cust` (
	`cust_id` varchar(14) NOT NULL , 
	`cust_name` varchar(60) NOT NULL , 
	`cust_phone` varchar(60)  , 
	`cust_email` varchar(60)  , 
	`cust_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`cust_ishasbirthinfo` tinyint(1) NOT NULL DEFAULT 0, 
	`cust_birthdate` date  , 
	`cust_isrecvoffer` tinyint(1) NOT NULL DEFAULT 1, 
	`cust_reasonrejectoffer` varchar(255)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `cust_phone` (`cust_phone`),
	UNIQUE KEY `cust_email` (`cust_email`),
	PRIMARY KEY (`cust_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Customer';


ALTER TABLE `mst_cust` ADD COLUMN IF NOT EXISTS  `cust_name` varchar(60) NOT NULL  AFTER `cust_id`;
ALTER TABLE `mst_cust` ADD COLUMN IF NOT EXISTS  `cust_phone` varchar(60)   AFTER `cust_name`;
ALTER TABLE `mst_cust` ADD COLUMN IF NOT EXISTS  `cust_email` varchar(60)   AFTER `cust_phone`;
ALTER TABLE `mst_cust` ADD COLUMN IF NOT EXISTS  `cust_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `cust_email`;
ALTER TABLE `mst_cust` ADD COLUMN IF NOT EXISTS  `cust_ishasbirthinfo` tinyint(1) NOT NULL DEFAULT 0 AFTER `cust_isdisabled`;
ALTER TABLE `mst_cust` ADD COLUMN IF NOT EXISTS  `cust_birthdate` date   AFTER `cust_ishasbirthinfo`;
ALTER TABLE `mst_cust` ADD COLUMN IF NOT EXISTS  `cust_isrecvoffer` tinyint(1) NOT NULL DEFAULT 1 AFTER `cust_birthdate`;
ALTER TABLE `mst_cust` ADD COLUMN IF NOT EXISTS  `cust_reasonrejectoffer` varchar(255)   AFTER `cust_isrecvoffer`;


ALTER TABLE `mst_cust` MODIFY COLUMN IF EXISTS  `cust_name` varchar(60) NOT NULL   AFTER `cust_id`;
ALTER TABLE `mst_cust` MODIFY COLUMN IF EXISTS  `cust_phone` varchar(60)    AFTER `cust_name`;
ALTER TABLE `mst_cust` MODIFY COLUMN IF EXISTS  `cust_email` varchar(60)    AFTER `cust_phone`;
ALTER TABLE `mst_cust` MODIFY COLUMN IF EXISTS  `cust_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `cust_email`;
ALTER TABLE `mst_cust` MODIFY COLUMN IF EXISTS  `cust_ishasbirthinfo` tinyint(1) NOT NULL DEFAULT 0  AFTER `cust_isdisabled`;
ALTER TABLE `mst_cust` MODIFY COLUMN IF EXISTS  `cust_birthdate` date    AFTER `cust_ishasbirthinfo`;
ALTER TABLE `mst_cust` MODIFY COLUMN IF EXISTS  `cust_isrecvoffer` tinyint(1) NOT NULL DEFAULT 1  AFTER `cust_birthdate`;
ALTER TABLE `mst_cust` MODIFY COLUMN IF EXISTS  `cust_reasonrejectoffer` varchar(255)    AFTER `cust_isrecvoffer`;


ALTER TABLE `mst_cust` ADD CONSTRAINT `cust_phone` UNIQUE IF NOT EXISTS  (`cust_phone`);
ALTER TABLE `mst_cust` ADD CONSTRAINT `cust_email` UNIQUE IF NOT EXISTS  (`cust_email`);







