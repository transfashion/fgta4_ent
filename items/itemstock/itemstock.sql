-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_itemstock`;
-- drop table if exists `mst_itemstockcompound`;
-- drop table if exists `mst_itemstockconversion`;
-- drop table if exists `mst_itemstockprop`;
-- drop table if exists `mst_itemstockbarcode`;


CREATE TABLE IF NOT EXISTS `mst_itemstock` (
	`itemstock_id` varchar(14) NOT NULL , 
	`itemgroup_id` varchar(15) NOT NULL , 
	`itemclass_id` varchar(14) NOT NULL , 
	`itemstock_code` varchar(150) NOT NULL , 
	`itemstock_name` varchar(150) NOT NULL , 
	`itemstock_nameshort` varchar(150) NOT NULL , 
	`itemstock_descr` varchar(2500)  , 
	`dept_id` varchar(30) NOT NULL , 
	`unit_id` varchar(10) NOT NULL , 
	`brand_id` varchar(14)  , 
	`unitmeasurement_id` varchar(10) NOT NULL , 
	`itemstock_couchdbid` varchar(255)  , 
	`itemstock_picture` varchar(90)  , 
	`itemstock_source` varchar(30) NOT NULL , 
	`itemstock_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_ishascompound` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_issellable` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_priceori` decimal(16, 0) NOT NULL DEFAULT 0, 
	`itemstock_priceadj` decimal(16, 0)  , 
	`itemstock_priceadjdate` datetime  , 
	`itemstock_grossprice` decimal(16, 0)  , 
	`itemstock_isdiscvalue` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_disc` decimal(5, 2) NOT NULL DEFAULT 0, 
	`itemstock_discval` decimal(16, 0) NOT NULL DEFAULT 0, 
	`itemstock_sellprice` decimal(16, 0)  , 
	`itemstock_estcost` decimal(12, 0)  , 
	`itemstock_weight` decimal(8, 2) NOT NULL DEFAULT 0, 
	`itemstock_length` decimal(8, 2) NOT NULL DEFAULT 0, 
	`itemstock_width` decimal(8, 2) NOT NULL DEFAULT 0, 
	`itemstock_height` decimal(8, 2) NOT NULL DEFAULT 0, 
	`itemstock_lastqty` decimal(14, 2)  , 
	`itemstock_lastvalue` decimal(16, 2)  , 
	`itemstock_lastqtyupdate` datetime  , 
	`itemstock_isupdating` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_updatebatch` varchar(30)  , 
	`itemstock_lastrecvid` varchar(90)  , 
	`itemstock_lastrecvdate` date  , 
	`itemstock_lastrecvqty` decimal(14, 2)  , 
	`itemstock_lastcost` decimal(14, 2)  , 
	`itemstock_lastcostdate` date  , 
	`itemstock_ref` varchar(90)  , 
	`itemstock_refname` varchar(200)  , 
	`itemstock_uploadbatchcode` varchar(32)  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemstock_code` (`dept_id`, `itemstock_code`),
	PRIMARY KEY (`itemstock_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Item Stock';


ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemgroup_id` varchar(15) NOT NULL  AFTER `itemstock_id`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemclass_id` varchar(14) NOT NULL  AFTER `itemgroup_id`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_code` varchar(150) NOT NULL  AFTER `itemclass_id`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_name` varchar(150) NOT NULL  AFTER `itemstock_code`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_nameshort` varchar(150) NOT NULL  AFTER `itemstock_name`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_descr` varchar(2500)   AFTER `itemstock_nameshort`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30) NOT NULL  AFTER `itemstock_descr`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `unit_id` varchar(10) NOT NULL  AFTER `dept_id`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `brand_id` varchar(14)   AFTER `unit_id`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `unitmeasurement_id` varchar(10) NOT NULL  AFTER `brand_id`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_couchdbid` varchar(255)   AFTER `unitmeasurement_id`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_picture` varchar(90)   AFTER `itemstock_couchdbid`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_source` varchar(30) NOT NULL  AFTER `itemstock_picture`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_source`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_ishascompound` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_isdisabled`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_issellable` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_ishascompound`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_priceori` decimal(16, 0) NOT NULL DEFAULT 0 AFTER `itemstock_issellable`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_priceadj` decimal(16, 0)   AFTER `itemstock_priceori`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_priceadjdate` datetime   AFTER `itemstock_priceadj`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_grossprice` decimal(16, 0)   AFTER `itemstock_priceadjdate`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_isdiscvalue` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_grossprice`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_disc` decimal(5, 2) NOT NULL DEFAULT 0 AFTER `itemstock_isdiscvalue`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_discval` decimal(16, 0) NOT NULL DEFAULT 0 AFTER `itemstock_disc`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_sellprice` decimal(16, 0)   AFTER `itemstock_discval`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_estcost` decimal(12, 0)   AFTER `itemstock_sellprice`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_weight` decimal(8, 2) NOT NULL DEFAULT 0 AFTER `itemstock_estcost`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_length` decimal(8, 2) NOT NULL DEFAULT 0 AFTER `itemstock_weight`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_width` decimal(8, 2) NOT NULL DEFAULT 0 AFTER `itemstock_length`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_height` decimal(8, 2) NOT NULL DEFAULT 0 AFTER `itemstock_width`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_lastqty` decimal(14, 2)   AFTER `itemstock_height`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_lastvalue` decimal(16, 2)   AFTER `itemstock_lastqty`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_lastqtyupdate` datetime   AFTER `itemstock_lastvalue`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_isupdating` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_lastqtyupdate`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_updatebatch` varchar(30)   AFTER `itemstock_isupdating`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_lastrecvid` varchar(90)   AFTER `itemstock_updatebatch`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_lastrecvdate` date   AFTER `itemstock_lastrecvid`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_lastrecvqty` decimal(14, 2)   AFTER `itemstock_lastrecvdate`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_lastcost` decimal(14, 2)   AFTER `itemstock_lastrecvqty`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_lastcostdate` date   AFTER `itemstock_lastcost`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_ref` varchar(90)   AFTER `itemstock_lastcostdate`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_refname` varchar(200)   AFTER `itemstock_ref`;
ALTER TABLE `mst_itemstock` ADD COLUMN IF NOT EXISTS  `itemstock_uploadbatchcode` varchar(32)   AFTER `itemstock_refname`;


ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemgroup_id` varchar(15) NOT NULL   AFTER `itemstock_id`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemclass_id` varchar(14) NOT NULL   AFTER `itemgroup_id`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_code` varchar(150) NOT NULL   AFTER `itemclass_id`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_name` varchar(150) NOT NULL   AFTER `itemstock_code`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_nameshort` varchar(150) NOT NULL   AFTER `itemstock_name`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_descr` varchar(2500)    AFTER `itemstock_nameshort`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30) NOT NULL   AFTER `itemstock_descr`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `unit_id` varchar(10) NOT NULL   AFTER `dept_id`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `brand_id` varchar(14)    AFTER `unit_id`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `unitmeasurement_id` varchar(10) NOT NULL   AFTER `brand_id`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_couchdbid` varchar(255)    AFTER `unitmeasurement_id`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_picture` varchar(90)    AFTER `itemstock_couchdbid`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_source` varchar(30) NOT NULL   AFTER `itemstock_picture`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_source`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_ishascompound` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_isdisabled`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_issellable` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_ishascompound`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_priceori` decimal(16, 0) NOT NULL DEFAULT 0  AFTER `itemstock_issellable`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_priceadj` decimal(16, 0)    AFTER `itemstock_priceori`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_priceadjdate` datetime    AFTER `itemstock_priceadj`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_grossprice` decimal(16, 0)    AFTER `itemstock_priceadjdate`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_isdiscvalue` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_grossprice`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_disc` decimal(5, 2) NOT NULL DEFAULT 0  AFTER `itemstock_isdiscvalue`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_discval` decimal(16, 0) NOT NULL DEFAULT 0  AFTER `itemstock_disc`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_sellprice` decimal(16, 0)    AFTER `itemstock_discval`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_estcost` decimal(12, 0)    AFTER `itemstock_sellprice`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_weight` decimal(8, 2) NOT NULL DEFAULT 0  AFTER `itemstock_estcost`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_length` decimal(8, 2) NOT NULL DEFAULT 0  AFTER `itemstock_weight`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_width` decimal(8, 2) NOT NULL DEFAULT 0  AFTER `itemstock_length`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_height` decimal(8, 2) NOT NULL DEFAULT 0  AFTER `itemstock_width`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_lastqty` decimal(14, 2)    AFTER `itemstock_height`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_lastvalue` decimal(16, 2)    AFTER `itemstock_lastqty`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_lastqtyupdate` datetime    AFTER `itemstock_lastvalue`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_isupdating` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_lastqtyupdate`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_updatebatch` varchar(30)    AFTER `itemstock_isupdating`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_lastrecvid` varchar(90)    AFTER `itemstock_updatebatch`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_lastrecvdate` date    AFTER `itemstock_lastrecvid`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_lastrecvqty` decimal(14, 2)    AFTER `itemstock_lastrecvdate`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_lastcost` decimal(14, 2)    AFTER `itemstock_lastrecvqty`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_lastcostdate` date    AFTER `itemstock_lastcost`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_ref` varchar(90)    AFTER `itemstock_lastcostdate`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_refname` varchar(200)    AFTER `itemstock_ref`;
ALTER TABLE `mst_itemstock` MODIFY COLUMN IF EXISTS  `itemstock_uploadbatchcode` varchar(32)    AFTER `itemstock_refname`;


ALTER TABLE `mst_itemstock` ADD CONSTRAINT `itemstock_code` UNIQUE IF NOT EXISTS  (`dept_id`, `itemstock_code`);

ALTER TABLE `mst_itemstock` ADD KEY IF NOT EXISTS `itemgroup_id` (`itemgroup_id`);
ALTER TABLE `mst_itemstock` ADD KEY IF NOT EXISTS `itemclass_id` (`itemclass_id`);
ALTER TABLE `mst_itemstock` ADD KEY IF NOT EXISTS `dept_id` (`dept_id`);
ALTER TABLE `mst_itemstock` ADD KEY IF NOT EXISTS `unit_id` (`unit_id`);
ALTER TABLE `mst_itemstock` ADD KEY IF NOT EXISTS `brand_id` (`brand_id`);
ALTER TABLE `mst_itemstock` ADD KEY IF NOT EXISTS `unitmeasurement_id` (`unitmeasurement_id`);

ALTER TABLE `mst_itemstock` ADD CONSTRAINT `fk_mst_itemstock_mst_itemgroup` FOREIGN KEY IF NOT EXISTS  (`itemgroup_id`) REFERENCES `mst_itemgroup` (`itemgroup_id`);
ALTER TABLE `mst_itemstock` ADD CONSTRAINT `fk_mst_itemstock_mst_itemclass` FOREIGN KEY IF NOT EXISTS  (`itemclass_id`) REFERENCES `mst_itemclass` (`itemclass_id`);
ALTER TABLE `mst_itemstock` ADD CONSTRAINT `fk_mst_itemstock_mst_dept` FOREIGN KEY IF NOT EXISTS  (`dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_itemstock` ADD CONSTRAINT `fk_mst_itemstock_mst_unit` FOREIGN KEY IF NOT EXISTS  (`unit_id`) REFERENCES `mst_unit` (`unit_id`);
ALTER TABLE `mst_itemstock` ADD CONSTRAINT `fk_mst_itemstock_mst_brand` FOREIGN KEY IF NOT EXISTS  (`brand_id`) REFERENCES `mst_brand` (`brand_id`);
ALTER TABLE `mst_itemstock` ADD CONSTRAINT `fk_mst_itemstock_mst_unitmeasurement` FOREIGN KEY IF NOT EXISTS  (`unitmeasurement_id`) REFERENCES `mst_unitmeasurement` (`unitmeasurement_id`);





CREATE TABLE IF NOT EXISTS `mst_itemstockcompound` (
	`itemstockcompound_id` varchar(14) NOT NULL , 
	`itemstock_compound` varchar(14)  , 
	`itemstockcompound_value` decimal(14, 2) NOT NULL DEFAULT 0, 
	`unitmeasurement_id` varchar(10)  , 
	`itemstock_ismode1` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_ismode2` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_ismode3` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_ismode4` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_ismode5` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_ismode6` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_ismode7` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstock_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemstockcompound_id`)
) 
ENGINE=InnoDB
COMMENT='Stock Setting';


ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_compound` varchar(14)   AFTER `itemstockcompound_id`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstockcompound_value` decimal(14, 2) NOT NULL DEFAULT 0 AFTER `itemstock_compound`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `unitmeasurement_id` varchar(10)   AFTER `itemstockcompound_value`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_ismode1` tinyint(1) NOT NULL DEFAULT 0 AFTER `unitmeasurement_id`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_ismode2` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_ismode1`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_ismode3` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_ismode2`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_ismode4` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_ismode3`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_ismode5` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_ismode4`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_ismode6` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_ismode5`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_ismode7` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemstock_ismode6`;
ALTER TABLE `mst_itemstockcompound` ADD COLUMN IF NOT EXISTS  `itemstock_id` varchar(14) NOT NULL  AFTER `itemstock_ismode7`;


ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_compound` varchar(14)    AFTER `itemstockcompound_id`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstockcompound_value` decimal(14, 2) NOT NULL DEFAULT 0  AFTER `itemstock_compound`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `unitmeasurement_id` varchar(10)    AFTER `itemstockcompound_value`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_ismode1` tinyint(1) NOT NULL DEFAULT 0  AFTER `unitmeasurement_id`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_ismode2` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_ismode1`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_ismode3` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_ismode2`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_ismode4` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_ismode3`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_ismode5` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_ismode4`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_ismode6` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_ismode5`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_ismode7` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemstock_ismode6`;
ALTER TABLE `mst_itemstockcompound` MODIFY COLUMN IF EXISTS  `itemstock_id` varchar(14) NOT NULL   AFTER `itemstock_ismode7`;



