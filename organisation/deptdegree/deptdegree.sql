-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_deptdegree`;


CREATE TABLE IF NOT EXISTS `mst_deptdegree` (
	`deptdegree_id` varchar(10) NOT NULL , 
	`deptdegree_name` varchar(60) NOT NULL , 
	`deptdegree_descr` varchar(90)  , 
	`deptdegree_order` int(4) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `deptdegree_name` (`deptdegree_name`),
	PRIMARY KEY (`deptdegree_id`)
) 
ENGINE=InnoDB
COMMENT='Urutan/hierarki organisasi departement, direktorat, divisi, dept, dst';


ALTER TABLE `mst_deptdegree` ADD COLUMN IF NOT EXISTS  `deptdegree_name` varchar(60) NOT NULL  AFTER `deptdegree_id`;
ALTER TABLE `mst_deptdegree` ADD COLUMN IF NOT EXISTS  `deptdegree_descr` varchar(90)   AFTER `deptdegree_name`;
ALTER TABLE `mst_deptdegree` ADD COLUMN IF NOT EXISTS  `deptdegree_order` int(4) NOT NULL DEFAULT 0 AFTER `deptdegree_descr`;


ALTER TABLE `mst_deptdegree` MODIFY COLUMN IF EXISTS  `deptdegree_name` varchar(60) NOT NULL   AFTER `deptdegree_id`;
ALTER TABLE `mst_deptdegree` MODIFY COLUMN IF EXISTS  `deptdegree_descr` varchar(90)    AFTER `deptdegree_name`;
ALTER TABLE `mst_deptdegree` MODIFY COLUMN IF EXISTS  `deptdegree_order` int(4) NOT NULL DEFAULT 0  AFTER `deptdegree_descr`;


ALTER TABLE `mst_deptdegree` ADD CONSTRAINT `deptdegree_name` UNIQUE IF NOT EXISTS  (`deptdegree_name`);







