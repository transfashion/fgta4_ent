-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_unitgroup`;


CREATE TABLE IF NOT EXISTS `mst_unitgroup` (
	`unitgroup_id` varchar(10) NOT NULL , 
	`unitgroup_name` varchar(60) NOT NULL , 
	`unitgroup_descr` varchar(90) NOT NULL , 
	`unitgroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `unitgroup_name` (`unitgroup_name`),
	PRIMARY KEY (`unitgroup_id`)
) 
ENGINE=InnoDB
COMMENT='Master Group Unit';


ALTER TABLE `mst_unitgroup` ADD COLUMN IF NOT EXISTS  `unitgroup_name` varchar(60) NOT NULL  AFTER `unitgroup_id`;
ALTER TABLE `mst_unitgroup` ADD COLUMN IF NOT EXISTS  `unitgroup_descr` varchar(90) NOT NULL  AFTER `unitgroup_name`;
ALTER TABLE `mst_unitgroup` ADD COLUMN IF NOT EXISTS  `unitgroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `unitgroup_descr`;


ALTER TABLE `mst_unitgroup` MODIFY COLUMN IF EXISTS  `unitgroup_name` varchar(60) NOT NULL   AFTER `unitgroup_id`;
ALTER TABLE `mst_unitgroup` MODIFY COLUMN IF EXISTS  `unitgroup_descr` varchar(90) NOT NULL   AFTER `unitgroup_name`;
ALTER TABLE `mst_unitgroup` MODIFY COLUMN IF EXISTS  `unitgroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `unitgroup_descr`;


ALTER TABLE `mst_unitgroup` ADD CONSTRAINT `unitgroup_name` UNIQUE IF NOT EXISTS  (`unitgroup_name`);







