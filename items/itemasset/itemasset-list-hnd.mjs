import { fgta4slideselect } from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4slideselect.mjs'
import { fgta4ParallelProcess } from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4parallel.mjs'


let grd_list, opt;
var this_page_id;
var this_page_options;

const cbo_search_dept = $('#pnl_list-cbo_search_dept');


export function init(param, fn_callback) {
	grd_list = param.grd_list;
	opt = param.opt;
	this_page_id = opt.id;
	this_page_options = opt;	


	global.search = {};

	grd_list.autoload = false;
	
	var parallelProcess = fgta4ParallelProcess({
		waitfor: {
			cbo_search_dept: 1,
		},
		onFinished: () => {
			grd_list.doLoad();
		}
	})

	global.search.cbo_search_dept = cbo_search_dept;
	cbo_search_dept.name = 'pnl_list-cbo_search_dept'	
	cbo_search_dept.comp = new fgta4slideselect(cbo_search_dept, {
		title: 'Pilih Dept',
		returnpage: this_page_id,
		api: 'ent/organisation/dept/list-byuser',

		fieldValue: 'dept_id',
		fieldValueMap: 'dept_id',
		fieldDisplay: 'dept_name',
		fields: [
			{ mapping: 'dept_name', text: 'Dept' },
		],
		OnDataLoading: (criteria) => {
			// console.log('loading...');
			criteria.isitemowner = 1;
		},
		OnDataLoaded: (result, options) => {
			console.log(result)
			// result.records.unshift({ dept_id: '--NULL--', dept_name: '-- PILIH --' });
		},
		OnSelected: (value, display, record, options) => {
			// console.log(record);
			options.flashhighlight = false
			grd_list.doLoad();
		},
		OnCreated: () => {
			// console.log(global.setup);
			// cbo_search_dept.combo('setValue', '--ALL--');
			// cbo_search_dept.combo('setText', 'ALL');

			cbo_search_dept.combo('setValue', global.setup.dept_id);
			cbo_search_dept.combo('setText', global.setup.dept_name);

			parallelProcess.setFinished('cbo_search_dept');
		},
		// OnRowRender: (tr) => {
		// 	cbo_search_dept_OnRowRender(tr);
		// }
	});
	
	fn_callback();
}

	

export function list_loading(options) {
	options.criteria.dept_id = cbo_search_dept.combo('getValue');
}


