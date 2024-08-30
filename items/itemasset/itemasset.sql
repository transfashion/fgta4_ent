-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_itemasset`;
-- drop table if exists `mst_itemassetprop`;
-- drop table if exists `mst_itemassetdepre`;


CREATE TABLE IF NOT EXISTS `mst_itemasset` (
	`itemasset_id` varchar(14) NOT NULL , 
	`owner_dept_id` varchar(30)  , 
	`item_id` varchar(14)  , 
	`itemasset_name` varchar(150) NOT NULL , 
	`itemasset_merk` varchar(255)  , 
	`itemasset_type` varchar(255)  , 
	`itemasset_serial` varchar(30)  , 
	`itemasset_descr` varchar(255)  , 
	`itemstatus_id` varchar(2)  , 
	`itemasset_statusnote` varchar(255)  , 
	`itemasset_ischeckout` tinyint(1) NOT NULL DEFAULT 0, 
	`itemasset_ismoveable` tinyint(1) NOT NULL DEFAULT 0, 
	`itemasset_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`itemasset_iswrittenof` tinyint(1) NOT NULL DEFAULT 0, 
	`itemgroup_id` varchar(15) NOT NULL , 
	`itemmodel_id` varchar(10) NOT NULL , 
	`itemclass_id` varchar(14) NOT NULL , 
	`itemasset_baselocation` varchar(255)  , 
	`site_id` varchar(30)  , 
	`maintainer_dept_id` varchar(30)  , 
	`location_dept_id` varchar(30)  , 
	`location_site_id` varchar(30)  , 
	`location_room_id` varchar(30)  , 
	`location_empl_id` varchar(14)  , 
	`partner_id` varchar(30)  , 
	`itemasset_purchasedate` date NOT NULL , 
	`itemasset_lastsupportdate` date NOT NULL , 
	`itemasset_purchasevalue` decimal(11, 2) NOT NULL DEFAULT 0, 
	`curr_id` varchar(10)  , 
	`itemasset_purchasevalue_idr` decimal(11, 2) NOT NULL DEFAULT 0, 
	`asset_coa_id` varchar(20)  , 
	`depremodel_id` varchar(10)  , 
	`cost_coa_id` varchar(20)  , 
	`itemasset_depreage` int(2) NOT NULL DEFAULT 5, 
	`itemasset_depreresidu` decimal(11, 2) NOT NULL DEFAULT 1, 
	`itemasset_currentvalue_idr` decimal(11, 2) NOT NULL DEFAULT 0, 
	`itemasset_currentvalue_date` date NOT NULL DEFAULT NOW(), 
	`itemasset_usevaluerate` decimal(12, 0) NOT NULL DEFAULT 0, 
	`itemasset_writeoffby` varchar(14)  , 
	`itemasset_writeoffdate` datetime  , 
	`itemasset_writeoffref` varchar(30)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemasset_serial` (`itemasset_serial`),
	PRIMARY KEY (`itemasset_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Item Asset';


ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `owner_dept_id` varchar(30)   AFTER `itemasset_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `item_id` varchar(14)   AFTER `owner_dept_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_name` varchar(150) NOT NULL  AFTER `item_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_merk` varchar(255)   AFTER `itemasset_name`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_type` varchar(255)   AFTER `itemasset_merk`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_serial` varchar(30)   AFTER `itemasset_type`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_descr` varchar(255)   AFTER `itemasset_serial`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemstatus_id` varchar(2)   AFTER `itemasset_descr`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_statusnote` varchar(255)   AFTER `itemstatus_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_ischeckout` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemasset_statusnote`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_ismoveable` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemasset_ischeckout`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemasset_ismoveable`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_iswrittenof` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemasset_isdisabled`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemgroup_id` varchar(15) NOT NULL  AFTER `itemasset_iswrittenof`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemmodel_id` varchar(10) NOT NULL  AFTER `itemgroup_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemclass_id` varchar(14) NOT NULL  AFTER `itemmodel_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_baselocation` varchar(255)   AFTER `itemclass_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `site_id` varchar(30)   AFTER `itemasset_baselocation`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `maintainer_dept_id` varchar(30)   AFTER `site_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `location_dept_id` varchar(30)   AFTER `maintainer_dept_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `location_site_id` varchar(30)   AFTER `location_dept_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `location_room_id` varchar(30)   AFTER `location_site_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `location_empl_id` varchar(14)   AFTER `location_room_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `partner_id` varchar(30)   AFTER `location_empl_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_purchasedate` date NOT NULL  AFTER `partner_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_lastsupportdate` date NOT NULL  AFTER `itemasset_purchasedate`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_purchasevalue` decimal(11, 2) NOT NULL DEFAULT 0 AFTER `itemasset_lastsupportdate`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `curr_id` varchar(10)   AFTER `itemasset_purchasevalue`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_purchasevalue_idr` decimal(11, 2) NOT NULL DEFAULT 0 AFTER `curr_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `asset_coa_id` varchar(20)   AFTER `itemasset_purchasevalue_idr`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `depremodel_id` varchar(10)   AFTER `asset_coa_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `cost_coa_id` varchar(20)   AFTER `depremodel_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_depreage` int(2) NOT NULL DEFAULT 5 AFTER `cost_coa_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_depreresidu` decimal(11, 2) NOT NULL DEFAULT 1 AFTER `itemasset_depreage`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_currentvalue_idr` decimal(11, 2) NOT NULL DEFAULT 0 AFTER `itemasset_depreresidu`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_currentvalue_date` date NOT NULL DEFAULT NOW() AFTER `itemasset_currentvalue_idr`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_usevaluerate` decimal(12, 0) NOT NULL DEFAULT 0 AFTER `itemasset_currentvalue_date`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_writeoffby` varchar(14)   AFTER `itemasset_usevaluerate`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_writeoffdate` datetime   AFTER `itemasset_writeoffby`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_writeoffref` varchar(30)   AFTER `itemasset_writeoffdate`;


ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `owner_dept_id` varchar(30)    AFTER `itemasset_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `item_id` varchar(14)    AFTER `owner_dept_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_name` varchar(150) NOT NULL   AFTER `item_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_merk` varchar(255)    AFTER `itemasset_name`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_type` varchar(255)    AFTER `itemasset_merk`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_serial` varchar(30)    AFTER `itemasset_type`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_descr` varchar(255)    AFTER `itemasset_serial`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemstatus_id` varchar(2)    AFTER `itemasset_descr`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_statusnote` varchar(255)    AFTER `itemstatus_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_ischeckout` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemasset_statusnote`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_ismoveable` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemasset_ischeckout`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemasset_ismoveable`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_iswrittenof` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemasset_isdisabled`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemgroup_id` varchar(15) NOT NULL   AFTER `itemasset_iswrittenof`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemmodel_id` varchar(10) NOT NULL   AFTER `itemgroup_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemclass_id` varchar(14) NOT NULL   AFTER `itemmodel_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_baselocation` varchar(255)    AFTER `itemclass_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `site_id` varchar(30)    AFTER `itemasset_baselocation`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `maintainer_dept_id` varchar(30)    AFTER `site_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `location_dept_id` varchar(30)    AFTER `maintainer_dept_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `location_site_id` varchar(30)    AFTER `location_dept_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `location_room_id` varchar(30)    AFTER `location_site_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `location_empl_id` varchar(14)    AFTER `location_room_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `partner_id` varchar(30)    AFTER `location_empl_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_purchasedate` date NOT NULL   AFTER `partner_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_lastsupportdate` date NOT NULL   AFTER `itemasset_purchasedate`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_purchasevalue` decimal(11, 2) NOT NULL DEFAULT 0  AFTER `itemasset_lastsupportdate`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `curr_id` varchar(10)    AFTER `itemasset_purchasevalue`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_purchasevalue_idr` decimal(11, 2) NOT NULL DEFAULT 0  AFTER `curr_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `asset_coa_id` varchar(20)    AFTER `itemasset_purchasevalue_idr`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `depremodel_id` varchar(10)    AFTER `asset_coa_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `cost_coa_id` varchar(20)    AFTER `depremodel_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_depreage` int(2) NOT NULL DEFAULT 5  AFTER `cost_coa_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_depreresidu` decimal(11, 2) NOT NULL DEFAULT 1  AFTER `itemasset_depreage`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_currentvalue_idr` decimal(11, 2) NOT NULL DEFAULT 0  AFTER `itemasset_depreresidu`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_currentvalue_date` date NOT NULL DEFAULT NOW()  AFTER `itemasset_currentvalue_idr`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_usevaluerate` decimal(12, 0) NOT NULL DEFAULT 0  AFTER `itemasset_currentvalue_date`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_writeoffby` varchar(14)    AFTER `itemasset_usevaluerate`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_writeoffdate` datetime    AFTER `itemasset_writeoffby`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_writeoffref` varchar(30)    AFTER `itemasset_writeoffdate`;