ALTER TABLE `mst_itemstockcompound` ADD KEY IF NOT EXISTS `itemstock_compound` (`itemstock_compound`);
ALTER TABLE `mst_itemstockcompound` ADD KEY IF NOT EXISTS `unitmeasurement_id` (`unitmeasurement_id`);
ALTER TABLE `mst_itemstockcompound` ADD KEY IF NOT EXISTS `itemstock_id` (`itemstock_id`);

ALTER TABLE `mst_itemstockcompound` ADD CONSTRAINT `fk_mst_itemstockcompound_mst_itemstock` FOREIGN KEY IF NOT EXISTS  (`itemstock_compound`) REFERENCES `mst_itemstock` (`itemstock_id`);
ALTER TABLE `mst_itemstockcompound` ADD CONSTRAINT `fk_mst_itemstockcompound_mst_unitmeasurement` FOREIGN KEY IF NOT EXISTS  (`unitmeasurement_id`) REFERENCES `mst_unitmeasurement` (`unitmeasurement_id`);
ALTER TABLE `mst_itemstockcompound` ADD CONSTRAINT `fk_mst_itemstockcompound_mst_itemstock` FOREIGN KEY IF NOT EXISTS (`itemstock_id`) REFERENCES `mst_itemstock` (`itemstock_id`);





