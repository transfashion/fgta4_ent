let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;
}

export function cbo_brand_id_dataloading(criteria, options) {
	criteria.brand_isdisabled = 0;
}
	
	