ALTER TABLE `mst_itemasset` ADD CONSTRAINT `itemasset_serial` UNIQUE IF NOT EXISTS  (`itemasset_serial`);

ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `owner_dept_id` (`owner_dept_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `item_id` (`item_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `itemstatus_id` (`itemstatus_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `itemgroup_id` (`itemgroup_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `itemmodel_id` (`itemmodel_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `itemclass_id` (`itemclass_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `site_id` (`site_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `maintainer_dept_id` (`maintainer_dept_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `location_dept_id` (`location_dept_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `location_site_id` (`location_site_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `location_room_id` (`location_room_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `location_empl_id` (`location_empl_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `partner_id` (`partner_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `curr_id` (`curr_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `asset_coa_id` (`asset_coa_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `depremodel_id` (`depremodel_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `cost_coa_id` (`cost_coa_id`);

ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_dept` FOREIGN KEY IF NOT EXISTS  (`owner_dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_item` FOREIGN KEY IF NOT EXISTS  (`item_id`) REFERENCES `mst_item` (`item_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_itemstatus` FOREIGN KEY IF NOT EXISTS  (`itemstatus_id`) REFERENCES `mst_itemstatus` (`itemstatus_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_itemgroup` FOREIGN KEY IF NOT EXISTS  (`itemgroup_id`) REFERENCES `mst_itemgroup` (`itemgroup_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_itemmodel` FOREIGN KEY IF NOT EXISTS  (`itemmodel_id`) REFERENCES `mst_itemmodel` (`itemmodel_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_itemclass` FOREIGN KEY IF NOT EXISTS  (`itemclass_id`) REFERENCES `mst_itemclass` (`itemclass_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_site` FOREIGN KEY IF NOT EXISTS  (`site_id`) REFERENCES `mst_site` (`site_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_dept_2` FOREIGN KEY IF NOT EXISTS  (`maintainer_dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_dept_3` FOREIGN KEY IF NOT EXISTS  (`location_dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_site_2` FOREIGN KEY IF NOT EXISTS  (`location_site_id`) REFERENCES `mst_site` (`site_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_room` FOREIGN KEY IF NOT EXISTS  (`location_room_id`) REFERENCES `mst_room` (`room_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_empl` FOREIGN KEY IF NOT EXISTS  (`location_empl_id`) REFERENCES `mst_empl` (`empl_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_partner` FOREIGN KEY IF NOT EXISTS  (`partner_id`) REFERENCES `mst_partner` (`partner_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_curr` FOREIGN KEY IF NOT EXISTS  (`curr_id`) REFERENCES `mst_curr` (`curr_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_coa` FOREIGN KEY IF NOT EXISTS  (`asset_coa_id`) REFERENCES `mst_coa` (`coa_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_depremodel` FOREIGN KEY IF NOT EXISTS  (`depremodel_id`) REFERENCES `mst_depremodel` (`depremodel_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_coa_2` FOREIGN KEY IF NOT EXISTS  (`cost_coa_id`) REFERENCES `mst_coa` (`coa_id`);





CREATE TABLE IF NOT EXISTS `mst_itemassetprop` (
	`itemassetprop_id` varchar(14) NOT NULL , 
	`prop_id` varchar(26) NOT NULL , 
	`itemassetprop_value` varchar(254) NOT NULL , 
	`itemassetprop_order` int(4) NOT NULL DEFAULT 0, 
	`itemasset_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemassetprop_id`)
) 
ENGINE=InnoDB
COMMENT='Properti / Spesifikasi item asset';


ALTER TABLE `mst_itemassetprop` ADD COLUMN IF NOT EXISTS  `prop_id` varchar(26) NOT NULL  AFTER `itemassetprop_id`;
ALTER TABLE `mst_itemassetprop` ADD COLUMN IF NOT EXISTS  `itemassetprop_value` varchar(254) NOT NULL  AFTER `prop_id`;
ALTER TABLE `mst_itemassetprop` ADD COLUMN IF NOT EXISTS  `itemassetprop_order` int(4) NOT NULL DEFAULT 0 AFTER `itemassetprop_value`;
ALTER TABLE `mst_itemassetprop` ADD COLUMN IF NOT EXISTS  `itemasset_id` varchar(14) NOT NULL  AFTER `itemassetprop_order`;


ALTER TABLE `mst_itemassetprop` MODIFY COLUMN IF EXISTS  `prop_id` varchar(26) NOT NULL   AFTER `itemassetprop_id`;
ALTER TABLE `mst_itemassetprop` MODIFY COLUMN IF EXISTS  `itemassetprop_value` varchar(254) NOT NULL   AFTER `prop_id`;
ALTER TABLE `mst_itemassetprop` MODIFY COLUMN IF EXISTS  `itemassetprop_order` int(4) NOT NULL DEFAULT 0  AFTER `itemassetprop_value`;
ALTER TABLE `mst_itemassetprop` MODIFY COLUMN IF EXISTS  `itemasset_id` varchar(14) NOT NULL   AFTER `itemassetprop_order`;



ALTER TABLE `mst_itemassetprop` ADD KEY IF NOT EXISTS `prop_id` (`prop_id`);
ALTER TABLE `mst_itemassetprop` ADD KEY IF NOT EXISTS `itemasset_id` (`itemasset_id`);

ALTER TABLE `mst_itemassetprop` ADD CONSTRAINT `fk_mst_itemassetprop_mst_itemprop` FOREIGN KEY IF NOT EXISTS  (`prop_id`) REFERENCES `mst_itemprop` (`prop_id`);
ALTER TABLE `mst_itemassetprop` ADD CONSTRAINT `fk_mst_itemassetprop_mst_itemasset` FOREIGN KEY IF NOT EXISTS (`itemasset_id`) REFERENCES `mst_itemasset` (`itemasset_id`);





CREATE TABLE IF NOT EXISTS `mst_itemassetdepre` (
	`itemassetdepre_id` varchar(14) NOT NULL , 
	`itemassetdepre_date` date NOT NULL , 
	`itemassetdepre_value` decimal(11, 2) NOT NULL DEFAULT 0, 
	`itemassetdepre_ref` varchar(30)  , 
	`itemasset_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemassetdepre_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Depresiasi Item Asset';


ALTER TABLE `mst_itemassetdepre` ADD COLUMN IF NOT EXISTS  `itemassetdepre_date` date NOT NULL  AFTER `itemassetdepre_id`;
ALTER TABLE `mst_itemassetdepre` ADD COLUMN IF NOT EXISTS  `itemassetdepre_value` decimal(11, 2) NOT NULL DEFAULT 0 AFTER `itemassetdepre_date`;
ALTER TABLE `mst_itemassetdepre` ADD COLUMN IF NOT EXISTS  `itemassetdepre_ref` varchar(30)   AFTER `itemassetdepre_value`;
ALTER TABLE `mst_itemassetdepre` ADD COLUMN IF NOT EXISTS  `itemasset_id` varchar(14) NOT NULL  AFTER `itemassetdepre_ref`;


ALTER TABLE `mst_itemassetdepre` MODIFY COLUMN IF EXISTS  `itemassetdepre_date` date NOT NULL   AFTER `itemassetdepre_id`;
ALTER TABLE `mst_itemassetdepre` MODIFY COLUMN IF EXISTS  `itemassetdepre_value` decimal(11, 2) NOT NULL DEFAULT 0  AFTER `itemassetdepre_date`;
ALTER TABLE `mst_itemassetdepre` MODIFY COLUMN IF EXISTS  `itemassetdepre_ref` varchar(30)    AFTER `itemassetdepre_value`;
ALTER TABLE `mst_itemassetdepre` MODIFY COLUMN IF EXISTS  `itemasset_id` varchar(14) NOT NULL   AFTER `itemassetdepre_ref`;



ALTER TABLE `mst_itemassetdepre` ADD KEY IF NOT EXISTS `itemasset_id` (`itemasset_id`);

ALTER TABLE `mst_itemassetdepre` ADD CONSTRAINT `fk_mst_itemassetdepre_mst_itemasset` FOREIGN KEY IF NOT EXISTS (`itemasset_id`) REFERENCES `mst_itemasset` (`itemasset_id`);





