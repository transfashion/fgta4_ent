DROP PROCEDURE IF EXISTS dept_reindex;

DELIMITER //

CREATE PROCEDURE dept_reindex()
BEGIN
	
	declare p_group_id varchar(30);
	declare EOF bool;	

	declare c_data cursor for
	select dept_id from mst_dept where dept_parent is null;

	declare continue handler for not found
	set EOF = true;


	update mst_dept
	set
	dept_isparent = 0,
	dept_pathid = rpad(dept_id, 30, '-'),
	dept_path = '',
	dept_level = 0;


	open c_data;
	lp: loop
		fetch c_data into p_group_id;
		if eof is true then
			leave lp;
		end if;
	
		call dept_applypath_recursive(p_group_id);
	end loop;
	close c_data;


	
	select
	'ERROR' as message,
	dept_id, dept_name , dept_parent 	
	from 
	mst_dept 
	where 
	dept_path is null;
	
END //


DELIMITER ;