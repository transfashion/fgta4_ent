-- SET FOREIGN_KEY_CHECKS=0;

-- drop table if exists `mst_dept`;


CREATE TABLE IF NOT EXISTS `mst_dept` (
	`dept_id` varchar(30) NOT NULL , 
	`dept_name` varchar(60) NOT NULL , 
	`dept_descr` varchar(90)  , 
	`dept_isdisabled` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_isparent` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_isassetowner` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_isassetmaintainer` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_isstockowner` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_isnonitemowner` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_ispartnerselect` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_isbudgetmandatory` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_issingleprojectbudget` tinyint(1) NOT NULL DEFAULT 0, 
	`dept_pathid` varchar(30) NOT NULL , 
	`dept_path` varchar(390) NOT NULL , 
	`dept_level` int(2) NOT NULL DEFAULT 0, 
	`dept_parent` varchar(30)  , 
	`unit_id` varchar(10) NOT NULL , 
	`depttype_id` varchar(10) NOT NULL , 
	`deptmodel_id` varchar(10) NOT NULL , 
	`auth_id` varchar(30) NOT NULL , 
	`_createby` varchar(14) NOT NULL , 
	`_createdate` datetime NOT NULL DEFAULT current_timestamp(), 
	`_modifyby` varchar(14)  , 
	`_modifydate` datetime  , 
	UNIQUE KEY `dept_name` (`dept_name`),
	PRIMARY KEY (`dept_id`)
) 
ENGINE=InnoDB
COMMENT='Daftar Departement';


ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_name` varchar(60) NOT NULL  AFTER `dept_id`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_descr` varchar(90)   AFTER `dept_name`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_isdisabled` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_descr`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_isparent` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_isdisabled`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_isassetowner` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_isparent`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_isassetmaintainer` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_isassetowner`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_isstockowner` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_isassetmaintainer`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_isnonitemowner` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_isstockowner`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_ispartnerselect` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_isnonitemowner`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_isbudgetmandatory` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_ispartnerselect`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_issingleprojectbudget` tinyint(1) NOT NULL DEFAULT 0 AFTER `dept_isbudgetmandatory`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_pathid` varchar(30) NOT NULL  AFTER `dept_issingleprojectbudget`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_path` varchar(390) NOT NULL  AFTER `dept_pathid`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_level` int(2) NOT NULL DEFAULT 0 AFTER `dept_path`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `dept_parent` varchar(30)   AFTER `dept_level`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `unit_id` varchar(10) NOT NULL  AFTER `dept_parent`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `depttype_id` varchar(10) NOT NULL  AFTER `unit_id`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `deptmodel_id` varchar(10) NOT NULL  AFTER `depttype_id`;
ALTER TABLE `mst_dept` ADD COLUMN IF NOT EXISTS  `auth_id` varchar(30) NOT NULL  AFTER `deptmodel_id`;


ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_name` varchar(60) NOT NULL   AFTER `dept_id`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_descr` varchar(90)    AFTER `dept_name`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_isdisabled` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_descr`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_isparent` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_isdisabled`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_isassetowner` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_isparent`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_isassetmaintainer` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_isassetowner`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_isstockowner` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_isassetmaintainer`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_isnonitemowner` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_isstockowner`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_ispartnerselect` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_isnonitemowner`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_isbudgetmandatory` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_ispartnerselect`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_issingleprojectbudget` tinyint(1) NOT NULL DEFAULT 0  AFTER `dept_isbudgetmandatory`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_pathid` varchar(30) NOT NULL   AFTER `dept_issingleprojectbudget`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_path` varchar(390) NOT NULL   AFTER `dept_pathid`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_level` int(2) NOT NULL DEFAULT 0  AFTER `dept_path`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `dept_parent` varchar(30)    AFTER `dept_level`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `unit_id` varchar(10) NOT NULL   AFTER `dept_parent`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `depttype_id` varchar(10) NOT NULL   AFTER `unit_id`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `deptmodel_id` varchar(10) NOT NULL   AFTER `depttype_id`;
ALTER TABLE `mst_dept` MODIFY COLUMN IF EXISTS  `auth_id` varchar(30) NOT NULL   AFTER `deptmodel_id`;


ALTER TABLE `mst_dept` ADD CONSTRAINT `dept_name` UNIQUE IF NOT EXISTS  (`dept_name`);

ALTER TABLE `mst_dept` ADD KEY IF NOT EXISTS `dept_parent` (`dept_parent`);
ALTER TABLE `mst_dept` ADD KEY IF NOT EXISTS `unit_id` (`unit_id`);
ALTER TABLE `mst_dept` ADD KEY IF NOT EXISTS `depttype_id` (`depttype_id`);
ALTER TABLE `mst_dept` ADD KEY IF NOT EXISTS `deptmodel_id` (`deptmodel_id`);
ALTER TABLE `mst_dept` ADD KEY IF NOT EXISTS `auth_id` (`auth_id`);

ALTER TABLE `mst_dept` ADD CONSTRAINT `fk_mst_dept_mst_dept` FOREIGN KEY IF NOT EXISTS  (`dept_parent`) REFERENCES `mst_dept` (`dept_id`);
ALTER TABLE `mst_dept` ADD CONSTRAINT `fk_mst_dept_mst_unit` FOREIGN KEY IF NOT EXISTS  (`unit_id`) REFERENCES `mst_unit` (`unit_id`);
ALTER TABLE `mst_dept` ADD CONSTRAINT `fk_mst_dept_mst_depttype` FOREIGN KEY IF NOT EXISTS  (`depttype_id`) REFERENCES `mst_depttype` (`depttype_id`);
ALTER TABLE `mst_dept` ADD CONSTRAINT `fk_mst_dept_mst_deptmodel` FOREIGN KEY IF NOT EXISTS  (`deptmodel_id`) REFERENCES `mst_deptmodel` (`deptmodel_id`);
ALTER TABLE `mst_dept` ADD CONSTRAINT `fk_mst_dept_mst_auth` FOREIGN KEY IF NOT EXISTS  (`auth_id`) REFERENCES `mst_auth` (`auth_id`);





