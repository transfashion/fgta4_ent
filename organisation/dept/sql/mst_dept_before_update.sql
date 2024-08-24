DROP TRIGGER IF EXISTS mst_dept_before_update;

DELIMITER //


CREATE TRIGGER `mst_dept_before_update` BEFORE UPDATE ON `mst_dept` FOR EACH ROW BEGIN

	
	DECLARE PATHID VARCHAR(30);
	DECLARE CHILDCOUNT INT;
	DECLARE PARENT_PATHID VARCHAR(30);
	DECLARE PARENT_PATH VARCHAR(390);


	SET PATHID = OLD.dept_pathid;
	SET NEW.dept_id = OLD.dept_id;
	SET NEW.dept_pathid = OLD.dept_pathid;

	IF NEW.dept_parent=NEW.dept_id THEN
		SIGNAL SQLSTATE '45000' SET 
		MESSAGE_TEXT = 'Kode parent tidak boleh sama dengan kode group';
	END IF;
	

	if (@dept_skip_trigger is null or @dept_skip_trigger<=0) then

		IF NEW.dept_parent='--NULL--' THEN
	    	SET NEW.dept_parent = NULL;
	    END IF;
	
	
		SELECT COUNT(*) 
		INTO CHILDCOUNT
		FROM mst_dept WHERE dept_parent = NEW.dept_id;
		IF NEW.dept_parent<>OLD.dept_parent AND CHILDCOUNT>0 THEN
			SIGNAL SQLSTATE '45000' SET 
			MESSAGE_TEXT = 'Group yang punya anggota tidak bisa diubah parentnya';	
		END IF;
	
	
		IF NEW.dept_parent IS NULL THEN
			SET NEW.dept_path = NEW.dept_pathid;
			SET NEW.dept_level =1;
		ELSE
			SELECT dept_pathid, dept_path 
			INTO PARENT_PATHID, PARENT_PATH
			FROM mst_dept WHERE dept_id = NEW.dept_parent;	
				
			SET NEW.dept_path = CONCAT(PARENT_PATH, PATHID);
			SET NEW.dept_level = (LENGTH(NEW.dept_path) / 30);
		
		END IF;

	end if;

END //


DELIMITER ;