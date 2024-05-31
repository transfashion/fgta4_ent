var this_page_id;
var this_page_options;

import {fgta4slideselect} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4slideselect.mjs'
import * as hnd from  './partnertype-edit-hnd.mjs'


const btn_edit = $('#pnl_edit-btn_edit')
const btn_save = $('#pnl_edit-btn_save')
const btn_delete = $('#pnl_edit-btn_delete')






const pnl_form = $('#pnl_edit-form')
const obj = {
	txt_partnertype_id: $('#pnl_edit-txt_partnertype_id'),
	txt_partnertype_name: $('#pnl_edit-txt_partnertype_name'),
	txt_partnertype_descr: $('#pnl_edit-txt_partnertype_descr'),
	cbo_partnercategory_id: $('#pnl_edit-cbo_partnercategory_id'),
	cbo_itemclass_id: $('#pnl_edit-cbo_itemclass_id'),
	cbo_unbill_accbudget_id: $('#pnl_edit-cbo_unbill_accbudget_id'),
	cbo_unbill_coa_id: $('#pnl_edit-cbo_unbill_coa_id'),
	cbo_payable_accbudget_id: $('#pnl_edit-cbo_payable_accbudget_id'),
	cbo_payable_coa_id: $('#pnl_edit-cbo_payable_coa_id'),
	cbo_arunbill_accbudget_id: $('#pnl_edit-cbo_arunbill_accbudget_id'),
	cbo_arunbill_coa_id: $('#pnl_edit-cbo_arunbill_coa_id'),
	cbo_ar_accbudget_id: $('#pnl_edit-cbo_ar_accbudget_id'),
	cbo_ar_coa_id: $('#pnl_edit-cbo_ar_coa_id'),
	chk_partnertype_isempl: $('#pnl_edit-chk_partnertype_isempl'),
	chk_partnertype_ishaveae: $('#pnl_edit-chk_partnertype_ishaveae'),
	chk_partnertype_ishavecollector: $('#pnl_edit-chk_partnertype_ishavecollector'),
	chk_partnertype_isdisabled: $('#pnl_edit-chk_partnertype_isdisabled')
}




let form;
let rowdata;

