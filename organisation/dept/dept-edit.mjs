var this_page_id;
var this_page_options;

import {fgta4slideselect} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4slideselect.mjs'
import * as hnd from  './dept-edit-hnd.mjs'

const txt_caption = $('#pnl_edit-caption')


const btn_edit = $('#pnl_edit-btn_edit')
const btn_save = $('#pnl_edit-btn_save')
const btn_delete = $('#pnl_edit-btn_delete')






const pnl_form = $('#pnl_edit-form')
const obj = {
	txt_dept_id: $('#pnl_edit-txt_dept_id'),
	cbo_deptdegree_id: $('#pnl_edit-cbo_deptdegree_id'),
	txt_dept_name: $('#pnl_edit-txt_dept_name'),
	txt_dept_descr: $('#pnl_edit-txt_dept_descr'),
	cbo_deptgroup_id: $('#pnl_edit-cbo_deptgroup_id'),
	cbo_unit_id: $('#pnl_edit-cbo_unit_id'),
	cbo_depttype_id: $('#pnl_edit-cbo_depttype_id'),
	cbo_deptmodel_id: $('#pnl_edit-cbo_deptmodel_id'),
	cbo_authlevel_id: $('#pnl_edit-cbo_authlevel_id'),
	chk_dept_isdisabled: $('#pnl_edit-chk_dept_isdisabled'),
	chk_dept_isitemdefiner: $('#pnl_edit-chk_dept_isitemdefiner'),
	chk_dept_isassetowner: $('#pnl_edit-chk_dept_isassetowner'),
	chk_dept_isassetmaintainer: $('#pnl_edit-chk_dept_isassetmaintainer'),
	chk_dept_isstockowner: $('#pnl_edit-chk_dept_isstockowner'),
	chk_dept_isnonitemowner: $('#pnl_edit-chk_dept_isnonitemowner'),
	chk_dept_ispartnerselect: $('#pnl_edit-chk_dept_ispartnerselect'),
	chk_dept_isbudgetmandatory: $('#pnl_edit-chk_dept_isbudgetmandatory'),
	chk_dept_issingleprojectbudget: $('#pnl_edit-chk_dept_issingleprojectbudget')
}




let form;
let rowdata;

