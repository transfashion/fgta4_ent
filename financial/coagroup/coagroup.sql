-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_coagroup`;


CREATE TABLE IF NOT EXISTS `mst_coagroup` (
	`coagroup_id` varchar(17) NOT NULL , 
	`coagroup_name` varchar(90)  , 
	`coagroup_descr` varchar(255)  , 
	`coagroup_isparent` tinyint(1) NOT NULL DEFAULT 0, 
	`coagroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`coagroup_parent` varchar(17)  , 
	`coamodel_id` varchar(10) NOT NULL , 
	`coareport_id` varchar(2) NOT NULL , 
	`coagroup_path` varchar(340) NOT NULL , 
	`coagroup_pathid` varchar(17) NOT NULL , 
	`coagroup_level` int(2) NOT NULL DEFAULT 0, 
	`coagroup_isexselect` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `coagroup_name` (`coagroup_name`),
	UNIQUE KEY `coagroup_path` (`coagroup_path`, `coagroup_pathid`),
	PRIMARY KEY (`coagroup_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Grouping COA';


ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_name` varchar(90)   AFTER `coagroup_id`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_descr` varchar(255)   AFTER `coagroup_name`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_isparent` tinyint(1) NOT NULL DEFAULT 0 AFTER `coagroup_descr`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `coagroup_isparent`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_parent` varchar(17)   AFTER `coagroup_isdisabled`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coamodel_id` varchar(10) NOT NULL  AFTER `coagroup_parent`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coareport_id` varchar(2) NOT NULL  AFTER `coamodel_id`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_path` varchar(340) NOT NULL  AFTER `coareport_id`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_pathid` varchar(17) NOT NULL  AFTER `coagroup_path`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_level` int(2) NOT NULL DEFAULT 0 AFTER `coagroup_pathid`;
ALTER TABLE `mst_coagroup` ADD COLUMN IF NOT EXISTS  `coagroup_isexselect` tinyint(1) NOT NULL DEFAULT 0 AFTER `coagroup_level`;


ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_name` varchar(90)    AFTER `coagroup_id`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_descr` varchar(255)    AFTER `coagroup_name`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_isparent` tinyint(1) NOT NULL DEFAULT 0  AFTER `coagroup_descr`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `coagroup_isparent`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_parent` varchar(17)    AFTER `coagroup_isdisabled`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coamodel_id` varchar(10) NOT NULL   AFTER `coagroup_parent`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coareport_id` varchar(2) NOT NULL   AFTER `coamodel_id`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_path` varchar(340) NOT NULL   AFTER `coareport_id`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_pathid` varchar(17) NOT NULL   AFTER `coagroup_path`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_level` int(2) NOT NULL DEFAULT 0  AFTER `coagroup_pathid`;
ALTER TABLE `mst_coagroup` MODIFY COLUMN IF EXISTS  `coagroup_isexselect` tinyint(1) NOT NULL DEFAULT 0  AFTER `coagroup_level`;


ALTER TABLE `mst_coagroup` ADD CONSTRAINT `coagroup_name` UNIQUE IF NOT EXISTS  (`coagroup_name`);
ALTER TABLE `mst_coagroup` ADD CONSTRAINT `coagroup_path` UNIQUE IF NOT EXISTS  (`coagroup_path`, `coagroup_pathid`);

ALTER TABLE `mst_coagroup` ADD KEY IF NOT EXISTS `coagroup_parent` (`coagroup_parent`);
ALTER TABLE `mst_coagroup` ADD KEY IF NOT EXISTS `coamodel_id` (`coamodel_id`);
ALTER TABLE `mst_coagroup` ADD KEY IF NOT EXISTS `coareport_id` (`coareport_id`);

ALTER TABLE `mst_coagroup` ADD CONSTRAINT `fk_mst_coagroup_mst_coagroup` FOREIGN KEY IF NOT EXISTS  (`coagroup_parent`) REFERENCES `mst_coagroup` (`coagroup_id`);
ALTER TABLE `mst_coagroup` ADD CONSTRAINT `fk_mst_coagroup_mst_coamodel` FOREIGN KEY IF NOT EXISTS  (`coamodel_id`) REFERENCES `mst_coamodel` (`coamodel_id`);
ALTER TABLE `mst_coagroup` ADD CONSTRAINT `fk_mst_coagroup_mst_coareport` FOREIGN KEY IF NOT EXISTS  (`coareport_id`) REFERENCES `mst_coareport` (`coareport_id`);





