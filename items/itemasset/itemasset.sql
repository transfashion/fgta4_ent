-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_itemasset`;
-- drop table if exists `mst_itemassetspec`;
-- drop table if exists `trn_inquiryfiles`;
-- drop table if exists `mst_itemassetdepre`;
-- drop table if exists `mst_itemassetbooking`;
-- drop table if exists `log_itemassetmoving`;
-- drop table if exists `log_itemassetmaintenace`;
-- drop table if exists `log_itemassetfail`;


CREATE TABLE IF NOT EXISTS `mst_itemasset` (
	`itemasset_id` varchar(14) NOT NULL , 
	`itemasset_name` varchar(150) NOT NULL , 
	`itemasset_serial` varchar(30)  , 
	`item_id` varchar(14)  , 
	`itemassetstatus_id` varchar(2) NOT NULL , 
	`itemasset_statusnote` varchar(255)  , 
	`itemasset_ischeckout` tinyint(1) NOT NULL DEFAULT 0, 
	`itemasset_ismoveable` tinyint(1) NOT NULL DEFAULT 0, 
	`itemasset_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`itemasset_iswrittenof` tinyint(1) NOT NULL DEFAULT 0, 
	`itemasset_descr` varchar(255)  , 
	`itemasset_merk` varchar(255)  , 
	`itemasset_type` varchar(255)  , 
	`itemclass_id` varchar(14)  , 
	`itemasset_baselocation` varchar(255)  , 
	`site_id` varchar(30)  , 
	`owner_dept_id` varchar(30)  , 
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


ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_name` varchar(150) NOT NULL  AFTER `itemasset_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_serial` varchar(30)   AFTER `itemasset_name`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `item_id` varchar(14)   AFTER `itemasset_serial`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemassetstatus_id` varchar(2) NOT NULL  AFTER `item_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_statusnote` varchar(255)   AFTER `itemassetstatus_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_ischeckout` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemasset_statusnote`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_ismoveable` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemasset_ischeckout`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemasset_ismoveable`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_iswrittenof` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemasset_isdisabled`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_descr` varchar(255)   AFTER `itemasset_iswrittenof`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_merk` varchar(255)   AFTER `itemasset_descr`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_type` varchar(255)   AFTER `itemasset_merk`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemclass_id` varchar(14)   AFTER `itemasset_type`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `itemasset_baselocation` varchar(255)   AFTER `itemclass_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `site_id` varchar(30)   AFTER `itemasset_baselocation`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `owner_dept_id` varchar(30)   AFTER `site_id`;
ALTER TABLE `mst_itemasset` ADD COLUMN IF NOT EXISTS  `maintainer_dept_id` varchar(30)   AFTER `owner_dept_id`;
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


ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_name` varchar(150) NOT NULL   AFTER `itemasset_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_serial` varchar(30)    AFTER `itemasset_name`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `item_id` varchar(14)    AFTER `itemasset_serial`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemassetstatus_id` varchar(2) NOT NULL   AFTER `item_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_statusnote` varchar(255)    AFTER `itemassetstatus_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_ischeckout` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemasset_statusnote`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_ismoveable` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemasset_ischeckout`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemasset_ismoveable`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_iswrittenof` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemasset_isdisabled`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_descr` varchar(255)    AFTER `itemasset_iswrittenof`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_merk` varchar(255)    AFTER `itemasset_descr`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_type` varchar(255)    AFTER `itemasset_merk`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemclass_id` varchar(14)    AFTER `itemasset_type`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `itemasset_baselocation` varchar(255)    AFTER `itemclass_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `site_id` varchar(30)    AFTER `itemasset_baselocation`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `owner_dept_id` varchar(30)    AFTER `site_id`;
ALTER TABLE `mst_itemasset` MODIFY COLUMN IF EXISTS  `maintainer_dept_id` varchar(30)    AFTER `owner_dept_id`;
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

ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `item_id` (`item_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `itemassetstatus_id` (`itemassetstatus_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `itemclass_id` (`itemclass_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `site_id` (`site_id`);
ALTER TABLE `mst_itemasset` ADD KEY IF NOT EXISTS `owner_dept_id` (`owner_dept_id`);
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

ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_item` FOREIGN KEY IF NOT EXISTS  (`item_id`) REFERENCES `mst_item` (`item_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_itemassetstatus` FOREIGN KEY IF NOT EXISTS  (`itemassetstatus_id`) REFERENCES `mst_itemassetstatus` (`itemassetstatus_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_itemclass` FOREIGN KEY IF NOT EXISTS  (`itemclass_id`) REFERENCES `mst_itemclass` (`itemclass_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_site` FOREIGN KEY IF NOT EXISTS  (`site_id`) REFERENCES `mst_site` (`site_id`);
ALTER TABLE `mst_itemasset` ADD CONSTRAINT `fk_mst_itemasset_mst_dept` FOREIGN KEY IF NOT EXISTS  (`owner_dept_id`) REFERENCES `mst_dept` (`dept_id`);
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





CREATE TABLE IF NOT EXISTS `mst_itemassetspec` (
	`itemassetspec_id` varchar(14) NOT NULL , 
	`itemassetspec_value` varchar(90) NOT NULL , 
	`itemspec_id` varchar(10) NOT NULL , 
	`itemspec_isnumber` tinyint(1) NOT NULL DEFAULT 0, 
	`itemasset_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemassetspec_id`)
) 
ENGINE=InnoDB
COMMENT='Spesifikasi item asset';


ALTER TABLE `mst_itemassetspec` ADD COLUMN IF NOT EXISTS  `itemassetspec_value` varchar(90) NOT NULL  AFTER `itemassetspec_id`;
ALTER TABLE `mst_itemassetspec` ADD COLUMN IF NOT EXISTS  `itemspec_id` varchar(10) NOT NULL  AFTER `itemassetspec_value`;
ALTER TABLE `mst_itemassetspec` ADD COLUMN IF NOT EXISTS  `itemspec_isnumber` tinyint(1) NOT NULL DEFAULT 0 AFTER `itemspec_id`;
ALTER TABLE `mst_itemassetspec` ADD COLUMN IF NOT EXISTS  `itemasset_id` varchar(14) NOT NULL  AFTER `itemspec_isnumber`;


ALTER TABLE `mst_itemassetspec` MODIFY COLUMN IF EXISTS  `itemassetspec_value` varchar(90) NOT NULL   AFTER `itemassetspec_id`;
ALTER TABLE `mst_itemassetspec` MODIFY COLUMN IF EXISTS  `itemspec_id` varchar(10) NOT NULL   AFTER `itemassetspec_value`;
ALTER TABLE `mst_itemassetspec` MODIFY COLUMN IF EXISTS  `itemspec_isnumber` tinyint(1) NOT NULL DEFAULT 0  AFTER `itemspec_id`;
ALTER TABLE `mst_itemassetspec` MODIFY COLUMN IF EXISTS  `itemasset_id` varchar(14) NOT NULL   AFTER `itemspec_isnumber`;



ALTER TABLE `mst_itemassetspec` ADD KEY IF NOT EXISTS `itemspec_id` (`itemspec_id`);
ALTER TABLE `mst_itemassetspec` ADD KEY IF NOT EXISTS `itemasset_id` (`itemasset_id`);

ALTER TABLE `mst_itemassetspec` ADD CONSTRAINT `fk_mst_itemassetspec_mst_itemspec` FOREIGN KEY IF NOT EXISTS  (`itemspec_id`) REFERENCES `mst_itemspec` (`itemspec_id`);
ALTER TABLE `mst_itemassetspec` ADD CONSTRAINT `fk_mst_itemassetspec_mst_itemasset` FOREIGN KEY IF NOT EXISTS (`itemasset_id`) REFERENCES `mst_itemasset` (`itemasset_id`);





CREATE TABLE IF NOT EXISTS `trn_inquiryfiles` (
	`inquiryfiles_id` varchar(14) NOT NULL , 
	`doctype_id` varchar(10) NOT NULL , 
	`inquiryfiles_descr` varchar(90) NOT NULL , 
	`inquiryfiles_order` int(4) NOT NULL DEFAULT 0, 
	`inquiryfiles_file` varchar(90)  , 
	`inquiry_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `inquiryfiles_doc` (`inquiry_id`, `doctype_id`),
	PRIMARY KEY (`inquiryfiles_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar FIle Inquiry';


ALTER TABLE `trn_inquiryfiles` ADD COLUMN IF NOT EXISTS  `doctype_id` varchar(10) NOT NULL  AFTER `inquiryfiles_id`;
ALTER TABLE `trn_inquiryfiles` ADD COLUMN IF NOT EXISTS  `inquiryfiles_descr` varchar(90) NOT NULL  AFTER `doctype_id`;
ALTER TABLE `trn_inquiryfiles` ADD COLUMN IF NOT EXISTS  `inquiryfiles_order` int(4) NOT NULL DEFAULT 0 AFTER `inquiryfiles_descr`;
ALTER TABLE `trn_inquiryfiles` ADD COLUMN IF NOT EXISTS  `inquiryfiles_file` varchar(90)   AFTER `inquiryfiles_order`;
ALTER TABLE `trn_inquiryfiles` ADD COLUMN IF NOT EXISTS  `inquiry_id` varchar(14) NOT NULL  AFTER `inquiryfiles_file`;


ALTER TABLE `trn_inquiryfiles` MODIFY COLUMN IF EXISTS  `doctype_id` varchar(10) NOT NULL   AFTER `inquiryfiles_id`;
ALTER TABLE `trn_inquiryfiles` MODIFY COLUMN IF EXISTS  `inquiryfiles_descr` varchar(90) NOT NULL   AFTER `doctype_id`;
ALTER TABLE `trn_inquiryfiles` MODIFY COLUMN IF EXISTS  `inquiryfiles_order` int(4) NOT NULL DEFAULT 0  AFTER `inquiryfiles_descr`;
ALTER TABLE `trn_inquiryfiles` MODIFY COLUMN IF EXISTS  `inquiryfiles_file` varchar(90)    AFTER `inquiryfiles_order`;
ALTER TABLE `trn_inquiryfiles` MODIFY COLUMN IF EXISTS  `inquiry_id` varchar(14) NOT NULL   AFTER `inquiryfiles_file`;


ALTER TABLE `trn_inquiryfiles` ADD CONSTRAINT `inquiryfiles_doc` UNIQUE IF NOT EXISTS  (`inquiry_id`, `doctype_id`);

ALTER TABLE `trn_inquiryfiles` ADD KEY IF NOT EXISTS `doctype_id` (`doctype_id`);

ALTER TABLE `trn_inquiryfiles` ADD CONSTRAINT `fk_trn_inquiryfiles_mst_doctype` FOREIGN KEY IF NOT EXISTS  (`doctype_id`) REFERENCES `mst_doctype` (`doctype_id`);





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





CREATE TABLE IF NOT EXISTS `mst_itemassetbooking` (
	`itemassetbooking_id` varchar(14) NOT NULL , 
	`itemassetbooking_date` date NOT NULL , 
	`assetbooking_id` varchar(14)  , 
	`itemasset_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemassetbooking_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Booking';


ALTER TABLE `mst_itemassetbooking` ADD COLUMN IF NOT EXISTS  `itemassetbooking_date` date NOT NULL  AFTER `itemassetbooking_id`;
ALTER TABLE `mst_itemassetbooking` ADD COLUMN IF NOT EXISTS  `assetbooking_id` varchar(14)   AFTER `itemassetbooking_date`;
ALTER TABLE `mst_itemassetbooking` ADD COLUMN IF NOT EXISTS  `itemasset_id` varchar(14) NOT NULL  AFTER `assetbooking_id`;


ALTER TABLE `mst_itemassetbooking` MODIFY COLUMN IF EXISTS  `itemassetbooking_date` date NOT NULL   AFTER `itemassetbooking_id`;
ALTER TABLE `mst_itemassetbooking` MODIFY COLUMN IF EXISTS  `assetbooking_id` varchar(14)    AFTER `itemassetbooking_date`;
ALTER TABLE `mst_itemassetbooking` MODIFY COLUMN IF EXISTS  `itemasset_id` varchar(14) NOT NULL   AFTER `assetbooking_id`;



ALTER TABLE `mst_itemassetbooking` ADD KEY IF NOT EXISTS `itemasset_id` (`itemasset_id`);

ALTER TABLE `mst_itemassetbooking` ADD CONSTRAINT `fk_mst_itemassetbooking_mst_itemasset` FOREIGN KEY IF NOT EXISTS (`itemasset_id`) REFERENCES `mst_itemasset` (`itemasset_id`);





CREATE TABLE IF NOT EXISTS `log_itemassetmoving` (
	`itemassetmoving_id` varchar(14) NOT NULL , 
	`itemassetmoving_date` date NOT NULL , 
	`itemassetmoving_ref` varchar(30)  , 
	`itemassetmoving_typename` varchar(150)  , 
	`dept_name` varchar(150)  , 
	`site_name` varchar(150)  , 
	`empl_name` varchar(150)  , 
	`itemasset_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemassetmoving_id`)
) 
ENGINE=InnoDB
COMMENT='Log Moving Item Asset';


ALTER TABLE `log_itemassetmoving` ADD COLUMN IF NOT EXISTS  `itemassetmoving_date` date NOT NULL  AFTER `itemassetmoving_id`;
ALTER TABLE `log_itemassetmoving` ADD COLUMN IF NOT EXISTS  `itemassetmoving_ref` varchar(30)   AFTER `itemassetmoving_date`;
ALTER TABLE `log_itemassetmoving` ADD COLUMN IF NOT EXISTS  `itemassetmoving_typename` varchar(150)   AFTER `itemassetmoving_ref`;
ALTER TABLE `log_itemassetmoving` ADD COLUMN IF NOT EXISTS  `dept_name` varchar(150)   AFTER `itemassetmoving_typename`;
ALTER TABLE `log_itemassetmoving` ADD COLUMN IF NOT EXISTS  `site_name` varchar(150)   AFTER `dept_name`;
ALTER TABLE `log_itemassetmoving` ADD COLUMN IF NOT EXISTS  `empl_name` varchar(150)   AFTER `site_name`;
ALTER TABLE `log_itemassetmoving` ADD COLUMN IF NOT EXISTS  `itemasset_id` varchar(14) NOT NULL  AFTER `empl_name`;


ALTER TABLE `log_itemassetmoving` MODIFY COLUMN IF EXISTS  `itemassetmoving_date` date NOT NULL   AFTER `itemassetmoving_id`;
ALTER TABLE `log_itemassetmoving` MODIFY COLUMN IF EXISTS  `itemassetmoving_ref` varchar(30)    AFTER `itemassetmoving_date`;
ALTER TABLE `log_itemassetmoving` MODIFY COLUMN IF EXISTS  `itemassetmoving_typename` varchar(150)    AFTER `itemassetmoving_ref`;
ALTER TABLE `log_itemassetmoving` MODIFY COLUMN IF EXISTS  `dept_name` varchar(150)    AFTER `itemassetmoving_typename`;
ALTER TABLE `log_itemassetmoving` MODIFY COLUMN IF EXISTS  `site_name` varchar(150)    AFTER `dept_name`;
ALTER TABLE `log_itemassetmoving` MODIFY COLUMN IF EXISTS  `empl_name` varchar(150)    AFTER `site_name`;
ALTER TABLE `log_itemassetmoving` MODIFY COLUMN IF EXISTS  `itemasset_id` varchar(14) NOT NULL   AFTER `empl_name`;



ALTER TABLE `log_itemassetmoving` ADD KEY IF NOT EXISTS `itemasset_id` (`itemasset_id`);

ALTER TABLE `log_itemassetmoving` ADD CONSTRAINT `fk_log_itemassetmoving_mst_itemasset` FOREIGN KEY IF NOT EXISTS (`itemasset_id`) REFERENCES `mst_itemasset` (`itemasset_id`);





CREATE TABLE IF NOT EXISTS `log_itemassetmaintenace` (
	`itemassetmaintenace_id` varchar(14) NOT NULL , 
	`itemassetmaintenace_date` date NOT NULL , 
	`itemassetmaintenace_ref` varchar(30)  , 
	`itemassetmaintenace_typename` varchar(150)  , 
	`itemassetmaintenace_status` varchar(150)  , 
	`partner_name` varchar(150)  , 
	`itemasset_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemassetmaintenace_id`)
) 
ENGINE=InnoDB
COMMENT='Log Maintenance Item Asset';


ALTER TABLE `log_itemassetmaintenace` ADD COLUMN IF NOT EXISTS  `itemassetmaintenace_date` date NOT NULL  AFTER `itemassetmaintenace_id`;
ALTER TABLE `log_itemassetmaintenace` ADD COLUMN IF NOT EXISTS  `itemassetmaintenace_ref` varchar(30)   AFTER `itemassetmaintenace_date`;
ALTER TABLE `log_itemassetmaintenace` ADD COLUMN IF NOT EXISTS  `itemassetmaintenace_typename` varchar(150)   AFTER `itemassetmaintenace_ref`;
ALTER TABLE `log_itemassetmaintenace` ADD COLUMN IF NOT EXISTS  `itemassetmaintenace_status` varchar(150)   AFTER `itemassetmaintenace_typename`;
ALTER TABLE `log_itemassetmaintenace` ADD COLUMN IF NOT EXISTS  `partner_name` varchar(150)   AFTER `itemassetmaintenace_status`;
ALTER TABLE `log_itemassetmaintenace` ADD COLUMN IF NOT EXISTS  `itemasset_id` varchar(14) NOT NULL  AFTER `partner_name`;


ALTER TABLE `log_itemassetmaintenace` MODIFY COLUMN IF EXISTS  `itemassetmaintenace_date` date NOT NULL   AFTER `itemassetmaintenace_id`;
ALTER TABLE `log_itemassetmaintenace` MODIFY COLUMN IF EXISTS  `itemassetmaintenace_ref` varchar(30)    AFTER `itemassetmaintenace_date`;
ALTER TABLE `log_itemassetmaintenace` MODIFY COLUMN IF EXISTS  `itemassetmaintenace_typename` varchar(150)    AFTER `itemassetmaintenace_ref`;
ALTER TABLE `log_itemassetmaintenace` MODIFY COLUMN IF EXISTS  `itemassetmaintenace_status` varchar(150)    AFTER `itemassetmaintenace_typename`;
ALTER TABLE `log_itemassetmaintenace` MODIFY COLUMN IF EXISTS  `partner_name` varchar(150)    AFTER `itemassetmaintenace_status`;
ALTER TABLE `log_itemassetmaintenace` MODIFY COLUMN IF EXISTS  `itemasset_id` varchar(14) NOT NULL   AFTER `partner_name`;



ALTER TABLE `log_itemassetmaintenace` ADD KEY IF NOT EXISTS `itemasset_id` (`itemasset_id`);

ALTER TABLE `log_itemassetmaintenace` ADD CONSTRAINT `fk_log_itemassetmaintenace_mst_itemasset` FOREIGN KEY IF NOT EXISTS (`itemasset_id`) REFERENCES `mst_itemasset` (`itemasset_id`);





CREATE TABLE IF NOT EXISTS `log_itemassetfail` (
	`itemassetfail_id` varchar(14) NOT NULL , 
	`itemassetfail_date` date NOT NULL , 
	`itemassetfail_ref` varchar(30)  , 
	`itemassetfail_descr` varchar(150)  , 
	`empl_name` varchar(150)  , 
	`itemasset_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	PRIMARY KEY (`itemassetfail_id`)
) 
ENGINE=InnoDB
COMMENT='Log Failure Item Asset';


ALTER TABLE `log_itemassetfail` ADD COLUMN IF NOT EXISTS  `itemassetfail_date` date NOT NULL  AFTER `itemassetfail_id`;
ALTER TABLE `log_itemassetfail` ADD COLUMN IF NOT EXISTS  `itemassetfail_ref` varchar(30)   AFTER `itemassetfail_date`;
ALTER TABLE `log_itemassetfail` ADD COLUMN IF NOT EXISTS  `itemassetfail_descr` varchar(150)   AFTER `itemassetfail_ref`;
ALTER TABLE `log_itemassetfail` ADD COLUMN IF NOT EXISTS  `empl_name` varchar(150)   AFTER `itemassetfail_descr`;
ALTER TABLE `log_itemassetfail` ADD COLUMN IF NOT EXISTS  `itemasset_id` varchar(14) NOT NULL  AFTER `empl_name`;


ALTER TABLE `log_itemassetfail` MODIFY COLUMN IF EXISTS  `itemassetfail_date` date NOT NULL   AFTER `itemassetfail_id`;
ALTER TABLE `log_itemassetfail` MODIFY COLUMN IF EXISTS  `itemassetfail_ref` varchar(30)    AFTER `itemassetfail_date`;
ALTER TABLE `log_itemassetfail` MODIFY COLUMN IF EXISTS  `itemassetfail_descr` varchar(150)    AFTER `itemassetfail_ref`;
ALTER TABLE `log_itemassetfail` MODIFY COLUMN IF EXISTS  `empl_name` varchar(150)    AFTER `itemassetfail_descr`;
ALTER TABLE `log_itemassetfail` MODIFY COLUMN IF EXISTS  `itemasset_id` varchar(14) NOT NULL   AFTER `empl_name`;



ALTER TABLE `log_itemassetfail` ADD KEY IF NOT EXISTS `itemasset_id` (`itemasset_id`);

ALTER TABLE `log_itemassetfail` ADD CONSTRAINT `fk_log_itemassetfail_mst_itemasset` FOREIGN KEY IF NOT EXISTS (`itemasset_id`) REFERENCES `mst_itemasset` (`itemasset_id`);





