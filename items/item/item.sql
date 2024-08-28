-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_item`;
-- drop table if exists `mst_itemprop`;


CREATE TABLE IF NOT EXISTS `mst_item` (
	`item_id` varchar(14) NOT NULL , 
	`itemgroup_id` varchar(15) NOT NULL , 
	`itemmodel_id` varchar(10) NOT NULL , 
	`itemclass_id` varchar(14) NOT NULL , 
	`item_name` varchar(255) NOT NULL , 
	`item_nameshort` varchar(255) NOT NULL , 
	`item_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`item_descr` varchar(255)  , 
	`item_estcost` decimal(11, 2) NOT NULL DEFAULT 0, 
	`item_maxcost` decimal(11, 2) NOT NULL DEFAULT 0, 
	`item_avgcost` decimal(11, 2) NOT NULL DEFAULT 0, 
	`item_mincost` decimal(11, 2) NOT NULL DEFAULT 0, 
	`dept_id` varchar(30)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `item_name` (`item_name`),
	PRIMARY KEY (`item_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar  Item';


ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `itemgroup_id` varchar(15) NOT NULL  AFTER `item_id`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `itemmodel_id` varchar(10) NOT NULL  AFTER `itemgroup_id`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `itemclass_id` varchar(14) NOT NULL  AFTER `itemmodel_id`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `item_name` varchar(255) NOT NULL  AFTER `itemclass_id`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `item_nameshort` varchar(255) NOT NULL  AFTER `item_name`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `item_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `item_nameshort`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `item_descr` varchar(255)   AFTER `item_isdisabled`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `item_estcost` decimal(11, 2) NOT NULL DEFAULT 0 AFTER `item_descr`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `item_maxcost` decimal(11, 2) NOT NULL DEFAULT 0 AFTER `item_estcost`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `item_avgcost` decimal(11, 2) NOT NULL DEFAULT 0 AFTER `item_maxcost`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `item_mincost` decimal(11, 2) NOT NULL DEFAULT 0 AFTER `item_avgcost`;
ALTER TABLE `mst_item` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30)   AFTER `item_mincost`;


ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `itemgroup_id` varchar(15) NOT NULL   AFTER `item_id`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `itemmodel_id` varchar(10) NOT NULL   AFTER `itemgroup_id`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `itemclass_id` varchar(14) NOT NULL   AFTER `itemmodel_id`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `item_name` varchar(255) NOT NULL   AFTER `itemclass_id`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `item_nameshort` varchar(255) NOT NULL   AFTER `item_name`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `item_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `item_nameshort`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `item_descr` varchar(255)    AFTER `item_isdisabled`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `item_estcost` decimal(11, 2) NOT NULL DEFAULT 0  AFTER `item_descr`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `item_maxcost` decimal(11, 2) NOT NULL DEFAULT 0  AFTER `item_estcost`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `item_avgcost` decimal(11, 2) NOT NULL DEFAULT 0  AFTER `item_maxcost`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `item_mincost` decimal(11, 2) NOT NULL DEFAULT 0  AFTER `item_avgcost`;
ALTER TABLE `mst_item` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30)    AFTER `item_mincost`;


ALTER TABLE `mst_item` ADD CONSTRAINT `item_name` UNIQUE IF NOT EXISTS  (`item_name`);

ALTER TABLE `mst_item` ADD KEY IF NOT EXISTS `itemgroup_id` (`itemgroup_id`);
ALTER TABLE `mst_item` ADD KEY IF NOT EXISTS `itemmodel_id` (`itemmodel_id`);
ALTER TABLE `mst_item` ADD KEY IF NOT EXISTS `itemclass_id` (`itemclass_id`);
ALTER TABLE `mst_item` ADD KEY IF NOT EXISTS `dept_id` (`dept_id`);

ALTER TABLE `mst_item` ADD CONSTRAINT `fk_mst_item_mst_itemgroup` FOREIGN KEY IF NOT EXISTS  (`itemgroup_id`) REFERENCES `mst_itemgroup` (`itemgroup_id`);
ALTER TABLE `mst_item` ADD CONSTRAINT `fk_mst_item_mst_itemmodel` FOREIGN KEY IF NOT EXISTS  (`itemmodel_id`) REFERENCES `mst_itemmodel` (`itemmodel_id`);
ALTER TABLE `mst_item` ADD CONSTRAINT `fk_mst_item_mst_itemclass` FOREIGN KEY IF NOT EXISTS  (`itemclass_id`) REFERENCES `mst_itemclass` (`itemclass_id`);
ALTER TABLE `mst_item` ADD CONSTRAINT `fk_mst_item_mst_dept` FOREIGN KEY IF NOT EXISTS  (`dept_id`) REFERENCES `mst_dept` (`dept_id`);





CREATE TABLE IF NOT EXISTS `mst_itemprop` (
	`itemprop_id` varchar(14) NOT NULL , 
	`prop_id` varchar(26) NOT NULL , 
	`itemmodelprop_order` int(4) NOT NULL DEFAULT 0, 
	`itemmodel_id` varchar(10) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemprop_id`)
) 
ENGINE=InnoDB
COMMENT='Template Properti / Spesifikasi item';


ALTER TABLE `mst_itemprop` ADD COLUMN IF NOT EXISTS  `prop_id` varchar(26) NOT NULL  AFTER `itemprop_id`;
ALTER TABLE `mst_itemprop` ADD COLUMN IF NOT EXISTS  `itemmodelprop_order` int(4) NOT NULL DEFAULT 0 AFTER `prop_id`;
ALTER TABLE `mst_itemprop` ADD COLUMN IF NOT EXISTS  `itemmodel_id` varchar(10) NOT NULL  AFTER `itemmodelprop_order`;


ALTER TABLE `mst_itemprop` MODIFY COLUMN IF EXISTS  `prop_id` varchar(26) NOT NULL   AFTER `itemprop_id`;
ALTER TABLE `mst_itemprop` MODIFY COLUMN IF EXISTS  `itemmodelprop_order` int(4) NOT NULL DEFAULT 0  AFTER `prop_id`;
ALTER TABLE `mst_itemprop` MODIFY COLUMN IF EXISTS  `itemmodel_id` varchar(10) NOT NULL   AFTER `itemmodelprop_order`;



ALTER TABLE `mst_itemprop` ADD KEY IF NOT EXISTS `prop_id` (`prop_id`);

ALTER TABLE `mst_itemprop` ADD CONSTRAINT `fk_mst_itemprop_mst_prop` FOREIGN KEY IF NOT EXISTS  (`prop_id`) REFERENCES `mst_prop` (`prop_id`);





