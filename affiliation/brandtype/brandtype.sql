-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_brandtype`;


CREATE TABLE IF NOT EXISTS `mst_brandtype` (
	`brandtype_id` varchar(10) NOT NULL , 
	`brandtype_name` varchar(60) NOT NULL , 
	`brandtype_descr` varchar(90) NOT NULL , 
	`_createby` varchar(13) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(13)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `brandtype_name` (`brandtype_name`),
	PRIMARY KEY (`brandtype_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Tipe Brand';


ALTER TABLE `mst_brandtype` ADD COLUMN IF NOT EXISTS  `brandtype_name` varchar(60) NOT NULL  AFTER `brandtype_id`;
ALTER TABLE `mst_brandtype` ADD COLUMN IF NOT EXISTS  `brandtype_descr` varchar(90) NOT NULL  AFTER `brandtype_name`;


ALTER TABLE `mst_brandtype` MODIFY COLUMN IF EXISTS  `brandtype_name` varchar(60) NOT NULL  AFTER `brandtype_id`;
ALTER TABLE `mst_brandtype` MODIFY COLUMN IF EXISTS  `brandtype_descr` varchar(90) NOT NULL  AFTER `brandtype_name`;


ALTER TABLE `mst_brandtype` ADD CONSTRAINT `brandtype_name` UNIQUE IF NOT EXISTS  (`brandtype_name`);







