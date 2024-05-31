-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_city`;


CREATE TABLE IF NOT EXISTS `mst_city` (
	`city_id` varchar(30) NOT NULL , 
	`city_name` varchar(60) NOT NULL , 
	`city_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`prov_id` varchar(30) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `city_name` (`city_name`),
	PRIMARY KEY (`city_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar City';


ALTER TABLE `mst_city` ADD COLUMN IF NOT EXISTS  `city_name` varchar(60) NOT NULL  AFTER `city_id`;
ALTER TABLE `mst_city` ADD COLUMN IF NOT EXISTS  `city_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `city_name`;
ALTER TABLE `mst_city` ADD COLUMN IF NOT EXISTS  `prov_id` varchar(30) NOT NULL  AFTER `city_isdisabled`;


ALTER TABLE `mst_city` MODIFY COLUMN IF EXISTS  `city_name` varchar(60) NOT NULL  AFTER `city_id`;
ALTER TABLE `mst_city` MODIFY COLUMN IF EXISTS  `city_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `city_name`;
ALTER TABLE `mst_city` MODIFY COLUMN IF EXISTS  `prov_id` varchar(30) NOT NULL  AFTER `city_isdisabled`;


ALTER TABLE `mst_city` ADD CONSTRAINT `city_name` UNIQUE IF NOT EXISTS  (`city_name`);

ALTER TABLE `mst_city` ADD KEY IF NOT EXISTS `prov_id` (`prov_id`);

ALTER TABLE `mst_city` ADD CONSTRAINT `fk_mst_city_mst_prov` FOREIGN KEY IF NOT EXISTS  (`prov_id`) REFERENCES `mst_prov` (`prov_id`);


INSERT INTO mst_city (`city_id`, `city_name`, `prov_id`, `_createby`, `_createdate`) VALUES ('MDN', 'MEDAN', '02', 'root', NOW());
INSERT INTO mst_city (`city_id`, `city_name`, `prov_id`, `_createby`, `_createdate`) VALUES ('JKT', 'JAKARTA', '12', 'root', NOW());
INSERT INTO mst_city (`city_id`, `city_name`, `prov_id`, `_createby`, `_createdate`) VALUES ('BDG', 'BANDUNG', '13', 'root', NOW());
INSERT INTO mst_city (`city_id`, `city_name`, `prov_id`, `_createby`, `_createdate`) VALUES ('SBY', 'SURABAYA', '15', 'root', NOW());
INSERT INTO mst_city (`city_id`, `city_name`, `prov_id`, `_createby`, `_createdate`) VALUES ('BJM', 'BANJARMASIN', '21', 'root', NOW());
INSERT INTO mst_city (`city_id`, `city_name`, `prov_id`, `_createby`, `_createdate`) VALUES ('MDO', 'MANADO', '29', 'root', NOW());
INSERT INTO mst_city (`city_id`, `city_name`, `prov_id`, `_createby`, `_createdate`) VALUES ('MKS', 'MAKASSAR', '26', 'root', NOW());
INSERT INTO mst_city (`city_id`, `city_name`, `prov_id`, `_createby`, `_createdate`) VALUES ('BAL', 'BALI', '17', 'root', NOW());