export async function init(opt) {
	this_page_id = opt.id;
	this_page_options = opt;

	txt_caption.template = txt_caption.html();
	var disableedit = false;


	form = new global.fgta4form(pnl_form, {
		primary: obj.txt_dept_id,
		autoid: false,
		logview: 'mst_dept',
		btn_edit: disableedit==true? $('<a>edit</a>') : btn_edit,
		btn_save: disableedit==true? $('<a>save</a>') : btn_save,
		btn_delete: disableedit==true? $('<a>delete</a>') : btn_delete,		
		objects : obj,
		OnDataSaving: async (data, options) => { await form_datasaving(data, options) },
		OnDataSaveError: async (data, options) => { await form_datasaveerror(data, options) },
		OnDataSaved: async (result, options) => {  await form_datasaved(result, options) },
		OnDataDeleting: async (data, options) => { await form_deleting(data, options) },
		OnDataDeleted: async (result, options) => { await form_deleted(result, options) },
		OnIdSetup : (options) => { form_idsetup(options) },
		OnViewModeChanged : (viewonly) => { form_viewmodechanged(viewonly) },
		OnRecordStatusCreated: () => {
			undefined			
		}		
	});
	form.getHeaderData = () => {
		return getHeaderData();
	}

	// Generator: Print Handler not exist
	// Generator: Commit Handler not exist
	// Generator: Approval Handler not exist
	// Generator: Xtion Handler not exist
	// Generator: Object Handler not exist

	// Generator: Upload Handler not exist


	obj.cbo_deptdegree_id.name = 'pnl_edit-cbo_deptdegree_id'		
	new fgta4slideselect(obj.cbo_deptdegree_id, {
		title: 'Pilih deptdegree_id',
		returnpage: this_page_id,
		api: $ui.apis.load_deptdegree_id,
		fieldValue: 'deptdegree_id',
		fieldDisplay: 'deptdegree_name',
		fields: [
			{mapping: 'deptdegree_id', text: 'deptdegree_id'},
			{mapping: 'deptdegree_name', text: 'deptdegree_name'}
		],
		OnSelected: (value, display, record, args) => {
			if (value!=args.PreviousValue ) {
				if (typeof hnd.cbo_deptdegree_id_selected === 'function') {
					hnd.cbo_deptdegree_id_selected(value, display, record, args);
				}
			}
		},

	})				
				
	obj.cbo_deptgroup_id.name = 'pnl_edit-cbo_deptgroup_id'		
	new fgta4slideselect(obj.cbo_deptgroup_id, {
		title: 'Pilih Group',
		returnpage: this_page_id,
		api: $ui.apis.load_deptgroup_id,
		fieldValue: 'deptgroup_id',
		fieldDisplay: 'deptgroup_name',
		fields: [
			{mapping: 'deptgroup_name', text: 'Item Group', style: 'width: auto; padding-left: 10px'},
			{mapping: '_id', text: 'ID', style: 'width: 100px'}
		],
		OnSelected: (value, display, record, args) => {
			if (value!=args.PreviousValue ) {
				if (typeof hnd.cbo_deptgroup_id_selected === 'function') {
					hnd.cbo_deptgroup_id_selected(value, display, record, args);
				}
			}
		},

	})				
				
	obj.cbo_unit_id.name = 'pnl_edit-cbo_unit_id'		
	new fgta4slideselect(obj.cbo_unit_id, {
		title: 'Pilih Unit',
		returnpage: this_page_id,
		api: $ui.apis.load_unit_id,
		fieldValue: 'unit_id',
		fieldDisplay: 'unit_name',
		fields: [
			{mapping: 'unit_id', text: 'unit_id'},
			{mapping: 'unit_name', text: 'unit_name'}
		],

	})				
				
	obj.cbo_depttype_id.name = 'pnl_edit-cbo_depttype_id'		
	new fgta4slideselect(obj.cbo_depttype_id, {
		title: 'Pilih depttype_id',
		returnpage: this_page_id,
		api: $ui.apis.load_depttype_id,
		fieldValue: 'depttype_id',
		fieldDisplay: 'depttype_name',
		fields: [
			{mapping: 'depttype_id', text: 'depttype_id'},
			{mapping: 'depttype_name', text: 'depttype_name'}
		],

	})				
				
	obj.cbo_deptmodel_id.name = 'pnl_edit-cbo_deptmodel_id'		
	new fgta4slideselect(obj.cbo_deptmodel_id, {
		title: 'Pilih deptmodel_id',
		returnpage: this_page_id,
		api: $ui.apis.load_deptmodel_id,
		fieldValue: 'deptmodel_id',
		fieldDisplay: 'deptmodel_name',
		fields: [
			{mapping: 'deptmodel_id', text: 'deptmodel_id'},
			{mapping: 'deptmodel_name', text: 'deptmodel_name'}
		],

	})				
				
	obj.cbo_authlevel_id.name = 'pnl_edit-cbo_authlevel_id'		
	new fgta4slideselect(obj.cbo_authlevel_id, {
		title: 'Pilih authlevel_id',
		returnpage: this_page_id,
		api: $ui.apis.load_authlevel_id,
		fieldValue: 'authlevel_id',
		fieldDisplay: 'authlevel_name',
		fields: [
			{mapping: 'authlevel_id', text: 'authlevel_id'},
			{mapping: 'authlevel_name', text: 'authlevel_name'}
		],

	})				
				




	document.addEventListener('keydown', (ev)=>{
		if ($ui.getPages().getCurrentPage()==this_page_id) {
			if (ev.code=='KeyS' && ev.ctrlKey==true) {
				if (!form.isInViewMode()) {
					form.btn_save_click();
				}
				ev.stopPropagation()
				ev.preventDefault()
			}
		}
	}, true)
	
	document.addEventListener('OnSizeRecalculated', (ev) => {
		OnSizeRecalculated(ev.detail.width, ev.detail.height)
	})	

	document.addEventListener('OnButtonBack', (ev) => {
		var element = document.activeElement;
		element.blur();
		if ($ui.getPages().getCurrentPage()==this_page_id) {
			ev.detail.cancel = true;
			if (form.isDataChanged()) {
				form.canceledit(()=>{
					$ui.getPages().show('pnl_list', ()=>{
						form.setViewMode()
						$ui.getPages().ITEMS['pnl_list'].handler.scrolllast()
					})
				})
			} else {
				$ui.getPages().show('pnl_list', ()=>{
					form.setViewMode()
					$ui.getPages().ITEMS['pnl_list'].handler.scrolllast()
				})
			}
		
		}
	})

	document.addEventListener('OnButtonHome', (ev) => {
		if ($ui.getPages().getCurrentPage()==this_page_id) {
			if (form.isDataChanged()) {
				ev.detail.cancel = true;
				$ui.ShowMessage('Anda masih dalam mode edit dengan pending data, silakan matikan mode edit untuk kembali ke halaman utama.')
			}
		}
	})

	//button state
	if (typeof hnd.init==='function') {
		hnd.init({
			form: form,
			obj: obj,
			opt: opt,
			btn_action_click: (actionargs) => {
				if (typeof btn_action_click == 'function') {
					btn_action_click(actionargs);
				}
			}
		})
	}

}

