let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;



	
}

export function form_newdata(data, options) {
	options.OnNewData = () => {
		var dept_id = global.search.cbo_search_dept.combo('getValue')
		var dept_name = global.search.cbo_search_dept.combo('getText')
		form.setValue(obj.cbo_owner_dept_id, dept_id, dept_name)
	}	
}

	
export function cbo_item_id_dataloading(criteria, options) {
	var dept_id = form.getValue(obj.cbo_owner_dept_id)
	criteria.dept_id = dept_id
}	
