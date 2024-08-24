let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;



	
}

	
	
export function cbo_auth_id_selected(value, display, record, args) {
	form.setValue(obj.cbo_authlevel_id, record.authlevel_id, record.authlevel_name);
}