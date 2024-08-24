let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;



	
}

	
export function cbo_deptgroup_parent_dataloading(criteria, options) {
	criteria.deptgroup_isparent = 1
}
	

export function cbo_deptgroup_parent_selected(value, display, record, args) {
	form.setValue(obj.cbo_unit_id, record.unit_id, record.unit_name)
	form.setValue(obj.cbo_depttype_id, record.depttype_id, record.depttype_name)
	form.setValue(obj.cbo_deptmodel_id, record.deptmodel_id, record.deptmodel_name)
}