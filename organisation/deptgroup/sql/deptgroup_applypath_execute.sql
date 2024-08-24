DROP PROCEDURE IF EXISTS deptgroup_applypath_execute;

DELIMITER //

CREATE PROCEDURE deptgroup_applypath_execute()
BEGIN
	
	declare p_group_id varchar(17);
	declare EOF bool;	

	declare c_data cursor for
	select deptgroup_id from mst_deptgroup where deptgroup_parent is null;

	declare continue handler for not found
	set EOF = true;

	open c_data;
	lp: loop
		fetch c_data into p_group_id;
		if eof is true then
			leave lp;
		end if;
	
		call deptgroup_applypath_recursive(p_group_id);
	end loop;
	close c_data;


	
	select
	'ERROR' as message,
	deptgroup_id, deptgroup_name , deptgroup_parent 	
	from 
	mst_deptgroup 
	where 
	deptgroup_path is null;
	
END //



DELIMITER ;