-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_bankrekening`;


CREATE TABLE IF NOT EXISTS `mst_bankrekening` (
	`bankrekening_id` varchar(20) NOT NULL , 
	`bankrekening_name` varchar(90) NOT NULL , 
	`bankrekening_code` varchar(30) NOT NULL , 
	`bankrekening_namabuku` varchar(30) NOT NULL , 
	`bankrekening_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`bankrekening_opendate` date NOT NULL , 
	`bankrekening_closedate` date  , 
	`bankrekening_descr` varchar(255)  , 
	`bank_id` varchar(14)  , 
	`coa_id` varchar(17) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `bankrekening_name` (`bankrekening_name`),
	UNIQUE KEY `bankrekening_code` (`bankrekening_code`),
	PRIMARY KEY (`bankrekening_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Rekening Bank';


ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `bankrekening_name` varchar(90) NOT NULL  AFTER `bankrekening_id`;
ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `bankrekening_code` varchar(30) NOT NULL  AFTER `bankrekening_name`;
ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `bankrekening_namabuku` varchar(30) NOT NULL  AFTER `bankrekening_code`;
ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `bankrekening_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `bankrekening_namabuku`;
ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `bankrekening_opendate` date NOT NULL  AFTER `bankrekening_isdisabled`;
ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `bankrekening_closedate` date   AFTER `bankrekening_opendate`;
ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `bankrekening_descr` varchar(255)   AFTER `bankrekening_closedate`;
ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `bank_id` varchar(14)   AFTER `bankrekening_descr`;
ALTER TABLE `mst_bankrekening` ADD COLUMN IF NOT EXISTS  `coa_id` varchar(17) NOT NULL  AFTER `bank_id`;


ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `bankrekening_name` varchar(90) NOT NULL   AFTER `bankrekening_id`;
ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `bankrekening_code` varchar(30) NOT NULL   AFTER `bankrekening_name`;
ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `bankrekening_namabuku` varchar(30) NOT NULL   AFTER `bankrekening_code`;
ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `bankrekening_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `bankrekening_namabuku`;
ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `bankrekening_opendate` date NOT NULL   AFTER `bankrekening_isdisabled`;
ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `bankrekening_closedate` date    AFTER `bankrekening_opendate`;
ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `bankrekening_descr` varchar(255)    AFTER `bankrekening_closedate`;
ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `bank_id` varchar(14)    AFTER `bankrekening_descr`;
ALTER TABLE `mst_bankrekening` MODIFY COLUMN IF EXISTS  `coa_id` varchar(17) NOT NULL   AFTER `bank_id`;


ALTER TABLE `mst_bankrekening` ADD CONSTRAINT `bankrekening_name` UNIQUE IF NOT EXISTS  (`bankrekening_name`);
ALTER TABLE `mst_bankrekening` ADD CONSTRAINT `bankrekening_code` UNIQUE IF NOT EXISTS  (`bankrekening_code`);

ALTER TABLE `mst_bankrekening` ADD KEY IF NOT EXISTS `bank_id` (`bank_id`);
ALTER TABLE `mst_bankrekening` ADD KEY IF NOT EXISTS `coa_id` (`coa_id`);

ALTER TABLE `mst_bankrekening` ADD CONSTRAINT `fk_mst_bankrekening_mst_bank` FOREIGN KEY IF NOT EXISTS  (`bank_id`) REFERENCES `mst_bank` (`bank_id`);
ALTER TABLE `mst_bankrekening` ADD CONSTRAINT `fk_mst_bankrekening_mst_coa` FOREIGN KEY IF NOT EXISTS  (`coa_id`) REFERENCES `mst_coa` (`coa_id`);





