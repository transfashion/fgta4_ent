let editor, form, obj, opt;
var header_data;


export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;
}

export function form_newdata(data, options)	{
	header_data = form.getHeaderData();
}

export function form_dataopened(result, options) {
	header_data = form.getHeaderData();
};

export function cbo_itemclass_id_dataloading(criteria, options) {
	console.log(header_data);	

	criteria.itemmodel_issellable = 1;
	criteria.owner_dept_id = header_data.dept_id;
	
}
	
	