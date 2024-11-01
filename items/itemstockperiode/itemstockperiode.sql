-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_itemstockperiode`;
-- drop table if exists `mst_itemstockcost`;
-- drop table if exists `mst_itemstocksaldo`;


CREATE TABLE IF NOT EXISTS `mst_itemstockperiode` (
	`itemstockperiode_id` varchar(14) NOT NULL , 
	`periodemo_id` varchar(6) NOT NULL , 
	`dept_id` varchar(30) NOT NULL , 
	`itemstockperiode_isclose` tinyint(1) NOT NULL DEFAULT 0, 
	`itemstockperiode_closeby` varchar(14)  , 
	`itemstockperiode_closedate` datetime  , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemstockperiode_pair` (`periodemo_id`, `dept_id`),
	PRIMARY KEY (`itemstockperiode_id`)
) 
ENGINE=InnoDB
COMMENT='Saldo akhir stok pada suatu dept pada akhir bulan';


ALTER TABLE `mst_itemstockperiode` ADD COLUMN IF NOT EXISTS  `periodemo_id` varchar(6) NOT NULL  AFTER `itemstockperiode_id`;
ALTER TABLE `mst_itemstockperiode` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30) NOT NULL  AFTER `periodemo_id`;
ALTER TABLE `mst_itemstockperiode` ADD COLUMN IF NOT EXISTS  `itemstockperiode_isclose` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_id`;
ALTER TABLE `mst_itemstockperiode` ADD COLUMN IF NOT EXISTS  `itemstockperiode_closeby` varchar(14)   AFTER `itemstockperiode_isclose`;
ALTER TABLE `mst_itemstockperiode` ADD COLUMN IF NOT EXISTS  `itemstockperiode_closedate` datetime   AFTER `itemstockperiode_closeby`;


ALTER TABLE `mst_itemstockperiode` MODIFY COLUMN IF EXISTS  `periodemo_id` varchar(6) NOT NULL   AFTER `itemstockperiode_id`;
ALTER TABLE `mst_itemstockperiode` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30) NOT NULL   AFTER `periodemo_id`;
ALTER TABLE `mst_itemstockperiode` MODIFY COLUMN IF EXISTS  `itemstockperiode_isclose` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_id`;
ALTER TABLE `mst_itemstockperiode` MODIFY COLUMN IF EXISTS  `itemstockperiode_closeby` varchar(14)    AFTER `itemstockperiode_isclose`;
ALTER TABLE `mst_itemstockperiode` MODIFY COLUMN IF EXISTS  `itemstockperiode_closedate` datetime    AFTER `itemstockperiode_closeby`;


ALTER TABLE `mst_itemstockperiode` ADD CONSTRAINT `itemstockperiode_pair` UNIQUE IF NOT EXISTS  (`periodemo_id`, `dept_id`);

ALTER TABLE `mst_itemstockperiode` ADD KEY IF NOT EXISTS  `periodemo_id` (`periodemo_id`);
ALTER TABLE `mst_itemstockperiode` ADD KEY IF NOT EXISTS  `dept_id` (`dept_id`);

ALTER TABLE `mst_itemstockperiode` ADD CONSTRAINT `fk_mst_itemstockperiode_mst_periodemo` FOREIGN KEY IF NOT EXISTS (`periodemo_id`) REFERENCES `mst_periodemo` (`periodemo_id`);
ALTER TABLE `mst_itemstockperiode` ADD CONSTRAINT `fk_mst_itemstockperiode_mst_dept` FOREIGN KEY IF NOT EXISTS (`dept_id`) REFERENCES `mst_dept` (`dept_id`);





CREATE TABLE IF NOT EXISTS `mst_itemstockcost` (
	`itemstockcost_id` varchar(14) NOT NULL , 
	`dept_id` varchar(30) NOT NULL , 
	`itemstock_id` varchar(14) NOT NULL , 
	`itemstockcost_valueperitem` decimal(16, 2)  , 
	`itemstockcost_saldoqty` decimal(14, 2)  , 
	`itemstockcost_saldovalue` decimal(16, 2)  , 
	`itemstockperiode_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemstockcost_pair` (`itemstockcost_id`, `dept_id`, `itemstock_id`),
	PRIMARY KEY (`itemstockcost_id`)
) 
ENGINE=InnoDB
COMMENT='Cost stok pada saat closing periode';


