-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_brand`;
-- drop table if exists `mst_brandref`;


CREATE TABLE IF NOT EXISTS `mst_brand` (
	`brand_id` varchar(14) NOT NULL , 
	`brand_name` varchar(60) NOT NULL , 
	`brand_nameshort` varchar(10) NOT NULL , 
	`brand_descr` varchar(90)  , 
	`brand_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`brand_grouping01` varchar(60)  , 
	`brand_grouping02` varchar(60)  , 
	`brandtype_id` varchar(10) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `brand_name` (`brand_name`),
	UNIQUE KEY `brand_nameshort` (`brand_nameshort`),
	PRIMARY KEY (`brand_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Brand';


ALTER TABLE `mst_brand` ADD COLUMN IF NOT EXISTS  `brand_name` varchar(60) NOT NULL  AFTER `brand_id`;
ALTER TABLE `mst_brand` ADD COLUMN IF NOT EXISTS  `brand_nameshort` varchar(10) NOT NULL  AFTER `brand_name`;
ALTER TABLE `mst_brand` ADD COLUMN IF NOT EXISTS  `brand_descr` varchar(90)   AFTER `brand_nameshort`;
ALTER TABLE `mst_brand` ADD COLUMN IF NOT EXISTS  `brand_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `brand_descr`;
ALTER TABLE `mst_brand` ADD COLUMN IF NOT EXISTS  `brand_grouping01` varchar(60)   AFTER `brand_isdisabled`;
ALTER TABLE `mst_brand` ADD COLUMN IF NOT EXISTS  `brand_grouping02` varchar(60)   AFTER `brand_grouping01`;
ALTER TABLE `mst_brand` ADD COLUMN IF NOT EXISTS  `brandtype_id` varchar(10) NOT NULL  AFTER `brand_grouping02`;


ALTER TABLE `mst_brand` MODIFY COLUMN IF EXISTS  `brand_name` varchar(60) NOT NULL   AFTER `brand_id`;
ALTER TABLE `mst_brand` MODIFY COLUMN IF EXISTS  `brand_nameshort` varchar(10) NOT NULL   AFTER `brand_name`;
ALTER TABLE `mst_brand` MODIFY COLUMN IF EXISTS  `brand_descr` varchar(90)    AFTER `brand_nameshort`;
ALTER TABLE `mst_brand` MODIFY COLUMN IF EXISTS  `brand_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `brand_descr`;
ALTER TABLE `mst_brand` MODIFY COLUMN IF EXISTS  `brand_grouping01` varchar(60)    AFTER `brand_isdisabled`;
ALTER TABLE `mst_brand` MODIFY COLUMN IF EXISTS  `brand_grouping02` varchar(60)    AFTER `brand_grouping01`;
ALTER TABLE `mst_brand` MODIFY COLUMN IF EXISTS  `brandtype_id` varchar(10) NOT NULL   AFTER `brand_grouping02`;


ALTER TABLE `mst_brand` ADD CONSTRAINT `brand_name` UNIQUE IF NOT EXISTS  (`brand_name`);
ALTER TABLE `mst_brand` ADD CONSTRAINT `brand_nameshort` UNIQUE IF NOT EXISTS  (`brand_nameshort`);

ALTER TABLE `mst_brand` ADD KEY IF NOT EXISTS `brandtype_id` (`brandtype_id`);

ALTER TABLE `mst_brand` ADD CONSTRAINT `fk_mst_brand_mst_brandtype` FOREIGN KEY IF NOT EXISTS  (`brandtype_id`) REFERENCES `mst_brandtype` (`brandtype_id`);





CREATE TABLE IF NOT EXISTS `mst_brandref` (
	`brandref_id` varchar(14) NOT NULL , 
	`interface_id` varchar(7) NOT NULL , 
	`brandref_name` varchar(30) NOT NULL , 
	`brandref_code` varchar(255) NOT NULL , 
	`brandref_otherdata` varchar(1000)  , 
	`brandref_notes` varchar(255)  , 
	`brand_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `brandref_pair` (`brand_id`, `interface_id`, `brandref_name`),
	PRIMARY KEY (`brandref_id`)
) 
ENGINE=InnoDB
COMMENT='Kode referensi brand untuk keperluan interfacing dengan system lain';


ALTER TABLE `mst_brandref` ADD COLUMN IF NOT EXISTS  `interface_id` varchar(7) NOT NULL  AFTER `brandref_id`;
ALTER TABLE `mst_brandref` ADD COLUMN IF NOT EXISTS  `brandref_name` varchar(30) NOT NULL  AFTER `interface_id`;
ALTER TABLE `mst_brandref` ADD COLUMN IF NOT EXISTS  `brandref_code` varchar(255) NOT NULL  AFTER `brandref_name`;
ALTER TABLE `mst_brandref` ADD COLUMN IF NOT EXISTS  `brandref_otherdata` varchar(1000)   AFTER `brandref_code`;
ALTER TABLE `mst_brandref` ADD COLUMN IF NOT EXISTS  `brandref_notes` varchar(255)   AFTER `brandref_otherdata`;
ALTER TABLE `mst_brandref` ADD COLUMN IF NOT EXISTS  `brand_id` varchar(14) NOT NULL  AFTER `brandref_notes`;


ALTER TABLE `mst_brandref` MODIFY COLUMN IF EXISTS  `interface_id` varchar(7) NOT NULL   AFTER `brandref_id`;
ALTER TABLE `mst_brandref` MODIFY COLUMN IF EXISTS  `brandref_name` varchar(30) NOT NULL   AFTER `interface_id`;
ALTER TABLE `mst_brandref` MODIFY COLUMN IF EXISTS  `brandref_code` varchar(255) NOT NULL   AFTER `brandref_name`;
ALTER TABLE `mst_brandref` MODIFY COLUMN IF EXISTS  `brandref_otherdata` varchar(1000)    AFTER `brandref_code`;
ALTER TABLE `mst_brandref` MODIFY COLUMN IF EXISTS  `brandref_notes` varchar(255)    AFTER `brandref_otherdata`;
ALTER TABLE `mst_brandref` MODIFY COLUMN IF EXISTS  `brand_id` varchar(14) NOT NULL   AFTER `brandref_notes`;


ALTER TABLE `mst_brandref` ADD CONSTRAINT `brandref_pair` UNIQUE IF NOT EXISTS  (`brand_id`, `interface_id`, `brandref_name`);

ALTER TABLE `mst_brandref` ADD KEY IF NOT EXISTS `interface_id` (`interface_id`);
ALTER TABLE `mst_brandref` ADD KEY IF NOT EXISTS `brand_id` (`brand_id`);

ALTER TABLE `mst_brandref` ADD CONSTRAINT `fk_mst_brandref_mst_interface` FOREIGN KEY IF NOT EXISTS  (`interface_id`) REFERENCES `mst_interface` (`interface_id`);
ALTER TABLE `mst_brandref` ADD CONSTRAINT `fk_mst_brandref_mst_brand` FOREIGN KEY IF NOT EXISTS (`brand_id`) REFERENCES `mst_brand` (`brand_id`);





