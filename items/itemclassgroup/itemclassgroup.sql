-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_itemclassgroup`;


CREATE TABLE IF NOT EXISTS `mst_itemclassgroup` (
	`itemclassgroup_id` varchar(15) NOT NULL , 
	`itemclassgroup_name` varchar(60) NOT NULL , 
	`itemclassgroup_descr` varchar(90)  , 
	`itemclassgroup_parent` varchar(15)  , 
	`itemclassgroup_pathid` varchar(15) NOT NULL , 
	`itemclassgroup_path` varchar(390) NOT NULL , 
	`itemclassgroup_level` int(2) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemclassgroup_name` (`itemclassgroup_name`),
	UNIQUE KEY `itemclassgroup_path` (`itemclassgroup_path`, `itemclassgroup_pathid`),
	PRIMARY KEY (`itemclassgroup_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Group Klasifikasi';


ALTER TABLE `mst_itemclassgroup` ADD COLUMN IF NOT EXISTS  `itemclassgroup_name` varchar(60) NOT NULL  AFTER `itemclassgroup_id`;
ALTER TABLE `mst_itemclassgroup` ADD COLUMN IF NOT EXISTS  `itemclassgroup_descr` varchar(90)   AFTER `itemclassgroup_name`;
ALTER TABLE `mst_itemclassgroup` ADD COLUMN IF NOT EXISTS  `itemclassgroup_parent` varchar(15)   AFTER `itemclassgroup_descr`;
ALTER TABLE `mst_itemclassgroup` ADD COLUMN IF NOT EXISTS  `itemclassgroup_pathid` varchar(15) NOT NULL  AFTER `itemclassgroup_parent`;
ALTER TABLE `mst_itemclassgroup` ADD COLUMN IF NOT EXISTS  `itemclassgroup_path` varchar(390) NOT NULL  AFTER `itemclassgroup_pathid`;
ALTER TABLE `mst_itemclassgroup` ADD COLUMN IF NOT EXISTS  `itemclassgroup_level` int(2) NOT NULL DEFAULT 0 AFTER `itemclassgroup_path`;


ALTER TABLE `mst_itemclassgroup` MODIFY COLUMN IF EXISTS  `itemclassgroup_name` varchar(60) NOT NULL   AFTER `itemclassgroup_id`;
ALTER TABLE `mst_itemclassgroup` MODIFY COLUMN IF EXISTS  `itemclassgroup_descr` varchar(90)    AFTER `itemclassgroup_name`;
ALTER TABLE `mst_itemclassgroup` MODIFY COLUMN IF EXISTS  `itemclassgroup_parent` varchar(15)    AFTER `itemclassgroup_descr`;
ALTER TABLE `mst_itemclassgroup` MODIFY COLUMN IF EXISTS  `itemclassgroup_pathid` varchar(15) NOT NULL   AFTER `itemclassgroup_parent`;
ALTER TABLE `mst_itemclassgroup` MODIFY COLUMN IF EXISTS  `itemclassgroup_path` varchar(390) NOT NULL   AFTER `itemclassgroup_pathid`;
ALTER TABLE `mst_itemclassgroup` MODIFY COLUMN IF EXISTS  `itemclassgroup_level` int(2) NOT NULL DEFAULT 0  AFTER `itemclassgroup_path`;


ALTER TABLE `mst_itemclassgroup` ADD CONSTRAINT `itemclassgroup_name` UNIQUE IF NOT EXISTS  (`itemclassgroup_name`);
ALTER TABLE `mst_itemclassgroup` ADD CONSTRAINT `itemclassgroup_path` UNIQUE IF NOT EXISTS  (`itemclassgroup_path`, `itemclassgroup_pathid`);

ALTER TABLE `mst_itemclassgroup` ADD KEY IF NOT EXISTS `itemclassgroup_parent` (`itemclassgroup_parent`);

ALTER TABLE `mst_itemclassgroup` ADD CONSTRAINT `fk_mst_itemclassgroup_mst_itemclassgroup` FOREIGN KEY IF NOT EXISTS  (`itemclassgroup_parent`) REFERENCES `mst_itemclassgroup` (`itemclassgroup_id`);





