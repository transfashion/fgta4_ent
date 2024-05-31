-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_sitegroup`;


CREATE TABLE IF NOT EXISTS `mst_sitegroup` (
	`sitegroup_id` varchar(10) NOT NULL , 
	`sitegroup_name` varchar(60) NOT NULL , 
	`sitegroup_descr` varchar(90)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `sitegroup_name` (`sitegroup_name`),
	PRIMARY KEY (`sitegroup_id`)
) 
ENGINE=InnoDB
COMMENT='Master Site Group';


ALTER TABLE `mst_sitegroup` ADD COLUMN IF NOT EXISTS  `sitegroup_name` varchar(60) NOT NULL  AFTER `sitegroup_id`;
ALTER TABLE `mst_sitegroup` ADD COLUMN IF NOT EXISTS  `sitegroup_descr` varchar(90)   AFTER `sitegroup_name`;


ALTER TABLE `mst_sitegroup` MODIFY COLUMN IF EXISTS  `sitegroup_name` varchar(60) NOT NULL  AFTER `sitegroup_id`;
ALTER TABLE `mst_sitegroup` MODIFY COLUMN IF EXISTS  `sitegroup_descr` varchar(90)   AFTER `sitegroup_name`;


ALTER TABLE `mst_sitegroup` ADD CONSTRAINT `sitegroup_name` UNIQUE IF NOT EXISTS  (`sitegroup_name`);







