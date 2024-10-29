-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_periodemo`;
-- drop table if exists `mst_periodemoref`;


CREATE TABLE IF NOT EXISTS `mst_periodemo` (
	`periodemo_id` varchar(6) NOT NULL , 
	`periodemo_name` varchar(30) NOT NULL , 
	`periodemo_isclosed` tinyint(1) NOT NULL DEFAULT 0, 
	`periodemo_year` int(4) NOT NULL , 
	`periodemo_month` int(2) NOT NULL , 
	`periodemo_dtstart` date NOT NULL , 
	`periodemo_dtend` date NOT NULL , 
	`periodemo_prev` varchar(6) NOT NULL , 
	`periodemo_closeby` varchar(14)  , 
	`periodemo_closedate` date  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `periodemo_prev` (`periodemo_prev`),
	PRIMARY KEY (`periodemo_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Periode Bulanan';


ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_name` varchar(30) NOT NULL  AFTER `periodemo_id`;
ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_isclosed` tinyint(1) NOT NULL DEFAULT 0 AFTER `periodemo_name`;
ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_year` int(4) NOT NULL  AFTER `periodemo_isclosed`;
ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_month` int(2) NOT NULL  AFTER `periodemo_year`;
ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_dtstart` date NOT NULL  AFTER `periodemo_month`;
ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_dtend` date NOT NULL  AFTER `periodemo_dtstart`;
ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_prev` varchar(6) NOT NULL  AFTER `periodemo_dtend`;
ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_closeby` varchar(14)   AFTER `periodemo_prev`;
ALTER TABLE `mst_periodemo` ADD COLUMN IF NOT EXISTS  `periodemo_closedate` date   AFTER `periodemo_closeby`;


ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_name` varchar(30) NOT NULL   AFTER `periodemo_id`;
ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_isclosed` tinyint(1) NOT NULL DEFAULT 0  AFTER `periodemo_name`;
ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_year` int(4) NOT NULL   AFTER `periodemo_isclosed`;
ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_month` int(2) NOT NULL   AFTER `periodemo_year`;
ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_dtstart` date NOT NULL   AFTER `periodemo_month`;
ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_dtend` date NOT NULL   AFTER `periodemo_dtstart`;
ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_prev` varchar(6) NOT NULL   AFTER `periodemo_dtend`;
ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_closeby` varchar(14)    AFTER `periodemo_prev`;
ALTER TABLE `mst_periodemo` MODIFY COLUMN IF EXISTS  `periodemo_closedate` date    AFTER `periodemo_closeby`;


ALTER TABLE `mst_periodemo` ADD CONSTRAINT `periodemo_prev` UNIQUE IF NOT EXISTS  (`periodemo_prev`);

ALTER TABLE `mst_periodemo` ADD KEY IF NOT EXISTS `periodemo_prev` (`periodemo_prev`);

ALTER TABLE `mst_periodemo` ADD CONSTRAINT `fk_mst_periodemo_mst_periodemo` FOREIGN KEY IF NOT EXISTS  (`periodemo_prev`) REFERENCES `mst_periodemo` (`periodemo_id`);





CREATE TABLE IF NOT EXISTS `mst_periodemoref` (
	`periodemoref_id` varchar(14) NOT NULL , 
	`interface_id` varchar(7) NOT NULL , 
	`periodemoref_name` varchar(30) NOT NULL , 
	`periodemoref_code` varchar(30) NOT NULL , 
	`periodemoref_otherdata` varchar(1000)  , 
	`periodemoref_notes` varchar(255)  , 
	`periodemo_id` varchar(6) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `periodemoref_pair` (`interface_id`, `periodemoref_name`, `periodemoref_code`),
	PRIMARY KEY (`periodemoref_id`)
) 
ENGINE=InnoDB
COMMENT='Kode referensi periodemo untuk keperluan interfacing dengan system lain';


ALTER TABLE `mst_periodemoref` ADD COLUMN IF NOT EXISTS  `interface_id` varchar(7) NOT NULL  AFTER `periodemoref_id`;
ALTER TABLE `mst_periodemoref` ADD COLUMN IF NOT EXISTS  `periodemoref_name` varchar(30) NOT NULL  AFTER `interface_id`;
ALTER TABLE `mst_periodemoref` ADD COLUMN IF NOT EXISTS  `periodemoref_code` varchar(30) NOT NULL  AFTER `periodemoref_name`;
ALTER TABLE `mst_periodemoref` ADD COLUMN IF NOT EXISTS  `periodemoref_otherdata` varchar(1000)   AFTER `periodemoref_code`;
ALTER TABLE `mst_periodemoref` ADD COLUMN IF NOT EXISTS  `periodemoref_notes` varchar(255)   AFTER `periodemoref_otherdata`;
ALTER TABLE `mst_periodemoref` ADD COLUMN IF NOT EXISTS  `periodemo_id` varchar(6) NOT NULL  AFTER `periodemoref_notes`;


ALTER TABLE `mst_periodemoref` MODIFY COLUMN IF EXISTS  `interface_id` varchar(7) NOT NULL   AFTER `periodemoref_id`;
ALTER TABLE `mst_periodemoref` MODIFY COLUMN IF EXISTS  `periodemoref_name` varchar(30) NOT NULL   AFTER `interface_id`;
ALTER TABLE `mst_periodemoref` MODIFY COLUMN IF EXISTS  `periodemoref_code` varchar(30) NOT NULL   AFTER `periodemoref_name`;
ALTER TABLE `mst_periodemoref` MODIFY COLUMN IF EXISTS  `periodemoref_otherdata` varchar(1000)    AFTER `periodemoref_code`;
ALTER TABLE `mst_periodemoref` MODIFY COLUMN IF EXISTS  `periodemoref_notes` varchar(255)    AFTER `periodemoref_otherdata`;
ALTER TABLE `mst_periodemoref` MODIFY COLUMN IF EXISTS  `periodemo_id` varchar(6) NOT NULL   AFTER `periodemoref_notes`;


ALTER TABLE `mst_periodemoref` ADD CONSTRAINT `periodemoref_pair` UNIQUE IF NOT EXISTS  (`interface_id`, `periodemoref_name`, `periodemoref_code`);

ALTER TABLE `mst_periodemoref` ADD KEY IF NOT EXISTS `interface_id` (`interface_id`);
ALTER TABLE `mst_periodemoref` ADD KEY IF NOT EXISTS `periodemo_id` (`periodemo_id`);

ALTER TABLE `mst_periodemoref` ADD CONSTRAINT `fk_mst_periodemoref_mst_interface` FOREIGN KEY IF NOT EXISTS  (`interface_id`) REFERENCES `mst_interface` (`interface_id`);
ALTER TABLE `mst_periodemoref` ADD CONSTRAINT `fk_mst_periodemoref_mst_periodemo` FOREIGN KEY IF NOT EXISTS (`periodemo_id`) REFERENCES `mst_periodemo` (`periodemo_id`);





