-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_itemmodel`;
-- drop table if exists `mst_itemmodelprop`;


CREATE TABLE IF NOT EXISTS `mst_itemmodel` (
	`itemmodel_id` varchar(10) NOT NULL , 
	`itemmodel_name` varchar(90) NOT NULL , 
	`itemmodel_descr` varchar(255)  , 
	`itemmodel_isintangible` tinyint(1) NOT NULL DEFAULT 0, 
	`itemmodel_issellable` tinyint(1) NOT NULL DEFAULT 0, 
	`itemmodel_isnonitem` tinyint(1) NOT NULL DEFAULT 0, 
	`itemmodel_ishasmainteinerdept` tinyint(1) NOT NULL DEFAULT 0, 
	`itemmodel_ismultidept` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_id` varchar(30)  , 
	`itemmanage_id` varchar(2) NOT NULL , 
	`itemmanage_isasset` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemmodel_name` (`itemmodel_name`),
	PRIMARY KEY (`itemmodel_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Model Item';


ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmodel_name` varchar(90) NOT NULL  AFTER `itemmodel_id`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmodel_descr` varchar(255)   AFTER `itemmodel_name`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmodel_isintangible` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemmodel_descr`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmodel_issellable` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemmodel_isintangible`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmodel_isnonitem` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemmodel_issellable`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmodel_ishasmainteinerdept` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemmodel_isnonitem`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmodel_ismultidept` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemmodel_ishasmainteinerdept`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30)   AFTER `itemmodel_ismultidept`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmanage_id` varchar(2) NOT NULL  AFTER `dept_id`;
ALTER TABLE `mst_itemmodel` ADD COLUMN IF NOT EXISTS  `itemmanage_isasset` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemmanage_id`;


ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmodel_name` varchar(90) NOT NULL   AFTER `itemmodel_id`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmodel_descr` varchar(255)    AFTER `itemmodel_name`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmodel_isintangible` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemmodel_descr`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmodel_issellable` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemmodel_isintangible`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmodel_isnonitem` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemmodel_issellable`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmodel_ishasmainteinerdept` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemmodel_isnonitem`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmodel_ismultidept` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemmodel_ishasmainteinerdept`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30)    AFTER `itemmodel_ismultidept`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmanage_id` varchar(2) NOT NULL   AFTER `dept_id`;
ALTER TABLE `mst_itemmodel` MODIFY COLUMN IF EXISTS  `itemmanage_isasset` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemmanage_id`;


ALTER TABLE `mst_itemmodel` ADD CONSTRAINT `itemmodel_name` UNIQUE IF NOT EXISTS  (`itemmodel_name`);

ALTER TABLE `mst_itemmodel` ADD KEY IF NOT EXISTS `dept_id` (`dept_id`);
ALTER TABLE `mst_itemmodel` ADD KEY IF NOT EXISTS `itemmanage_id` (`itemmanage_id`);

ALTER TABLE `mst_itemmodel` ADD CONSTRAINT `fk_mst_itemmodel_mst_dept` FOREIGN KEY IF NOT EXISTS  (`dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_itemmodel` ADD CONSTRAINT `fk_mst_itemmodel_mst_itemmanage` FOREIGN KEY IF NOT EXISTS  (`itemmanage_id`) REFERENCES `mst_itemmanage` (`itemmanage_id`);





CREATE TABLE IF NOT EXISTS `mst_itemmodelprop` (
	`itemmodelprop_id` varchar(14) NOT NULL , 
	`prop_id` varchar(26) NOT NULL , 
	`itemmodelprop_order` int(4) NOT NULL DEFAULT 0, 
	`itemmodel_id` varchar(10) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemmodelprop_id`)
) 
ENGINE=InnoDB
COMMENT='Template Properti / Spesifikasi item';


ALTER TABLE `mst_itemmodelprop` ADD COLUMN IF NOT EXISTS  `prop_id` varchar(26) NOT NULL  AFTER `itemmodelprop_id`;
ALTER TABLE `mst_itemmodelprop` ADD COLUMN IF NOT EXISTS  `itemmodelprop_order` int(4) NOT NULL DEFAULT 0 AFTER `prop_id`;
ALTER TABLE `mst_itemmodelprop` ADD COLUMN IF NOT EXISTS  `itemmodel_id` varchar(10) NOT NULL  AFTER `itemmodelprop_order`;


ALTER TABLE `mst_itemmodelprop` MODIFY COLUMN IF EXISTS  `prop_id` varchar(26) NOT NULL   AFTER `itemmodelprop_id`;
ALTER TABLE `mst_itemmodelprop` MODIFY COLUMN IF EXISTS  `itemmodelprop_order` int(4) NOT NULL DEFAULT 0  AFTER `prop_id`;
ALTER TABLE `mst_itemmodelprop` MODIFY COLUMN IF EXISTS  `itemmodel_id` varchar(10) NOT NULL   AFTER `itemmodelprop_order`;



ALTER TABLE `mst_itemmodelprop` ADD KEY IF NOT EXISTS `prop_id` (`prop_id`);
ALTER TABLE `mst_itemmodelprop` ADD KEY IF NOT EXISTS `itemmodel_id` (`itemmodel_id`);

ALTER TABLE `mst_itemmodelprop` ADD CONSTRAINT `fk_mst_itemmodelprop_mst_prop` FOREIGN KEY IF NOT EXISTS  (`prop_id`) REFERENCES `mst_prop` (`prop_id`);
ALTER TABLE `mst_itemmodelprop` ADD CONSTRAINT `fk_mst_itemmodelprop_mst_itemmodel` FOREIGN KEY IF NOT EXISTS (`itemmodel_id`) REFERENCES `mst_itemmodel` (`itemmodel_id`);