export async function init(opt) {
	this_page_id = opt.id;
	this_page_options = opt;


	var disableedit = false;
	// switch (this_page_options.variancename) {
	// 	case 'commit' :
	//		disableedit = true;
	//		btn_edit.linkbutton('disable');
	//		btn_save.linkbutton('disable');
	//		btn_delete.linkbutton('disable');
	//		break;
	// }


	form = new global.fgta4form(pnl_form, {
		primary: obj.txt_partnertype_id,
		autoid: false,
		logview: 'mst_partnertype',
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

	// Generator: Print Handler if exist
	// Generator: Commit Handler if exist
	// Generator: Approval Handler if exist
	// Generator: Xtion Handler if exist
	// Generator: Object Handler if exist

	// Generator: Upload Handler if exist


	new fgta4slideselect(obj.cbo_partnercategory_id, {
		title: 'Pilih partnercategory_id',
		returnpage: this_page_id,
		api: $ui.apis.load_partnercategory_id,
		fieldValue: 'partnercategory_id',
		fieldDisplay: 'partnercategory_name',
		fields: [
			{mapping: 'partnercategory_id', text: 'partnercategory_id'},
			{mapping: 'partnercategory_name', text: 'partnercategory_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_itemclass_id, {
		title: 'Pilih itemclass_id',
		returnpage: this_page_id,
		api: $ui.apis.load_itemclass_id,
		fieldValue: 'itemclass_id',
		fieldDisplay: 'itemclass_name',
		fields: [
			{mapping: 'itemclass_id', text: 'itemclass_id'},
			{mapping: 'itemclass_name', text: 'itemclass_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_unbill_accbudget_id, {
		title: 'Pilih unbill_accbudget_id',
		returnpage: this_page_id,
		api: $ui.apis.load_unbill_accbudget_id,
		fieldValue: 'unbill_accbudget_id',
		fieldDisplay: 'unbill_accbudget_name',
		fieldValueMap: 'accbudget_id',
		fieldDisplayMap: 'accbudget_name',
		fields: [
			{mapping: 'accbudget_id', text: 'accbudget_id'},
			{mapping: 'accbudget_name', text: 'accbudget_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_unbill_coa_id, {
		title: 'Pilih unbill_coa_id',
		returnpage: this_page_id,
		api: $ui.apis.load_unbill_coa_id,
		fieldValue: 'unbill_coa_id',
		fieldDisplay: 'unbill_coa_name',
		fieldValueMap: 'coa_id',
		fieldDisplayMap: 'coa_name',
		fields: [
			{mapping: 'coa_id', text: 'coa_id'},
			{mapping: 'coa_name', text: 'coa_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_payable_accbudget_id, {
		title: 'Pilih payable_accbudget_id',
		returnpage: this_page_id,
		api: $ui.apis.load_payable_accbudget_id,
		fieldValue: 'payable_accbudget_id',
		fieldDisplay: 'payable_accbudget_name',
		fieldValueMap: 'accbudget_id',
		fieldDisplayMap: 'accbudget_name',
		fields: [
			{mapping: 'accbudget_id', text: 'accbudget_id'},
			{mapping: 'accbudget_name', text: 'accbudget_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_payable_coa_id, {
		title: 'Pilih payable_coa_id',
		returnpage: this_page_id,
		api: $ui.apis.load_payable_coa_id,
		fieldValue: 'payable_coa_id',
		fieldDisplay: 'payable_coa_name',
		fieldValueMap: 'coa_id',
		fieldDisplayMap: 'coa_name',
		fields: [
			{mapping: 'coa_id', text: 'coa_id'},
			{mapping: 'coa_name', text: 'coa_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_arunbill_accbudget_id, {
		title: 'Pilih arunbill_accbudget_id',
		returnpage: this_page_id,
		api: $ui.apis.load_arunbill_accbudget_id,
		fieldValue: 'arunbill_accbudget_id',
		fieldDisplay: 'arunbill_accbudget_name',
		fieldValueMap: 'accbudget_id',
		fieldDisplayMap: 'accbudget_name',
		fields: [
			{mapping: 'accbudget_id', text: 'accbudget_id'},
			{mapping: 'accbudget_name', text: 'accbudget_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_arunbill_coa_id, {
		title: 'Pilih arunbill_coa_id',
		returnpage: this_page_id,
		api: $ui.apis.load_arunbill_coa_id,
		fieldValue: 'arunbill_coa_id',
		fieldDisplay: 'arunbill_coa_name',
		fieldValueMap: 'coa_id',
		fieldDisplayMap: 'coa_name',
		fields: [
			{mapping: 'coa_id', text: 'coa_id'},
			{mapping: 'coa_name', text: 'coa_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_ar_accbudget_id, {
		title: 'Pilih ar_accbudget_id',
		returnpage: this_page_id,
		api: $ui.apis.load_ar_accbudget_id,
		fieldValue: 'ar_accbudget_id',
		fieldDisplay: 'ar_accbudget_name',
		fieldValueMap: 'accbudget_id',
		fieldDisplayMap: 'accbudget_name',
		fields: [
			{mapping: 'accbudget_id', text: 'accbudget_id'},
			{mapping: 'accbudget_name', text: 'accbudget_name'}
		],

	})				
				
	new fgta4slideselect(obj.cbo_ar_coa_id, {
		title: 'Pilih ar_coa_id',
		returnpage: this_page_id,
		api: $ui.apis.load_ar_coa_id,
		fieldValue: 'ar_coa_id',
		fieldDisplay: 'ar_coa_name',
		fieldValueMap: 'coa_id',
		fieldDisplayMap: 'coa_name',
		fields: [
			{mapping: 'coa_id', text: 'coa_id'},
			{mapping: 'coa_name', text: 'coa_name'}
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
		if (result.record.partnercategory_id==null) { result.record.partnercategory_id='--NULL--'; result.record.partnercategory_name='NONE'; }
		if (result.record.itemclass_id==null) { result.record.itemclass_id='--NULL--'; result.record.itemclass_name='NONE'; }
		if (result.record.unbill_accbudget_id==null) { result.record.unbill_accbudget_id='--NULL--'; result.record.unbill_accbudget_name='NONE'; }
		if (result.record.unbill_coa_id==null) { result.record.unbill_coa_id='--NULL--'; result.record.unbill_coa_name='NONE'; }
		if (result.record.payable_accbudget_id==null) { result.record.payable_accbudget_id='--NULL--'; result.record.payable_accbudget_name='NONE'; }
		if (result.record.payable_coa_id==null) { result.record.payable_coa_id='--NULL--'; result.record.payable_coa_name='NONE'; }
		if (result.record.arunbill_accbudget_id==null) { result.record.arunbill_accbudget_id='--NULL--'; result.record.arunbill_accbudget_name='NONE'; }
		if (result.record.arunbill_coa_id==null) { result.record.arunbill_coa_id='--NULL--'; result.record.arunbill_coa_name='NONE'; }
		if (result.record.ar_accbudget_id==null) { result.record.ar_accbudget_id='--NULL--'; result.record.ar_accbudget_name='NONE'; }
		if (result.record.ar_coa_id==null) { result.record.ar_coa_id='--NULL--'; result.record.ar_coa_name='NONE'; }

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

		form.SuspendEvent(true);
		form
			.fill(record)
			.setValue(obj.cbo_partnercategory_id, record.partnercategory_id, record.partnercategory_name)
			.setValue(obj.cbo_itemclass_id, record.itemclass_id, record.itemclass_name)
			.setValue(obj.cbo_unbill_accbudget_id, record.unbill_accbudget_id, record.unbill_accbudget_name)
			.setValue(obj.cbo_unbill_coa_id, record.unbill_coa_id, record.unbill_coa_name)
			.setValue(obj.cbo_payable_accbudget_id, record.payable_accbudget_id, record.payable_accbudget_name)
			.setValue(obj.cbo_payable_coa_id, record.payable_coa_id, record.payable_coa_name)
			.setValue(obj.cbo_arunbill_accbudget_id, record.arunbill_accbudget_id, record.arunbill_accbudget_name)
			.setValue(obj.cbo_arunbill_coa_id, record.arunbill_coa_id, record.arunbill_coa_name)
			.setValue(obj.cbo_ar_accbudget_id, record.ar_accbudget_id, record.ar_accbudget_name)
			.setValue(obj.cbo_ar_coa_id, record.ar_coa_id, record.ar_coa_name)
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
	form.createnew(async (data, options)=>{
		// console.log(data)
		// console.log(options)
		form.rowid = null

		// set nilai-nilai default untuk form
		data.partnertype_isempl = '0'
		data.partnertype_ishaveae = '0'
		data.partnertype_ishavecollector = '0'
		data.partnertype_isdisabled = '0'

		data.partnercategory_id = '--NULL--'
		data.partnercategory_name = 'NONE'
		data.itemclass_id = '--NULL--'
		data.itemclass_name = 'NONE'
		data.unbill_accbudget_id = '--NULL--'
		data.unbill_accbudget_name = 'NONE'
		data.unbill_coa_id = '--NULL--'
		data.unbill_coa_name = 'NONE'
		data.payable_accbudget_id = '--NULL--'
		data.payable_accbudget_name = 'NONE'
		data.payable_coa_id = '--NULL--'
		data.payable_coa_name = 'NONE'
		data.arunbill_accbudget_id = '--NULL--'
		data.arunbill_accbudget_name = 'NONE'
		data.arunbill_coa_id = '--NULL--'
		data.arunbill_coa_name = 'NONE'
		data.ar_accbudget_id = '--NULL--'
		data.ar_accbudget_name = 'NONE'
		data.ar_coa_id = '--NULL--'
		data.ar_coa_name = 'NONE'

		if (typeof hnd.form_newdata == 'function') {
			hnd.form_newdata(data, options);
		}




		options.OnCanceled = () => {
			$ui.getPages().show('pnl_list')
		}

		$ui.getPages().ITEMS['pnl_editaccountgrid'].handler.createnew(data, options)


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

}

function updaterecordstatus(record) {
	// apabila ada keperluan untuk update status record di sini

}

function updatebuttonstate(record) {
	// apabila ada keperluan untuk update state action button di sini
	
}

function updategridstate(record) {
	// apabila ada keperluan untuk update state grid list di sini
	
}

function form_viewmodechanged(viewmode) {
	var OnViewModeChangedEvent = new CustomEvent('OnViewModeChanged', {detail: {}})
	$ui.triggerevent(OnViewModeChangedEvent, {
		viewmode: viewmode
	})
}

function form_idsetup(options) {
	var objid = obj.txt_partnertype_id
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
	// options.skipmappingresponse = ['partnercategory_id', 'itemclass_id', 'unbill_accbudget_id', 'unbill_coa_id', 'payable_accbudget_id', 'payable_coa_id', 'arunbill_accbudget_id', 'arunbill_coa_id', 'ar_accbudget_id', 'ar_coa_id', ];
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
	console.log(err)
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
	form.setValue(obj.cbo_partnercategory_id, result.dataresponse.partnercategory_name!=='--NULL--' ? result.dataresponse.partnercategory_id : '--NULL--', result.dataresponse.partnercategory_name!=='--NULL--'?result.dataresponse.partnercategory_name:'NONE')
	form.setValue(obj.cbo_itemclass_id, result.dataresponse.itemclass_name!=='--NULL--' ? result.dataresponse.itemclass_id : '--NULL--', result.dataresponse.itemclass_name!=='--NULL--'?result.dataresponse.itemclass_name:'NONE')
	form.setValue(obj.cbo_unbill_accbudget_id, result.dataresponse.unbill_accbudget_name!=='--NULL--' ? result.dataresponse.unbill_accbudget_id : '--NULL--', result.dataresponse.unbill_accbudget_name!=='--NULL--'?result.dataresponse.unbill_accbudget_name:'NONE')
	form.setValue(obj.cbo_unbill_coa_id, result.dataresponse.unbill_coa_name!=='--NULL--' ? result.dataresponse.unbill_coa_id : '--NULL--', result.dataresponse.unbill_coa_name!=='--NULL--'?result.dataresponse.unbill_coa_name:'NONE')
	form.setValue(obj.cbo_payable_accbudget_id, result.dataresponse.payable_accbudget_name!=='--NULL--' ? result.dataresponse.payable_accbudget_id : '--NULL--', result.dataresponse.payable_accbudget_name!=='--NULL--'?result.dataresponse.payable_accbudget_name:'NONE')
	form.setValue(obj.cbo_payable_coa_id, result.dataresponse.payable_coa_name!=='--NULL--' ? result.dataresponse.payable_coa_id : '--NULL--', result.dataresponse.payable_coa_name!=='--NULL--'?result.dataresponse.payable_coa_name:'NONE')
	form.setValue(obj.cbo_arunbill_accbudget_id, result.dataresponse.arunbill_accbudget_name!=='--NULL--' ? result.dataresponse.arunbill_accbudget_id : '--NULL--', result.dataresponse.arunbill_accbudget_name!=='--NULL--'?result.dataresponse.arunbill_accbudget_name:'NONE')
	form.setValue(obj.cbo_arunbill_coa_id, result.dataresponse.arunbill_coa_name!=='--NULL--' ? result.dataresponse.arunbill_coa_id : '--NULL--', result.dataresponse.arunbill_coa_name!=='--NULL--'?result.dataresponse.arunbill_coa_name:'NONE')
	form.setValue(obj.cbo_ar_accbudget_id, result.dataresponse.ar_accbudget_name!=='--NULL--' ? result.dataresponse.ar_accbudget_id : '--NULL--', result.dataresponse.ar_accbudget_name!=='--NULL--'?result.dataresponse.ar_accbudget_name:'NONE')
	form.setValue(obj.cbo_ar_coa_id, result.dataresponse.ar_coa_name!=='--NULL--' ? result.dataresponse.ar_coa_id : '--NULL--', result.dataresponse.ar_coa_name!=='--NULL--'?result.dataresponse.ar_coa_name:'NONE')

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
	rowdata = {
		data: data,
		rowid: form.rowid
	}

	if (typeof hnd.form_datasaved == 'function') {
		hnd.form_datasaved(result, rowdata, options);
	}
}



async function form_deleting(data) {
	if (typeof hnd.form_deleting == 'function') {
		hnd.form_deleting(data);
	}
}

async function form_deleted(result, options) {
	$ui.getPages().show('pnl_list')
	$ui.getPages().ITEMS['pnl_list'].handler.removerow(form.rowid)

	if (typeof hnd.form_deleted == 'function') {
		hnd.form_deleted(result, options);
	}
}




