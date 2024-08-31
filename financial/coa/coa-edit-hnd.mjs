let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;

	setTimeout(() => {
		var cbo_coagroup_id_options = obj.cbo_coagroup_id.getOptions();
		var cbo_coagroup_id_grid = obj.cbo_coagroup_id.getGridList();
		cbo_coagroup_id_options.OnRowRender = (tr) => {
			cbo_coagroup_id_rowrender(cbo_coagroup_id_grid, tr)
		}

		console.log('ready')
	}, 300)

	
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

function cbo_coagroup_id_rowrender(grd_list, tr) {
	var dataid = tr.getAttribute('dataid')
	var record = grd_list.DATA[dataid]

	$(tr).find('td').each((i, td) => {
		var mapping = td.getAttribute('mapping')
		if (mapping=='coagroup_name') {
			var indent = 10 + ((record.coagroup_level-1) * 15);
			$(td).css("padding-left", `${indent}px`);
			if (record.coagroup_isparent=='1') {
				$(td).css('font-weight', 'bold');
			}
		}
	})

}

