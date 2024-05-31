-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_bank`;


CREATE TABLE IF NOT EXISTS `mst_bank` (
	`bank_id` varchar(14) NOT NULL , 
	`bank_name` varchar(60) NOT NULL , 
	`bank_code` varchar(30)  , 
	`country_id` varchar(10) NOT NULL , 
	`bank_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `bank_name` (`bank_name`),
	PRIMARY KEY (`bank_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Brand';


ALTER TABLE `mst_bank` ADD COLUMN IF NOT EXISTS  `bank_name` varchar(60) NOT NULL  AFTER `bank_id`;
ALTER TABLE `mst_bank` ADD COLUMN IF NOT EXISTS  `bank_code` varchar(30)   AFTER `bank_name`;
ALTER TABLE `mst_bank` ADD COLUMN IF NOT EXISTS  `country_id` varchar(10) NOT NULL  AFTER `bank_code`;
ALTER TABLE `mst_bank` ADD COLUMN IF NOT EXISTS  `bank_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `country_id`;


ALTER TABLE `mst_bank` MODIFY COLUMN IF EXISTS  `bank_name` varchar(60) NOT NULL  AFTER `bank_id`;
ALTER TABLE `mst_bank` MODIFY COLUMN IF EXISTS  `bank_code` varchar(30)   AFTER `bank_name`;
ALTER TABLE `mst_bank` MODIFY COLUMN IF EXISTS  `country_id` varchar(10) NOT NULL  AFTER `bank_code`;
ALTER TABLE `mst_bank` MODIFY COLUMN IF EXISTS  `bank_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `country_id`;


ALTER TABLE `mst_bank` ADD CONSTRAINT `bank_name` UNIQUE IF NOT EXISTS  (`bank_name`);

ALTER TABLE `mst_bank` ADD KEY IF NOT EXISTS `country_id` (`country_id`);

ALTER TABLE `mst_bank` ADD CONSTRAINT `fk_mst_bank_mst_country` FOREIGN KEY IF NOT EXISTS  (`country_id`) REFERENCES `mst_country` (`country_id`);





