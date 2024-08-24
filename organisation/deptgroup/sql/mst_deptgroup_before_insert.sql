DROP TRIGGER IF EXISTS mst_deptgroup_before_insert;

DELIMITER //


CREATE TRIGGER `mst_deptgroup_before_insert` BEFORE INSERT ON `mst_deptgroup` FOR EACH ROW BEGIN

	DECLARE PATHID VARCHAR(17);
	DECLARE PARENT_PATHID VARCHAR(17);
	DECLARE PARENT_PATH VARCHAR(390);

	IF NEW.deptgroup_parent=NEW.deptgroup_id THEN
		SIGNAL SQLSTATE '45000' SET 
		MESSAGE_TEXT = 'Kode parent tidak boleh sama dengan kode group';
	END IF;


	if (@deptgroup_skip_trigger is null or @deptgroup_skip_trigger<=0) then
	
		SET NEW.deptgroup_pathid = NEW.deptgroup_id;
	
		SET PATHID = RPAD(NEW.deptgroup_pathid, 17, '-');
		SET NEW.deptgroup_pathid = PATHID;
	
		IF NEW.deptgroup_parent IS NULL THEN
			SET NEW.deptgroup_path = PATHID;
			SET NEW.deptgroup_level = 1;
		ELSE
			SELECT deptgroup_pathid, deptgroup_path 
			INTO PARENT_PATHID, PARENT_PATH
			FROM mst_deptgroup WHERE deptgroup_id = NEW.deptgroup_parent;	
				
			SET NEW.deptgroup_path = CONCAT(PARENT_PATH, PATHID);
			SET NEW.deptgroup_level = (LENGTH(NEW.deptgroup_path) / 17);
		
		END IF;

	end if;

END //

DELIMITER ;