CREATE TABLE IF NOT EXISTS `mst_itemstockconversion` (
	`itemstockconversion_id` varchar(14) NOT NULL , 
	`itemstockconversion_order` int(4)  DEFAULT 0, 
	`unitmeasurement_id` varchar(10)  , 
	`itemstock_conversion` varchar(14)  , 
	`itemstockconversion_value` decimal(14, 2) NOT NULL DEFAULT 0, 
	`itemstock_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemstockconversion_id`)
) 
ENGINE=InnoDB
COMMENT='Stock Setting';


ALTER TABLE `mst_itemstockconversion` ADD COLUMN IF NOT EXISTS  `itemstockconversion_order` int(4)  DEFAULT 0 AFTER `itemstockconversion_id`;
ALTER TABLE `mst_itemstockconversion` ADD COLUMN IF NOT EXISTS  `unitmeasurement_id` varchar(10)   AFTER `itemstockconversion_order`;
ALTER TABLE `mst_itemstockconversion` ADD COLUMN IF NOT EXISTS  `itemstock_conversion` varchar(14)   AFTER `unitmeasurement_id`;
ALTER TABLE `mst_itemstockconversion` ADD COLUMN IF NOT EXISTS  `itemstockconversion_value` decimal(14, 2) NOT NULL DEFAULT 0 AFTER `itemstock_conversion`;
ALTER TABLE `mst_itemstockconversion` ADD COLUMN IF NOT EXISTS  `itemstock_id` varchar(14) NOT NULL  AFTER `itemstockconversion_value`;


