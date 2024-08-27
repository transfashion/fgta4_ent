-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_prov`;


CREATE TABLE IF NOT EXISTS `mst_prov` (
	`prov_id` varchar(30) NOT NULL , 
	`prov_name` varchar(60) NOT NULL , 
	`prov_capital` varchar(60) NOT NULL , 
	`country_id` varchar(30) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `prov_name` (`prov_name`),
	PRIMARY KEY (`prov_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Propinsi';


ALTER TABLE `mst_prov` ADD COLUMN IF NOT EXISTS  `prov_name` varchar(60) NOT NULL  AFTER `prov_id`;
ALTER TABLE `mst_prov` ADD COLUMN IF NOT EXISTS  `prov_capital` varchar(60) NOT NULL  AFTER `prov_name`;
ALTER TABLE `mst_prov` ADD COLUMN IF NOT EXISTS  `country_id` varchar(30) NOT NULL  AFTER `prov_capital`;


ALTER TABLE `mst_prov` MODIFY COLUMN IF EXISTS  `prov_name` varchar(60) NOT NULL   AFTER `prov_id`;
ALTER TABLE `mst_prov` MODIFY COLUMN IF EXISTS  `prov_capital` varchar(60) NOT NULL   AFTER `prov_name`;
ALTER TABLE `mst_prov` MODIFY COLUMN IF EXISTS  `country_id` varchar(30) NOT NULL   AFTER `prov_capital`;


ALTER TABLE `mst_prov` ADD CONSTRAINT `prov_name` UNIQUE IF NOT EXISTS  (`prov_name`);

ALTER TABLE `mst_prov` ADD KEY IF NOT EXISTS `country_id` (`country_id`);

ALTER TABLE `mst_prov` ADD CONSTRAINT `fk_mst_prov_mst_country` FOREIGN KEY IF NOT EXISTS  (`country_id`) REFERENCES `mst_country` (`country_id`);





