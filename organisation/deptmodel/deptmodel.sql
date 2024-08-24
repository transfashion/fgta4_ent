-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_deptmodel`;


CREATE TABLE IF NOT EXISTS `mst_deptmodel` (
	`deptmodel_id` varchar(10) NOT NULL , 
	`deptmodel_name` varchar(60) NOT NULL , 
	`deptmodel_descr` varchar(90)  , 
	`deptmodel_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`deptmodel_isrevenuecenter` tinyint(1) NOT NULL DEFAULT 0, 
	`deptmodel_iscostcenter` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `deptmodel_name` (`deptmodel_name`),
	PRIMARY KEY (`deptmodel_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Model Departement';


ALTER TABLE `mst_deptmodel` ADD COLUMN IF NOT EXISTS  `deptmodel_name` varchar(60) NOT NULL  AFTER `deptmodel_id`;
ALTER TABLE `mst_deptmodel` ADD COLUMN IF NOT EXISTS  `deptmodel_descr` varchar(90)   AFTER `deptmodel_name`;
ALTER TABLE `mst_deptmodel` ADD COLUMN IF NOT EXISTS  `deptmodel_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `deptmodel_descr`;
ALTER TABLE `mst_deptmodel` ADD COLUMN IF NOT EXISTS  `deptmodel_isrevenuecenter` tinyint(1) NOT NULL DEFAULT 0 AFTER `deptmodel_isdisabled`;
ALTER TABLE `mst_deptmodel` ADD COLUMN IF NOT EXISTS  `deptmodel_iscostcenter` tinyint(1) NOT NULL DEFAULT 0 AFTER `deptmodel_isrevenuecenter`;


ALTER TABLE `mst_deptmodel` MODIFY COLUMN IF EXISTS  `deptmodel_name` varchar(60) NOT NULL   AFTER `deptmodel_id`;
ALTER TABLE `mst_deptmodel` MODIFY COLUMN IF EXISTS  `deptmodel_descr` varchar(90)    AFTER `deptmodel_name`;
ALTER TABLE `mst_deptmodel` MODIFY COLUMN IF EXISTS  `deptmodel_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `deptmodel_descr`;
ALTER TABLE `mst_deptmodel` MODIFY COLUMN IF EXISTS  `deptmodel_isrevenuecenter` tinyint(1) NOT NULL DEFAULT 0  AFTER `deptmodel_isdisabled`;
ALTER TABLE `mst_deptmodel` MODIFY COLUMN IF EXISTS  `deptmodel_iscostcenter` tinyint(1) NOT NULL DEFAULT 0  AFTER `deptmodel_isrevenuecenter`;


ALTER TABLE `mst_deptmodel` ADD CONSTRAINT `deptmodel_name` UNIQUE IF NOT EXISTS  (`deptmodel_name`);







