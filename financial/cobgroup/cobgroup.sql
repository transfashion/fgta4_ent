-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_cobgroup`;


CREATE TABLE IF NOT EXISTS `mst_cobgroup` (
	`cobgroup_id` varchar(17) NOT NULL , 
	`cobgroup_name` varchar(90)  , 
	`cobgroup_descr` varchar(255)  , 
	`cobgroup_isparent` tinyint(1) NOT NULL DEFAULT 0, 
	`cobgroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`cobgroup_parent` varchar(17)  , 
	`cobgroup_path` varchar(340) NOT NULL , 
	`cobgroup_pathid` varchar(17) NOT NULL , 
	`cobgroup_level` int(2) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `cobgroup_name` (`cobgroup_name`),
	UNIQUE KEY `cobgroup_path` (`cobgroup_path`, `cobgroup_pathid`),
	PRIMARY KEY (`cobgroup_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Grouping Budget Account';


ALTER TABLE `mst_cobgroup` ADD COLUMN IF NOT EXISTS  `cobgroup_name` varchar(90)   AFTER `cobgroup_id`;
ALTER TABLE `mst_cobgroup` ADD COLUMN IF NOT EXISTS  `cobgroup_descr` varchar(255)   AFTER `cobgroup_name`;
ALTER TABLE `mst_cobgroup` ADD COLUMN IF NOT EXISTS  `cobgroup_isparent` tinyint(1) NOT NULL DEFAULT 0 AFTER `cobgroup_descr`;
ALTER TABLE `mst_cobgroup` ADD COLUMN IF NOT EXISTS  `cobgroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `cobgroup_isparent`;
ALTER TABLE `mst_cobgroup` ADD COLUMN IF NOT EXISTS  `cobgroup_parent` varchar(17)   AFTER `cobgroup_isdisabled`;
ALTER TABLE `mst_cobgroup` ADD COLUMN IF NOT EXISTS  `cobgroup_path` varchar(340) NOT NULL  AFTER `cobgroup_parent`;
ALTER TABLE `mst_cobgroup` ADD COLUMN IF NOT EXISTS  `cobgroup_pathid` varchar(17) NOT NULL  AFTER `cobgroup_path`;
ALTER TABLE `mst_cobgroup` ADD COLUMN IF NOT EXISTS  `cobgroup_level` int(2) NOT NULL DEFAULT 0 AFTER `cobgroup_pathid`;


ALTER TABLE `mst_cobgroup` MODIFY COLUMN IF EXISTS  `cobgroup_name` varchar(90)    AFTER `cobgroup_id`;
ALTER TABLE `mst_cobgroup` MODIFY COLUMN IF EXISTS  `cobgroup_descr` varchar(255)    AFTER `cobgroup_name`;
ALTER TABLE `mst_cobgroup` MODIFY COLUMN IF EXISTS  `cobgroup_isparent` tinyint(1) NOT NULL DEFAULT 0  AFTER `cobgroup_descr`;
ALTER TABLE `mst_cobgroup` MODIFY COLUMN IF EXISTS  `cobgroup_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `cobgroup_isparent`;
ALTER TABLE `mst_cobgroup` MODIFY COLUMN IF EXISTS  `cobgroup_parent` varchar(17)    AFTER `cobgroup_isdisabled`;
ALTER TABLE `mst_cobgroup` MODIFY COLUMN IF EXISTS  `cobgroup_path` varchar(340) NOT NULL   AFTER `cobgroup_parent`;
ALTER TABLE `mst_cobgroup` MODIFY COLUMN IF EXISTS  `cobgroup_pathid` varchar(17) NOT NULL   AFTER `cobgroup_path`;
ALTER TABLE `mst_cobgroup` MODIFY COLUMN IF EXISTS  `cobgroup_level` int(2) NOT NULL DEFAULT 0  AFTER `cobgroup_pathid`;


ALTER TABLE `mst_cobgroup` ADD CONSTRAINT `cobgroup_name` UNIQUE IF NOT EXISTS  (`cobgroup_name`);
ALTER TABLE `mst_cobgroup` ADD CONSTRAINT `cobgroup_path` UNIQUE IF NOT EXISTS  (`cobgroup_path`, `cobgroup_pathid`);

ALTER TABLE `mst_cobgroup` ADD KEY IF NOT EXISTS `cobgroup_parent` (`cobgroup_parent`);

ALTER TABLE `mst_cobgroup` ADD CONSTRAINT `fk_mst_cobgroup_mst_cobgroup` FOREIGN KEY IF NOT EXISTS  (`cobgroup_parent`) REFERENCES `mst_cobgroup` (`cobgroup_id`);





