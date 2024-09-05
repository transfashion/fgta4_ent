-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_unit`;
-- drop table if exists `mst_unitref`;


CREATE TABLE IF NOT EXISTS `mst_unit` (
	`unit_id` varchar(10) NOT NULL , 
	`unitgroup_id` varchar(10) NOT NULL , 
	`unit_name` varchar(60) NOT NULL , 
	`unit_descr` varchar(90)  , 
	`unit_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `unit_name` (`unit_name`),
	PRIMARY KEY (`unit_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Unit';


ALTER TABLE `mst_unit` ADD COLUMN IF NOT EXISTS  `unitgroup_id` varchar(10) NOT NULL  AFTER `unit_id`;
ALTER TABLE `mst_unit` ADD COLUMN IF NOT EXISTS  `unit_name` varchar(60) NOT NULL  AFTER `unitgroup_id`;
ALTER TABLE `mst_unit` ADD COLUMN IF NOT EXISTS  `unit_descr` varchar(90)   AFTER `unit_name`;
ALTER TABLE `mst_unit` ADD COLUMN IF NOT EXISTS  `unit_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `unit_descr`;


ALTER TABLE `mst_unit` MODIFY COLUMN IF EXISTS  `unitgroup_id` varchar(10) NOT NULL   AFTER `unit_id`;
ALTER TABLE `mst_unit` MODIFY COLUMN IF EXISTS  `unit_name` varchar(60) NOT NULL   AFTER `unitgroup_id`;
ALTER TABLE `mst_unit` MODIFY COLUMN IF EXISTS  `unit_descr` varchar(90)    AFTER `unit_name`;
ALTER TABLE `mst_unit` MODIFY COLUMN IF EXISTS  `unit_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `unit_descr`;


ALTER TABLE `mst_unit` ADD CONSTRAINT `unit_name` UNIQUE IF NOT EXISTS  (`unit_name`);

ALTER TABLE `mst_unit` ADD KEY IF NOT EXISTS `unitgroup_id` (`unitgroup_id`);

ALTER TABLE `mst_unit` ADD CONSTRAINT `fk_mst_unit_mst_unitgroup` FOREIGN KEY IF NOT EXISTS  (`unitgroup_id`) REFERENCES `mst_unitgroup` (`unitgroup_id`);





CREATE TABLE IF NOT EXISTS `mst_unitref` (
	`unitref_id` varchar(14) NOT NULL , 
	`interface_id` varchar(7) NOT NULL , 
	`unitref_name` varchar(30) NOT NULL , 
	`unitref_code` varchar(30) NOT NULL , 
	`unitref_otherdata` varchar(1000)  , 
	`unitref_notes` varchar(255)  , 
	`unit_id` varchar(10) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `unitref_pair` (`unit_id`, `interface_id`),
	PRIMARY KEY (`unitref_id`)
) 
ENGINE=InnoDB
COMMENT='Kode referensi unit untuk keperluan interfacing dengan system lain';


ALTER TABLE `mst_unitref` ADD COLUMN IF NOT EXISTS  `interface_id` varchar(7) NOT NULL  AFTER `unitref_id`;
ALTER TABLE `mst_unitref` ADD COLUMN IF NOT EXISTS  `unitref_name` varchar(30) NOT NULL  AFTER `interface_id`;
ALTER TABLE `mst_unitref` ADD COLUMN IF NOT EXISTS  `unitref_code` varchar(30) NOT NULL  AFTER `unitref_name`;
ALTER TABLE `mst_unitref` ADD COLUMN IF NOT EXISTS  `unitref_otherdata` varchar(1000)   AFTER `unitref_code`;
ALTER TABLE `mst_unitref` ADD COLUMN IF NOT EXISTS  `unitref_notes` varchar(255)   AFTER `unitref_otherdata`;
ALTER TABLE `mst_unitref` ADD COLUMN IF NOT EXISTS  `unit_id` varchar(10) NOT NULL  AFTER `unitref_notes`;


ALTER TABLE `mst_unitref` MODIFY COLUMN IF EXISTS  `interface_id` varchar(7) NOT NULL   AFTER `unitref_id`;
ALTER TABLE `mst_unitref` MODIFY COLUMN IF EXISTS  `unitref_name` varchar(30) NOT NULL   AFTER `interface_id`;
ALTER TABLE `mst_unitref` MODIFY COLUMN IF EXISTS  `unitref_code` varchar(30) NOT NULL   AFTER `unitref_name`;
ALTER TABLE `mst_unitref` MODIFY COLUMN IF EXISTS  `unitref_otherdata` varchar(1000)    AFTER `unitref_code`;
ALTER TABLE `mst_unitref` MODIFY COLUMN IF EXISTS  `unitref_notes` varchar(255)    AFTER `unitref_otherdata`;
ALTER TABLE `mst_unitref` MODIFY COLUMN IF EXISTS  `unit_id` varchar(10) NOT NULL   AFTER `unitref_notes`;


ALTER TABLE `mst_unitref` ADD CONSTRAINT `unitref_pair` UNIQUE IF NOT EXISTS  (`unit_id`, `interface_id`);

ALTER TABLE `mst_unitref` ADD KEY IF NOT EXISTS `interface_id` (`interface_id`);
ALTER TABLE `mst_unitref` ADD KEY IF NOT EXISTS `unit_id` (`unit_id`);

ALTER TABLE `mst_unitref` ADD CONSTRAINT `fk_mst_unitref_mst_interface` FOREIGN KEY IF NOT EXISTS  (`interface_id`) REFERENCES `mst_interface` (`interface_id`);
ALTER TABLE `mst_unitref` ADD CONSTRAINT `fk_mst_unitref_mst_unit` FOREIGN KEY IF NOT EXISTS (`unit_id`) REFERENCES `mst_unit` (`unit_id`);





