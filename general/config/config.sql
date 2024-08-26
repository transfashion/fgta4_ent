-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_config`;


CREATE TABLE IF NOT EXISTS `mst_config` (
	`config_id` varchar(30) NOT NULL , 
	`config_name` varchar(30) NOT NULL , 
	`config_dir` varchar(100) NOT NULL , 
	`config_filename` varchar(100) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `config_name` (`config_name`),
	PRIMARY KEY (`config_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Config';


ALTER TABLE `mst_config` ADD COLUMN IF NOT EXISTS  `config_name` varchar(30) NOT NULL  AFTER `config_id`;
ALTER TABLE `mst_config` ADD COLUMN IF NOT EXISTS  `config_dir` varchar(100) NOT NULL  AFTER `config_name`;
ALTER TABLE `mst_config` ADD COLUMN IF NOT EXISTS  `config_filename` varchar(100) NOT NULL  AFTER `config_dir`;


ALTER TABLE `mst_config` MODIFY COLUMN IF EXISTS  `config_name` varchar(30) NOT NULL   AFTER `config_id`;
ALTER TABLE `mst_config` MODIFY COLUMN IF EXISTS  `config_dir` varchar(100) NOT NULL   AFTER `config_name`;
ALTER TABLE `mst_config` MODIFY COLUMN IF EXISTS  `config_filename` varchar(100) NOT NULL   AFTER `config_dir`;


ALTER TABLE `mst_config` ADD CONSTRAINT `config_name` UNIQUE IF NOT EXISTS  (`config_name`);




INSERT INTO mst_config (`config_id`, `config_name`, `config_dir`, `config_filename`, `_createby`, `_createdate`) VALUES ('C001', 'MARIADB', '', '', 'root', NOW());
INSERT INTO mst_config (`config_id`, `config_name`, `config_dir`, `config_filename`, `_createby`, `_createdate`) VALUES ('C002', 'SQLSERVER', '', '', 'root', NOW());
INSERT INTO mst_config (`config_id`, `config_name`, `config_dir`, `config_filename`, `_createby`, `_createdate`) VALUES ('C003', 'POSGRE', '', '', 'root', NOW());