ALTER TABLE `mst_itemstockcost` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30) NOT NULL  AFTER `itemstockcost_id`;
ALTER TABLE `mst_itemstockcost` ADD COLUMN IF NOT EXISTS  `itemstock_id` varchar(14) NOT NULL  AFTER `dept_id`;
ALTER TABLE `mst_itemstockcost` ADD COLUMN IF NOT EXISTS  `itemstockcost_valueperitem` decimal(16, 2)   AFTER `itemstock_id`;
ALTER TABLE `mst_itemstockcost` ADD COLUMN IF NOT EXISTS  `itemstockcost_saldoqty` decimal(14, 2)   AFTER `itemstockcost_valueperitem`;
ALTER TABLE `mst_itemstockcost` ADD COLUMN IF NOT EXISTS  `itemstockcost_saldovalue` decimal(16, 2)   AFTER `itemstockcost_saldoqty`;
ALTER TABLE `mst_itemstockcost` ADD COLUMN IF NOT EXISTS  `itemstockperiode_id` varchar(14) NOT NULL  AFTER `itemstockcost_saldovalue`;


ALTER TABLE `mst_itemstockcost` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30) NOT NULL   AFTER `itemstockcost_id`;
ALTER TABLE `mst_itemstockcost` MODIFY COLUMN IF EXISTS  `itemstock_id` varchar(14) NOT NULL   AFTER `dept_id`;
ALTER TABLE `mst_itemstockcost` MODIFY COLUMN IF EXISTS  `itemstockcost_valueperitem` decimal(16, 2)    AFTER `itemstock_id`;
ALTER TABLE `mst_itemstockcost` MODIFY COLUMN IF EXISTS  `itemstockcost_saldoqty` decimal(14, 2)    AFTER `itemstockcost_valueperitem`;
ALTER TABLE `mst_itemstockcost` MODIFY COLUMN IF EXISTS  `itemstockcost_saldovalue` decimal(16, 2)    AFTER `itemstockcost_saldoqty`;
ALTER TABLE `mst_itemstockcost` MODIFY COLUMN IF EXISTS  `itemstockperiode_id` varchar(14) NOT NULL   AFTER `itemstockcost_saldovalue`;


ALTER TABLE `mst_itemstockcost` ADD CONSTRAINT `itemstockcost_pair` UNIQUE IF NOT EXISTS  (`itemstockcost_id`, `dept_id`, `itemstock_id`);

ALTER TABLE `mst_itemstockcost` ADD KEY IF NOT EXISTS  `dept_id` (`dept_id`);
ALTER TABLE `mst_itemstockcost` ADD KEY IF NOT EXISTS  `itemstock_id` (`itemstock_id`);
ALTER TABLE `mst_itemstockcost` ADD KEY IF NOT EXISTS `itemstockperiode_id` (`itemstockperiode_id`);

