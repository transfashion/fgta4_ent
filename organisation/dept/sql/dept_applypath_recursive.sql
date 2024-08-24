DROP PROCEDURE IF EXISTS dept_applypath_recursive;

DELIMITER //


CREATE  PROCEDURE dept_applypath_recursive(
	IN in_dept_id varchar(30)
)
BEGIN
	
	declare p_group_id varchar(30);
	declare EOF bool;	

	declare c_data cursor for
	select dept_id from mst_dept where dept_parent=in_dept_id;

	declare continue handler for not found
	set EOF = true;


	set p_group_id = in_dept_id;
	call dept_applypath(p_group_id);

	open c_data;
	lp: loop
		fetch c_data into p_group_id;
		if eof is true then
			leave lp;
		end if;
	
		call dept_applypath_recursive(p_group_id);
	end loop;
	close c_data;


END


DELIMITER ;