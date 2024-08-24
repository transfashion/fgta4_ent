DROP PROCEDURE IF EXISTS dept_applypath;

DELIMITER //


CREATE PROCEDURE dept_applypath(
	IN in_dept_id varchar(30)
)
BEGIN
	
	declare p_group_id varchar(30);
	declare p_group_parent varchar(30);
	declare p_group_pathid varchar(30);
	declare p_group_path varchar(390);
	declare p_group_level int(2);
	declare p_group_isparent tinyint(1);
	declare p_parent_pathid varchar(30);
	declare p_parent_path varchar(390);
	declare p_parent_level int(2);
	declare p_child_count int(4);
	declare p_message varchar(255);


	set p_group_id = in_dept_id;


	select dept_parent
	into p_group_parent
	from
	mst_dept 
	where 
	dept_id = p_group_id;

	if p_group_parent=p_group_id then
		set p_message = concat('Kode parent dept ', p_group_id, ' invalid, merefer ke diri sendiri');
		signal sqlstate '45000' set MESSAGE_TEXT = p_message;
	end if;
	
	
	set p_group_pathid = rpad(p_group_id, 30, '-');
	set p_group_level = 1;

	if p_group_parent is null then
		set p_group_path = p_group_pathid;
		set p_group_level = 1;
	else
		select dept_pathid, dept_path, dept_level
		into p_parent_pathid, p_parent_path, p_parent_level
		from mst_dept
		where 
		dept_id = p_group_parent;
	
		set p_group_path = concat(p_parent_path, p_group_pathid);
		set p_group_level = p_parent_level + 1;
	end if;
	
	
	select count(dept_id) as n 
	into p_child_count
	from mst_dept where dept_parent = p_group_id;
	
	if p_child_count > 0 then 
		set p_group_isparent = 1;
	else
		set p_group_isparent = 0;
	end if;
	


	update mst_dept 
	set
	dept_isparent = p_group_isparent,
	dept_pathid = p_group_pathid,
	dept_path = p_group_path,
	dept_level = p_group_level
	where
	dept_id = p_group_id;
	
	

	
END



DELIMITER ;