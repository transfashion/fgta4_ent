let grd_list, opt;
var this_page_id;
var this_page_options;

const btn_reindex = $('#pnl_list-btn_reindex');


export function init(param, fn_callback) {
	grd_list = param.grd_list;
	opt = param.opt;
	this_page_id = opt.id;
	this_page_options = opt;	

	btn_reindex.linkbutton({
		onClick: () => { btn_reindex_click() }
	})
	
	fn_callback();
}


async function btn_reindex_click() {
	
	var apiurl = `${global.modulefullname}/xtion-reindex`
	var args = {options: {}}

	try {
		$ui.mask('wait..');
		let result = await $ui.apicall(apiurl, args)
		if (result.success) {
			grd_list.doLoad();
		}
	} catch (err) {
		console.error(err);
		$ui.ShowMessage('[ERROR]' + err.message);
	} finally {
		$ui.forceclosemask = true;
		$ui.unmask();
	}
	

}
	
export function grd_list_rowrender(row) {
	//{tr:tr, td:td, record:record, mapping:mapping, dataid:dataid, i:i});
	var mapping = row.mapping;	
	var record = row.record;
	var td = row.td;

	if (mapping=='deptgroup_name') {
		var indent = 10 + ((record.deptgroup_level-1) * 15);
		$(td).css("padding-left", `${indent}px`);

		if (record.deptgroup_isparent=="1") {
			$(td).css('font-weight', 'bold');
		}

	}

}