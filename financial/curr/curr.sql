-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_curr`;
-- drop table if exists `mst_currrate`;
-- drop table if exists `mst_currref`;


CREATE TABLE IF NOT EXISTS `mst_curr` (
	`curr_id` varchar(10) NOT NULL , 
	`curr_name` varchar(60) NOT NULL , 
	`curr_descr` varchar(90) NOT NULL , 
	`curr_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `curr_name` (`curr_name`),
	PRIMARY KEY (`curr_id`)
) 
ENGINE=InnoDB
COMMENT='Master Currency';


ALTER TABLE `mst_curr` ADD COLUMN IF NOT EXISTS  `curr_name` varchar(60) NOT NULL  AFTER `curr_id`;
ALTER TABLE `mst_curr` ADD COLUMN IF NOT EXISTS  `curr_descr` varchar(90) NOT NULL  AFTER `curr_name`;
ALTER TABLE `mst_curr` ADD COLUMN IF NOT EXISTS  `curr_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `curr_descr`;


ALTER TABLE `mst_curr` MODIFY COLUMN IF EXISTS  `curr_name` varchar(60) NOT NULL   AFTER `curr_id`;
ALTER TABLE `mst_curr` MODIFY COLUMN IF EXISTS  `curr_descr` varchar(90) NOT NULL   AFTER `curr_name`;
ALTER TABLE `mst_curr` MODIFY COLUMN IF EXISTS  `curr_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `curr_descr`;


ALTER TABLE `mst_curr` ADD CONSTRAINT `curr_name` UNIQUE IF NOT EXISTS  (`curr_name`);







CREATE TABLE IF NOT EXISTS `mst_currrate` (
	`currrate_id` varchar(14) NOT NULL , 
	`currrate_date` date NOT NULL , 
	`currrate_value` decimal(6, 0) NOT NULL DEFAULT 0, 
	`curr_id` varchar(10) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `currrate_date` (`curr_id`, `currrate_date`),
	PRIMARY KEY (`currrate_id`)
) 
ENGINE=InnoDB
COMMENT='Rate Currency historical';


ALTER TABLE `mst_currrate` ADD COLUMN IF NOT EXISTS  `currrate_date` date NOT NULL  AFTER `currrate_id`;
ALTER TABLE `mst_currrate` ADD COLUMN IF NOT EXISTS  `currrate_value` decimal(6, 0) NOT NULL DEFAULT 0 AFTER `currrate_date`;
ALTER TABLE `mst_currrate` ADD COLUMN IF NOT EXISTS  `curr_id` varchar(10) NOT NULL  AFTER `currrate_value`;


ALTER TABLE `mst_currrate` MODIFY COLUMN IF EXISTS  `currrate_date` date NOT NULL   AFTER `currrate_id`;
ALTER TABLE `mst_currrate` MODIFY COLUMN IF EXISTS  `currrate_value` decimal(6, 0) NOT NULL DEFAULT 0  AFTER `currrate_date`;
ALTER TABLE `mst_currrate` MODIFY COLUMN IF EXISTS  `curr_id` varchar(10) NOT NULL   AFTER `currrate_value`;


ALTER TABLE `mst_currrate` ADD CONSTRAINT `currrate_date` UNIQUE IF NOT EXISTS  (`curr_id`, `currrate_date`);

ALTER TABLE `mst_currrate` ADD KEY IF NOT EXISTS `curr_id` (`curr_id`);

ALTER TABLE `mst_currrate` ADD CONSTRAINT `fk_mst_currrate_mst_curr` FOREIGN KEY IF NOT EXISTS (`curr_id`) REFERENCES `mst_curr` (`curr_id`);





CREATE TABLE IF NOT EXISTS `mst_currref` (
	`currref_id` varchar(14) NOT NULL , 
	`interface_id` varchar(7) NOT NULL , 
	`currref_name` varchar(30) NOT NULL , 
	`currref_code` varchar(30) NOT NULL , 
	`currref_otherdata` varchar(1000)  , 
	`currref_notes` varchar(255)  , 
	`curr_id` varchar(10) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `currref_pair` (`interface_id`, `currref_name`, `currref_code`),
	PRIMARY KEY (`currref_id`)
) 
ENGINE=InnoDB
COMMENT='Kode referensi currency untuk keperluan interfacing dengan system lain';


ALTER TABLE `mst_currref` ADD COLUMN IF NOT EXISTS  `interface_id` varchar(7) NOT NULL  AFTER `currref_id`;
ALTER TABLE `mst_currref` ADD COLUMN IF NOT EXISTS  `currref_name` varchar(30) NOT NULL  AFTER `interface_id`;
ALTER TABLE `mst_currref` ADD COLUMN IF NOT EXISTS  `currref_code` varchar(30) NOT NULL  AFTER `currref_name`;
ALTER TABLE `mst_currref` ADD COLUMN IF NOT EXISTS  `currref_otherdata` varchar(1000)   AFTER `currref_code`;
ALTER TABLE `mst_currref` ADD COLUMN IF NOT EXISTS  `currref_notes` varchar(255)   AFTER `currref_otherdata`;
ALTER TABLE `mst_currref` ADD COLUMN IF NOT EXISTS  `curr_id` varchar(10) NOT NULL  AFTER `currref_notes`;


ALTER TABLE `mst_currref` MODIFY COLUMN IF EXISTS  `interface_id` varchar(7) NOT NULL   AFTER `currref_id`;
ALTER TABLE `mst_currref` MODIFY COLUMN IF EXISTS  `currref_name` varchar(30) NOT NULL   AFTER `interface_id`;
ALTER TABLE `mst_currref` MODIFY COLUMN IF EXISTS  `currref_code` varchar(30) NOT NULL   AFTER `currref_name`;
ALTER TABLE `mst_currref` MODIFY COLUMN IF EXISTS  `currref_otherdata` varchar(1000)    AFTER `currref_code`;
ALTER TABLE `mst_currref` MODIFY COLUMN IF EXISTS  `currref_notes` varchar(255)    AFTER `currref_otherdata`;
ALTER TABLE `mst_currref` MODIFY COLUMN IF EXISTS  `curr_id` varchar(10) NOT NULL   AFTER `currref_notes`;


ALTER TABLE `mst_currref` ADD CONSTRAINT `currref_pair` UNIQUE IF NOT EXISTS  (`interface_id`, `currref_name`, `currref_code`);

ALTER TABLE `mst_currref` ADD KEY IF NOT EXISTS `interface_id` (`interface_id`);
ALTER TABLE `mst_currref` ADD KEY IF NOT EXISTS `curr_id` (`curr_id`);

ALTER TABLE `mst_currref` ADD CONSTRAINT `fk_mst_currref_mst_interface` FOREIGN KEY IF NOT EXISTS  (`interface_id`) REFERENCES `mst_interface` (`interface_id`);
ALTER TABLE `mst_currref` ADD CONSTRAINT `fk_mst_currref_mst_curr` FOREIGN KEY IF NOT EXISTS (`curr_id`) REFERENCES `mst_curr` (`curr_id`);