ALTER TABLE `mst_itemstockcost` ADD CONSTRAINT `fk_mst_itemstockcost_mst_dept` FOREIGN KEY IF NOT EXISTS (`dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_itemstockcost` ADD CONSTRAINT `fk_mst_itemstockcost_mst_itemstock` FOREIGN KEY IF NOT EXISTS (`itemstock_id`) REFERENCES `mst_itemstock` (`itemstock_id`);
ALTER TABLE `mst_itemstockcost` ADD CONSTRAINT `fk_mst_itemstockcost_mst_itemstockperiode` FOREIGN KEY IF NOT EXISTS (`itemstockperiode_id`) REFERENCES `mst_itemstockperiode` (`itemstockperiode_id`);





CREATE TABLE IF NOT EXISTS `mst_itemstocksaldo` (
	`itemstocksaldo_id` varchar(14) NOT NULL , 
	`dept_id` varchar(30) NOT NULL , 
	`site_id` varchar(30) NOT NULL , 
	`room_id` varchar(30)  , 
	`itemstockbatch_id` varchar(14)  , 
	`itemstock_id` varchar(14) NOT NULL , 
	`itemstocksaldo_valueperitem` decimal(16, 2)  , 
	`itemstocksaldo_qty` decimal(14, 2)  , 
	`itemstocksaldo_value` decimal(16, 2)  , 
	`itemstockperiode_id` varchar(14) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `itemstocksaldo_pair` (`itemstocksaldo_id`, `dept_id`, `site_id`, `room_id`, `itemstockbatch_id`, `itemstock_id`),
	PRIMARY KEY (`itemstocksaldo_id`)
) 
ENGINE=InnoDB
COMMENT='Saldo akhir stok pda site pada akhir bulan';


ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `dept_id` varchar(30) NOT NULL  AFTER `itemstocksaldo_id`;
ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `site_id` varchar(30) NOT NULL  AFTER `dept_id`;
ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `room_id` varchar(30)   AFTER `site_id`;
ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `itemstockbatch_id` varchar(14)   AFTER `room_id`;
ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `itemstock_id` varchar(14) NOT NULL  AFTER `itemstockbatch_id`;
ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `itemstocksaldo_valueperitem` decimal(16, 2)   AFTER `itemstock_id`;
ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `itemstocksaldo_qty` decimal(14, 2)   AFTER `itemstocksaldo_valueperitem`;
ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `itemstocksaldo_value` decimal(16, 2)   AFTER `itemstocksaldo_qty`;
ALTER TABLE `mst_itemstocksaldo` ADD COLUMN IF NOT EXISTS  `itemstockperiode_id` varchar(14) NOT NULL  AFTER `itemstocksaldo_value`;


ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `dept_id` varchar(30) NOT NULL   AFTER `itemstocksaldo_id`;
ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `site_id` varchar(30) NOT NULL   AFTER `dept_id`;
ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `room_id` varchar(30)    AFTER `site_id`;
ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `itemstockbatch_id` varchar(14)    AFTER `room_id`;
ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `itemstock_id` varchar(14) NOT NULL   AFTER `itemstockbatch_id`;
ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `itemstocksaldo_valueperitem` decimal(16, 2)    AFTER `itemstock_id`;
ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `itemstocksaldo_qty` decimal(14, 2)    AFTER `itemstocksaldo_valueperitem`;
ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `itemstocksaldo_value` decimal(16, 2)    AFTER `itemstocksaldo_qty`;
ALTER TABLE `mst_itemstocksaldo` MODIFY COLUMN IF EXISTS  `itemstockperiode_id` varchar(14) NOT NULL   AFTER `itemstocksaldo_value`;


ALTER TABLE `mst_itemstocksaldo` ADD CONSTRAINT `itemstocksaldo_pair` UNIQUE IF NOT EXISTS  (`itemstocksaldo_id`, `dept_id`, `site_id`, `room_id`, `itemstockbatch_id`, `itemstock_id`);

ALTER TABLE `mst_itemstocksaldo` ADD KEY IF NOT EXISTS  `dept_id` (`dept_id`);
ALTER TABLE `mst_itemstocksaldo` ADD KEY IF NOT EXISTS  `site_id` (`site_id`);
ALTER TABLE `mst_itemstocksaldo` ADD KEY IF NOT EXISTS  `room_id` (`room_id`);
ALTER TABLE `mst_itemstocksaldo` ADD KEY IF NOT EXISTS  `itemstockbatch_id` (`itemstockbatch_id`);
ALTER TABLE `mst_itemstocksaldo` ADD KEY IF NOT EXISTS  `itemstock_id` (`itemstock_id`);
ALTER TABLE `mst_itemstocksaldo` ADD KEY IF NOT EXISTS `itemstockperiode_id` (`itemstockperiode_id`);

ALTER TABLE `mst_itemstocksaldo` ADD CONSTRAINT `fk_mst_itemstocksaldo_mst_dept` FOREIGN KEY IF NOT EXISTS (`dept_id`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_itemstocksaldo` ADD CONSTRAINT `fk_mst_itemstocksaldo_mst_site` FOREIGN KEY IF NOT EXISTS (`site_id`) REFERENCES `mst_site` (`site_id`);
ALTER TABLE `mst_itemstocksaldo` ADD CONSTRAINT `fk_mst_itemstocksaldo_mst_room` FOREIGN KEY IF NOT EXISTS (`room_id`) REFERENCES `mst_room` (`room_id`);
ALTER TABLE `mst_itemstocksaldo` ADD CONSTRAINT `fk_mst_itemstocksaldo_mst_itemstockbatch` FOREIGN KEY IF NOT EXISTS (`itemstockbatch_id`) REFERENCES `mst_itemstockbatch` (`itemstockbatch_id`);
ALTER TABLE `mst_itemstocksaldo` ADD CONSTRAINT `fk_mst_itemstocksaldo_mst_itemstock` FOREIGN KEY IF NOT EXISTS (`itemstock_id`) REFERENCES `mst_itemstock` (`itemstock_id`);
ALTER TABLE `mst_itemstocksaldo` ADD CONSTRAINT `fk_mst_itemstocksaldo_mst_itemstockperiode` FOREIGN KEY IF NOT EXISTS (`itemstockperiode_id`) REFERENCES `mst_itemstockperiode` (`itemstockperiode_id`);