ALTER TABLE `mst_itemstockconversion` MODIFY COLUMN IF EXISTS  `itemstockconversion_order` int(4)  DEFAULT 0  AFTER `itemstockconversion_id`;
ALTER TABLE `mst_itemstockconversion` MODIFY COLUMN IF EXISTS  `unitmeasurement_id` varchar(10)    AFTER `itemstockconversion_order`;
ALTER TABLE `mst_itemstockconversion` MODIFY COLUMN IF EXISTS  `itemstock_conversion` varchar(14)    AFTER `unitmeasurement_id`;
ALTER TABLE `mst_itemstockconversion` MODIFY COLUMN IF EXISTS  `itemstockconversion_value` decimal(14, 2) NOT NULL DEFAULT 0  AFTER `itemstock_conversion`;
ALTER TABLE `mst_itemstockconversion` MODIFY COLUMN IF EXISTS  `itemstock_id` varchar(14) NOT NULL   AFTER `itemstockconversion_value`;



ALTER TABLE `mst_itemstockconversion` ADD KEY IF NOT EXISTS `unitmeasurement_id` (`unitmeasurement_id`);
ALTER TABLE `mst_itemstockconversion` ADD KEY IF NOT EXISTS `itemstock_conversion` (`itemstock_conversion`);
ALTER TABLE `mst_itemstockconversion` ADD KEY IF NOT EXISTS `itemstock_id` (`itemstock_id`);

