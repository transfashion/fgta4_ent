let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;



	
}

	
export function cbo_coagroup_id_selected(value, display, record, args) {
	form.setValue(obj.cbo_coamodel_id, record.coamodel_id, record.coamodel_name)
	form.setValue(obj.cbo_coareport_id, record.coareport_id, record.coareport_name)
	form.setValue(obj.txt_coa_dk, record.coa_dk)
	form.setValue(obj.txt_coa_mp, record.coa_mp)
}
	
export function cbo_coamodel_id_selected(value, display, record, args) {
	form.setValue(obj.cbo_coareport_id, record.coareport_id, record.coareport_name)
	form.setValue(obj.txt_coa_dk, record.coa_dk)
	form.setValue(obj.txt_coa_mp, record.coa_mp)
}