export function OnSizeRecalculated(width, height) {
}

export function getForm() {
	return form
}

export function getCurrentRowdata() {
	return rowdata;
}

export function open(data, rowid, viewmode=true, fn_callback) {

	var caption = txt_caption.template;
	caption = caption.replace('{{STATE_BEG}}', '');
	caption = caption.replace('{{STATE_END}}', ' View');
	txt_caption.html(caption);


	rowdata = {
		data: data,
		rowid: rowid
	}

	var pOpt = form.getDefaultPrompt(false)
	var fn_dataopening = async (options) => {
		options.criteria[form.primary.mapping] = data[form.primary.mapping]
	}

	var fn_dataopened = async (result, options) => {
		var record = result.record;
		updatefilebox(record);

		/*

		*/
		for (var objid in obj) {
			let o = obj[objid]
			if (o.isCombo() && !o.isRequired()) {
				var value =  result.record[o.getFieldValueName()];
				if (value==null ) {
					record[o.getFieldValueName()] = pOpt.value;
					record[o.getFieldDisplayName()] = pOpt.text;
				}
			}
		}
  		updaterecordstatus(record)

		/* handle data saat opening data */   
		if (typeof hnd.form_dataopening == 'function') {
			hnd.form_dataopening(result, options);
		}


		form.SuspendEvent(true);
		form
			.fill(record)
			.setValue(obj.cbo_deptdegree_id, record.deptdegree_id, record.deptdegree_name)
			.setValue(obj.cbo_deptgroup_id, record.deptgroup_id, record.deptgroup_name)
			.setValue(obj.cbo_unit_id, record.unit_id, record.unit_name)
			.setValue(obj.cbo_depttype_id, record.depttype_id, record.depttype_name)
			.setValue(obj.cbo_deptmodel_id, record.deptmodel_id, record.deptmodel_name)
			.setValue(obj.cbo_authlevel_id, record.authlevel_id, record.authlevel_name)
			.setViewMode(viewmode)
			.lock(false)
			.rowid = rowid


		/* tambahkan event atau behaviour saat form dibuka
		   apabila ada rutin mengubah form dan tidak mau dijalankan pada saat opening,
		   cek dengan form.isEventSuspended()
		*/   
		if (typeof hnd.form_dataopened == 'function') {
			hnd.form_dataopened(result, options);
		}


		/* commit form */
		form.commit()
		form.SuspendEvent(false); 
		updatebuttonstate(record)


		/* update rowdata */
		for (var nv in rowdata.data) {
			if (record[nv]!=undefined) {
				rowdata.data[nv] = record[nv];
			}
		}

		// tampilkan form untuk data editor
		if (typeof fn_callback==='function') {
			fn_callback(null, rowdata.data);
		}
		
	}

	var fn_dataopenerror = (err) => {
		$ui.ShowMessage('[ERROR]'+err.errormessage);
	}

	form.dataload(fn_dataopening, fn_dataopened, fn_dataopenerror)
	
}


