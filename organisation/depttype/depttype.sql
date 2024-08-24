-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_depttype`;


CREATE TABLE IF NOT EXISTS `mst_depttype` (
	`depttype_id` varchar(10) NOT NULL , 
	`depttype_name` varchar(60) NOT NULL , 
	`depttype_descr` varchar(90)  , 
	`depttype_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `depttype_name` (`depttype_name`),
	PRIMARY KEY (`depttype_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Tipe Departement, costcenter or revenue center';


ALTER TABLE `mst_depttype` ADD COLUMN IF NOT EXISTS  `depttype_name` varchar(60) NOT NULL  AFTER `depttype_id`;
ALTER TABLE `mst_depttype` ADD COLUMN IF NOT EXISTS  `depttype_descr` varchar(90)   AFTER `depttype_name`;
ALTER TABLE `mst_depttype` ADD COLUMN IF NOT EXISTS  `depttype_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `depttype_descr`;


ALTER TABLE `mst_depttype` MODIFY COLUMN IF EXISTS  `depttype_name` varchar(60) NOT NULL   AFTER `depttype_id`;
ALTER TABLE `mst_depttype` MODIFY COLUMN IF EXISTS  `depttype_descr` varchar(90)    AFTER `depttype_name`;
ALTER TABLE `mst_depttype` MODIFY COLUMN IF EXISTS  `depttype_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `depttype_descr`;


ALTER TABLE `mst_depttype` ADD CONSTRAINT `depttype_name` UNIQUE IF NOT EXISTS  (`depttype_name`);







