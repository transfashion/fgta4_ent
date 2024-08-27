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
		form.setValue(obj.cbo_dept_id, dept_id, dept_name)
	}	
}
	


export function cbo_itemgroup_parent_dataloading(criteria, options) {
	criteria.itemgroup_isparent = 1
}

export function cbo_itemgroup_parent_selected(value, display, record, args) {
	form.setValue(obj.cbo_itemmodel_id, record.itemmodel_id, record.itemmodel_name)
}