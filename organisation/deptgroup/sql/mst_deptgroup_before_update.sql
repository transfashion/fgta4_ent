DROP TRIGGER IF EXISTS mst_deptgroup_before_update;

DELIMITER //

CREATE TRIGGER `mst_deptgroup_before_update` BEFORE UPDATE ON `mst_deptgroup` FOR EACH ROW BEGIN

	
	DECLARE PATHID VARCHAR(17);
	DECLARE CHILDCOUNT INT;
	DECLARE PARENT_PATHID VARCHAR(17);
	DECLARE PARENT_PATH VARCHAR(390);


	SET PATHID = OLD.deptgroup_pathid;
	SET NEW.deptgroup_id = OLD.deptgroup_id;
	SET NEW.deptgroup_pathid = OLD.deptgroup_pathid;

	IF NEW.deptgroup_parent=NEW.deptgroup_id THEN
		SIGNAL SQLSTATE '45000' SET 
		MESSAGE_TEXT = 'Kode parent tidak boleh sama dengan kode group';
	END IF;
	

	if (@deptgroup_skip_trigger is null or @deptgroup_skip_trigger<=0) then

		IF NEW.deptgroup_parent='--NULL--' THEN
	    	SET NEW.deptgroup_parent = NULL;
	    END IF;
	
	
		SELECT COUNT(*) 
		INTO CHILDCOUNT
		FROM mst_deptgroup WHERE deptgroup_parent = NEW.deptgroup_id;
		IF NEW.deptgroup_parent<>OLD.deptgroup_parent AND CHILDCOUNT>0 THEN
			SIGNAL SQLSTATE '45000' SET 
			MESSAGE_TEXT = 'Group yang punya anggota tidak bisa diubah parentnya';	
		END IF;
	
	
		IF NEW.deptgroup_parent IS NULL THEN
			SET NEW.deptgroup_path = NEW.deptgroup_pathid;
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