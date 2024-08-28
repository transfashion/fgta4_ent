let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;

	setTimeout(() => {
		var cbo_itemgroup_id_options = obj.cbo_itemgroup_id.getOptions();
		var cbo_itemgroup_id_grid = obj.cbo_itemgroup_id.getGridList();
		cbo_itemgroup_id_options.OnRowRender = (tr) => {
			cbo_itemgroup_id_rowrender(cbo_itemgroup_id_grid, tr)
		}

		console.log('ready')
	}, 300)

	
}


export function form_newdata(data, options) {
	options.OnNewData = () => {
		var dept_id = global.search.cbo_search_dept.combo('getValue')
		var dept_name = global.search.cbo_search_dept.combo('getText')
		form.setValue(obj.cbo_dept_id, dept_id, dept_name)
	}	
}

export function cbo_itemgroup_id_selecting(value, display, record, args) {
	// args.Cancel=true; // apabila ingin membatalkan pilihan
	if (record.itemgroup_isparent==1) {
		$ui.ShowMessage('[WARNING]Cannot select parent item group!')
		args.Cancel=true;
	}
}

export function cbo_itemmodel_id_dataloading(criteria, options) {
	// batasi hanya yang asset
	criteria.itemmanage_isasset = 1
}

export function cbo_itemclass_id_dataloading(criteria, options) {
	// batasi hanya yang asset
	criteria.itemmanage_isasset = 1
}


function cbo_itemgroup_id_rowrender(grd_list, tr) {
	var dataid = tr.getAttribute('dataid')
	var record = grd_list.DATA[dataid]

	$(tr).find('td').each((i, td) => {
		var mapping = td.getAttribute('mapping')
		if (mapping=='itemgroup_name') {
			var indent = 10 + ((record.itemgroup_level-1) * 15);
			$(td).css("padding-left", `${indent}px`);
			if (record.itemgroup_isparent=='1') {
				$(td).css('font-weight', 'bold');
			}
		}
	})

}

