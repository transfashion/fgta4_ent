let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;



	
}


export function cbo_coagroup_parent_dataloading(criteria, options) {
	criteria.coagroup_isparent = 1
}

	
export function cbo_coagroup_parent_selected(value, display, record, args) {
	console.log(value)
	console.log(record)

	if (value=='--NULL--') {
		//form.setDisable(obj.cbo_coamodel_id, false)
		form.setDisable(obj.cbo_coareport_id, false)
	} else {
		//form.setDisable(obj.cbo_coamodel_id, true)
		form.setDisable(obj.cbo_coareport_id, true)

		// set sesuai parent
		form.setValue(obj.cbo_coamodel_id, record.coamodel_id, record.coamodel_name)
		form.setValue(obj.cbo_coareport_id, record.coareport_id, record.coareport_name)
	}
}	