ALTER TABLE `mst_itemstockconversion` ADD CONSTRAINT `fk_mst_itemstockconversion_mst_unitmeasurement` FOREIGN KEY IF NOT EXISTS  (`unitmeasurement_id`) REFERENCES `mst_unitmeasurement` (`unitmeasurement_id`);
ALTER TABLE `mst_itemstockconversion` ADD CONSTRAINT `fk_mst_itemstockconversion_mst_itemstock` FOREIGN KEY IF NOT EXISTS  (`itemstock_conversion`) REFERENCES `mst_itemstock` (`itemstock_id`);
ALTER TABLE `mst_itemstockconversion` ADD CONSTRAINT `fk_mst_itemstockconversion_mst_itemstock` FOREIGN KEY IF NOT EXISTS (`itemstock_id`) REFERENCES `mst_itemstock` (`itemstock_id`);





CREATE TABLE IF NOT EXISTS `mst_itemstockprop` (
	`itemstockprop_id` varchar(14) NOT NULL , 
	`itemproptype_id` varchar(20) NOT NULL , 
	`itemstockprop_keys` varchar(90) NOT NULL , 
	`itemstockprop_value` varchar(255) NOT NULL , 
	`itemstock_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemstockprop_keys` (`itemstock_id`, `itemproptype_id`, `itemstockprop_keys`),
	PRIMARY KEY (`itemstockprop_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Properties Item';


ALTER TABLE `mst_itemstockprop` ADD COLUMN IF NOT EXISTS  `itemproptype_id` varchar(20) NOT NULL  AFTER `itemstockprop_id`;
ALTER TABLE `mst_itemstockprop` ADD COLUMN IF NOT EXISTS  `itemstockprop_keys` varchar(90) NOT NULL  AFTER `itemproptype_id`;
ALTER TABLE `mst_itemstockprop` ADD COLUMN IF NOT EXISTS  `itemstockprop_value` varchar(255) NOT NULL  AFTER `itemstockprop_keys`;
ALTER TABLE `mst_itemstockprop` ADD COLUMN IF NOT EXISTS  `itemstock_id` varchar(14) NOT NULL  AFTER `itemstockprop_value`;


ALTER TABLE `mst_itemstockprop` MODIFY COLUMN IF EXISTS  `itemproptype_id` varchar(20) NOT NULL   AFTER `itemstockprop_id`;
ALTER TABLE `mst_itemstockprop` MODIFY COLUMN IF EXISTS  `itemstockprop_keys` varchar(90) NOT NULL   AFTER `itemproptype_id`;
ALTER TABLE `mst_itemstockprop` MODIFY COLUMN IF EXISTS  `itemstockprop_value` varchar(255) NOT NULL   AFTER `itemstockprop_keys`;
ALTER TABLE `mst_itemstockprop` MODIFY COLUMN IF EXISTS  `itemstock_id` varchar(14) NOT NULL   AFTER `itemstockprop_value`;


ALTER TABLE `mst_itemstockprop` ADD CONSTRAINT `itemstockprop_keys` UNIQUE IF NOT EXISTS  (`itemstock_id`, `itemproptype_id`, `itemstockprop_keys`);

ALTER TABLE `mst_itemstockprop` ADD KEY IF NOT EXISTS `itemproptype_id` (`itemproptype_id`);
ALTER TABLE `mst_itemstockprop` ADD KEY IF NOT EXISTS `itemstock_id` (`itemstock_id`);

ALTER TABLE `mst_itemstockprop` ADD CONSTRAINT `fk_mst_itemstockprop_mst_itemproptype` FOREIGN KEY IF NOT EXISTS  (`itemproptype_id`) REFERENCES `mst_itemproptype` (`itemproptype_id`);
ALTER TABLE `mst_itemstockprop` ADD CONSTRAINT `fk_mst_itemstockprop_mst_itemstock` FOREIGN KEY IF NOT EXISTS (`itemstock_id`) REFERENCES `mst_itemstock` (`itemstock_id`);





CREATE TABLE IF NOT EXISTS `mst_itemstockbarcode` (
	`itemstockbarcode_id` varchar(14) NOT NULL , 
	`itemstockbarcode_text` varchar(26)  , 
	`brand_id` varchar(10)  , 
	`itemstock_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemstockbarcode_brand` (`brand_id`, `itemstockbarcode_text`),
	PRIMARY KEY (`itemstockbarcode_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar barcode itemstock';


ALTER TABLE `mst_itemstockbarcode` ADD COLUMN IF NOT EXISTS  `itemstockbarcode_text` varchar(26)   AFTER `itemstockbarcode_id`;
ALTER TABLE `mst_itemstockbarcode` ADD COLUMN IF NOT EXISTS  `brand_id` varchar(10)   AFTER `itemstockbarcode_text`;
ALTER TABLE `mst_itemstockbarcode` ADD COLUMN IF NOT EXISTS  `itemstock_id` varchar(14) NOT NULL  AFTER `brand_id`;


ALTER TABLE `mst_itemstockbarcode` MODIFY COLUMN IF EXISTS  `itemstockbarcode_text` varchar(26)    AFTER `itemstockbarcode_id`;
ALTER TABLE `mst_itemstockbarcode` MODIFY COLUMN IF EXISTS  `brand_id` varchar(10)    AFTER `itemstockbarcode_text`;
ALTER TABLE `mst_itemstockbarcode` MODIFY COLUMN IF EXISTS  `itemstock_id` varchar(14) NOT NULL   AFTER `brand_id`;


ALTER TABLE `mst_itemstockbarcode` ADD CONSTRAINT `itemstockbarcode_brand` UNIQUE IF NOT EXISTS  (`brand_id`, `itemstockbarcode_text`);

ALTER TABLE `mst_itemstockbarcode` ADD KEY IF NOT EXISTS  `brand_id` (`brand_id`);
ALTER TABLE `mst_itemstockbarcode` ADD KEY IF NOT EXISTS `itemstock_id` (`itemstock_id`);

ALTER TABLE `mst_itemstockbarcode` ADD CONSTRAINT `fk_mst_itemstockbarcode_mst_brand` FOREIGN KEY IF NOT EXISTS (`brand_id`) REFERENCES `mst_brand` (`brand_id`);
ALTER TABLE `mst_itemstockbarcode` ADD CONSTRAINT `fk_mst_itemstockbarcode_mst_itemstock` FOREIGN KEY IF NOT EXISTS (`itemstock_id`) REFERENCES `mst_itemstock` (`itemstock_id`);





