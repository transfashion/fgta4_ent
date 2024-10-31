-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_itemastockbatch`;


CREATE TABLE IF NOT EXISTS `mst_itemastockbatch` (
	`itemstockbatch_id` varchar(14) NOT NULL , 
	`itemstockbatch_name` varchar(60) NOT NULL , 
	`itemstockbatch_exp` date  , 
	`itemstockbatch_isdisabled` tinyint(1) NOT NULL DEFAULT 1, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemstockbatch_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Batch Itemstock';


ALTER TABLE `mst_itemastockbatch` ADD COLUMN IF NOT EXISTS  `itemstockbatch_name` varchar(60) NOT NULL  AFTER `itemstockbatch_id`;
ALTER TABLE `mst_itemastockbatch` ADD COLUMN IF NOT EXISTS  `itemstockbatch_exp` date   AFTER `itemstockbatch_name`;
ALTER TABLE `mst_itemastockbatch` ADD COLUMN IF NOT EXISTS  `itemstockbatch_isdisabled` tinyint(1) NOT NULL DEFAULT 1 AFTER `itemstockbatch_exp`;


ALTER TABLE `mst_itemastockbatch` MODIFY COLUMN IF EXISTS  `itemstockbatch_name` varchar(60) NOT NULL   AFTER `itemstockbatch_id`;
ALTER TABLE `mst_itemastockbatch` MODIFY COLUMN IF EXISTS  `itemstockbatch_exp` date    AFTER `itemstockbatch_name`;
ALTER TABLE `mst_itemastockbatch` MODIFY COLUMN IF EXISTS  `itemstockbatch_isdisabled` tinyint(1) NOT NULL DEFAULT 1  AFTER `itemstockbatch_exp`;









