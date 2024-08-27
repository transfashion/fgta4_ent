let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;

	setTimeout(() => {
		var cbo_deptgroup_id_options = obj.cbo_deptgroup_id.getOptions();
		var cbo_deptgroup_id_grid = obj.cbo_deptgroup_id.getGridList();
		cbo_deptgroup_id_options.OnRowRender = (tr) => {
			cbo_deptgroup_id_rowrender(cbo_deptgroup_id_grid, tr)
		}

		console.log('ready')
	}, 300)

	
}

export function cbo_deptdegree_id_selected(value, display, record, args) {
	form.setValue(obj.cbo_authlevel_id, record.authlevel_id, record.authlevel_name);
}


export function cbo_deptgroup_id_selected(value, display, record, args) {
	form.setValue(obj.cbo_unit_id, record.unit_id, record.unit_name);
	form.setValue(obj.cbo_depttype_id, record.depttype_id, record.depttype_name);
	form.setValue(obj.cbo_deptmodel_id, record.deptmodel_id, record.deptmodel_name);
}


function cbo_deptgroup_id_rowrender(grd_list, tr) {
	var dataid = tr.getAttribute('dataid')
	var record = grd_list.DATA[dataid]

	$(tr).find('td').each((i, td) => {
		var mapping = td.getAttribute('mapping')
		if (mapping=='deptgroup_name') {
			var indent = 10 + ((record.deptgroup_level-1) * 15);
			$(td).css("padding-left", `${indent}px`);
			if (record.deptgroup_isparent=='1') {
				$(td).css('font-weight', 'bold');
			}
		}
	})

}