export function createnew() {

	var caption = txt_caption.template;
	caption = caption.replace('{{STATE_BEG}}', 'Create New ');
	caption = caption.replace('{{STATE_END}}', '');
	txt_caption.html(caption);


	form.createnew(async (data, options)=>{
		// console.log(data)
		// console.log(options)
		form.rowid = null

		// set nilai-nilai default untuk form
		data.dept_isdisabled = '0'
		data.dept_isitemdefiner = '0'
		data.dept_isassetowner = '0'
		data.dept_isassetmaintainer = '0'
		data.dept_isstockowner = '0'
		data.dept_isnonitemowner = '0'
		data.dept_ispartnerselect = '0'
		data.dept_isbudgetmandatory = '0'
		data.dept_issingleprojectbudget = '0'

		data.deptdegree_id = '0'
		data.deptdegree_name = '-- PILIH --'
		data.deptgroup_id = '0'
		data.deptgroup_name = '-- PILIH --'
		data.unit_id = '0'
		data.unit_name = '-- PILIH --'
		data.depttype_id = '0'
		data.depttype_name = '-- PILIH --'
		data.deptmodel_id = '0'
		data.deptmodel_name = '-- PILIH --'
		data.authlevel_id = '0'
		data.authlevel_name = '-- PILIH --'

		if (typeof hnd.form_newdata == 'function') {
			// untuk mengambil nilai ui component,
			// di dalam handler form_newdata, gunakan perintah:
			// options.OnNewData = () => {
			// 		...
			// }		
			hnd.form_newdata(data, options);
		}




		options.OnCanceled = () => {
			$ui.getPages().show('pnl_list')
		}

		$ui.getPages().ITEMS['pnl_editauthgrid'].handler.createnew(data, options)


	})
}


export function getHeaderData() {
	var header_data = form.getData();
	if (typeof hnd.form_getHeaderData == 'function') {
		hnd.form_getHeaderData(header_data);
	}
	return header_data;
}

export function detil_open(pnlname) {
	if (form.isDataChanged()) {
		$ui.ShowMessage('Simpan dulu perubahan datanya.')
		return;
	}

	//$ui.getPages().show(pnlname)
	let header_data = getHeaderData();
	if (typeof hnd.form_detil_opening == 'function') {
		hnd.form_detil_opening(pnlname, (cancel)=>{
			if (cancel===true) {
				return;
			}
			$ui.getPages().show(pnlname, () => {
				$ui.getPages().ITEMS[pnlname].handler.OpenDetil(header_data)
			})
		});
	} else {
		$ui.getPages().show(pnlname, () => {
			$ui.getPages().ITEMS[pnlname].handler.OpenDetil(header_data)
		})
	}

	
}


function updatefilebox(record) {
	// apabila ada keperluan untuk menampilkan data dari object storage


	if (typeof hnd.form_updatefilebox == 'function') {
		hnd.form_updatefilebox(record);
	}
}

function updaterecordstatus(record) {
	// apabila ada keperluan untuk update status record di sini


	if (typeof hnd.form_updaterecordstatus == 'function') {
		hnd.form_updaterecordstatus(record);
	}
}

function updatebuttonstate(record) {
	// apabila ada keperluan untuk update state action button di sini


	if (typeof hnd.form_updatebuttonstate == 'function') {
		hnd.form_updatebuttonstate(record);
	}
}

function updategridstate(record) {
	var updategriddata = {}

	// apabila ada keperluan untuk update state grid list di sini


	if (typeof hnd.form_updategridstate == 'function') {
		hnd.form_updategridstate(updategriddata, record);
	}

	$ui.getPages().ITEMS['pnl_list'].handler.updategrid(updategriddata, form.rowid);

}

