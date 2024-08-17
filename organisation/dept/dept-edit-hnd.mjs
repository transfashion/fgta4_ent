let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;



	
}

	
export function cbo_dept_parent_dataloading(criteria, options) {
	criteria.dept_isparent = 1;
	console.log(criteria)
}