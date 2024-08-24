let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;



	
}

export function cbo_deptdegree_id_selected(value, display, record, args) {
	form.setValue(obj.cbo_authlevel_id, record.authlevel_id, record.authlevel_name);
}


export function cbo_deptgroup_id_selected(value, display, record, args) {
	form.setValue(obj.cbo_unit_id, record.unit_id, record.unit_name);
	form.setValue(obj.cbo_depttype_id, record.depttype_id, record.depttype_name);
	form.setValue(obj.cbo_deptmodel_id, record.deptmodel_id, record.deptmodel_name);
}