function form_viewmodechanged(viewmode) {

	var caption = txt_caption.template;
	if (viewmode) {
		caption = caption.replace('{{STATE_BEG}}', '');
		caption = caption.replace('{{STATE_END}}', ' View');
	} else {
		caption = caption.replace('{{STATE_BEG}}', '');
		caption = caption.replace('{{STATE_END}}', ' Edit');
	}
	txt_caption.html(caption);


	var OnViewModeChangedEvent = new CustomEvent('OnViewModeChanged', {detail: {}})
	$ui.triggerevent(OnViewModeChangedEvent, {
		viewmode: viewmode
	})
}

function form_idsetup(options) {
	var objid = obj.txt_dept_id
	switch (options.action) {
		case 'fill' :
			objid.textbox('disable') 
			break;

		case 'createnew' :
			// console.log('new')
			if (form.autoid) {
				objid.textbox('disable') 
				objid.textbox('setText', '[AUTO]') 
			} else {
				objid.textbox('enable') 
			}
			break;
			
		case 'save' :
			objid.textbox('disable') 
			break;	
	}
}


async function form_datasaving(data, options) {
	// cek dulu data yang akan disimpan,
	// apabila belum sesuai dengan yang diharuskan, batalkan penyimpanan
	//    options.cancel = true

	// Modifikasi object data, apabila ingin menambahkan variabel yang akan dikirim ke server
	// options.skipmappingresponse = [];
	options.skipmappingresponse = [];
	for (var objid in obj) {
		var o = obj[objid]
		if (o.isCombo() && !o.isRequired()) {
			var id = o.getFieldValueName()
			options.skipmappingresponse.push(id)
			// console.log(id)
		}
	}

	if (typeof hnd.form_datasaving == 'function') {
		hnd.form_datasaving(data, options);
	}

}

async function form_datasaveerror(err, options) {
	// apabila mau olah error messagenya
	// $ui.ShowMessage(err.errormessage)
	console.error(err)
	if (typeof hnd.form_datasaveerror == 'function') {
		hnd.form_datasaveerror(err, options);
	}
	if (options.supress_error_dialog!=true) {
		$ui.ShowMessage('[ERROR]'+err.message);
	}

}


async function form_datasaved(result, options) {
	// Apabila tidak mau munculkan dialog
	// options.suppressdialog = true

	// Apabila ingin mengganti message Data Tersimpan
	// options.savedmessage = 'Data sudah disimpan cuy!'

	// if (form.isNewData()) {
	// 	console.log('masukan ke grid')
	// 	$ui.getPages().ITEMS['pnl_list'].handler.updategrid(form.getData())
	// } else {
	// 	console.log('update grid')
	// }


	var data = {}
	Object.assign(data, form.getData(), result.dataresponse)
	/*

	*/

	var pOpt = form.getDefaultPrompt(false)
	for (var objid in obj) {
		var o = obj[objid]
		if (o.isCombo() && !o.isRequired()) {
			var value =  result.dataresponse[o.getFieldValueName()];
			var text = result.dataresponse[o.getFieldDisplayName()];
			if (value==null ) {
				value = pOpt.value;
				text = pOpt.text;
			}
			form.setValue(o, value, text);
		}
	}
	form.rowid = $ui.getPages().ITEMS['pnl_list'].handler.updategrid(data, form.rowid)
	var rowdata = {
		data: data,
		rowid: form.rowid
	}

	if (typeof hnd.form_datasaved == 'function') {
		hnd.form_datasaved(result, rowdata, options);
	}
}



async function form_deleting(data, options) {
	if (typeof hnd.form_deleting == 'function') {
		hnd.form_deleting(data, options);
	}
}

async function form_deleted(result, options) {
	$ui.getPages().show('pnl_list')
	$ui.getPages().ITEMS['pnl_list'].handler.removerow(form.rowid)

	if (typeof hnd.form_deleted == 'function') {
		hnd.form_deleted(result, options);
	}
}




