-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_sitemodel`;


CREATE TABLE IF NOT EXISTS `mst_sitemodel` (
	`sitemodel_id` varchar(10) NOT NULL , 
	`sitemodel_name` varchar(60) NOT NULL , 
	`sitemodel_descr` varchar(90)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `sitemodel_name` (`sitemodel_name`),
	PRIMARY KEY (`sitemodel_id`)
) 
ENGINE=InnoDB
COMMENT='Master Site Model';


ALTER TABLE `mst_sitemodel` ADD COLUMN IF NOT EXISTS  `sitemodel_name` varchar(60) NOT NULL  AFTER `sitemodel_id`;
ALTER TABLE `mst_sitemodel` ADD COLUMN IF NOT EXISTS  `sitemodel_descr` varchar(90)   AFTER `sitemodel_name`;


ALTER TABLE `mst_sitemodel` MODIFY COLUMN IF EXISTS  `sitemodel_name` varchar(60) NOT NULL   AFTER `sitemodel_id`;
ALTER TABLE `mst_sitemodel` MODIFY COLUMN IF EXISTS  `sitemodel_descr` varchar(90)    AFTER `sitemodel_name`;


ALTER TABLE `mst_sitemodel` ADD CONSTRAINT `sitemodel_name` UNIQUE IF NOT EXISTS  (`sitemodel_name`);







