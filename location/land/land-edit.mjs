var this_page_id;
var this_page_options;

import {fgta4slideselect} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4slideselect.mjs'
import * as hnd from  './land-edit-hnd.mjs'


const btn_edit = $('#pnl_edit-btn_edit')
const btn_save = $('#pnl_edit-btn_save')
const btn_delete = $('#pnl_edit-btn_delete')






const pnl_form = $('#pnl_edit-form')
const obj = {
	txt_land_id: $('#pnl_edit-txt_land_id'),
	txt_land_name: $('#pnl_edit-txt_land_name'),
	txt_land_address: $('#pnl_edit-txt_land_address'),
	txt_land_phone: $('#pnl_edit-txt_land_phone'),
	txt_land_email: $('#pnl_edit-txt_land_email'),
	chk_land_isdisabled: $('#pnl_edit-chk_land_isdisabled'),
	txt_land_geoloc: $('#pnl_edit-txt_land_geoloc'),
	cbo_landtype_id: $('#pnl_edit-cbo_landtype_id'),
	cbo_zone_id: $('#pnl_edit-cbo_zone_id'),
	cbo_city_id: $('#pnl_edit-cbo_city_id'),
	cbo_partner_id: $('#pnl_edit-cbo_partner_id')
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
		primary: obj.txt_land_id,
		autoid: false,
		logview: 'mst_land',
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


	obj.cbo_landtype_id.name = 'pnl_edit-cbo_landtype_id'		
	new fgta4slideselect(obj.cbo_landtype_id, {
		title: 'Pilih landtype_id',
		returnpage: this_page_id,
		api: $ui.apis.load_landtype_id,
		fieldValue: 'landtype_id',
		fieldDisplay: 'landtype_name',
		fields: [
			{mapping: 'landtype_id', text: 'landtype_id'},
			{mapping: 'landtype_name', text: 'landtype_name'}
		],

	})				
				
	obj.cbo_zone_id.name = 'pnl_edit-cbo_zone_id'		
	new fgta4slideselect(obj.cbo_zone_id, {
		title: 'Pilih zone_id',
		returnpage: this_page_id,
		api: $ui.apis.load_zone_id,
		fieldValue: 'zone_id',
		fieldDisplay: 'zone_name',
		fields: [
			{mapping: 'zone_id', text: 'zone_id'},
			{mapping: 'zone_name', text: 'zone_name'}
		],

	})				
				
	obj.cbo_city_id.name = 'pnl_edit-cbo_city_id'		
	new fgta4slideselect(obj.cbo_city_id, {
		title: 'Pilih city_id',
		returnpage: this_page_id,
		api: $ui.apis.load_city_id,
		fieldValue: 'city_id',
		fieldDisplay: 'city_name',
		fields: [
			{mapping: 'city_id', text: 'city_id'},
			{mapping: 'city_name', text: 'city_name'}
		],

	})				
				
	obj.cbo_partner_id.name = 'pnl_edit-cbo_partner_id'		
	new fgta4slideselect(obj.cbo_partner_id, {
		title: 'Pilih partner_id',
		returnpage: this_page_id,
		api: $ui.apis.load_partner_id,
		fieldValue: 'partner_id',
		fieldDisplay: 'partner_name',
		fields: [
			{mapping: 'partner_id', text: 'partner_id'},
			{mapping: 'partner_name', text: 'partner_name'}
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
			.setValue(obj.cbo_landtype_id, record.landtype_id, record.landtype_name)
			.setValue(obj.cbo_zone_id, record.zone_id, record.zone_name)
			.setValue(obj.cbo_city_id, record.city_id, record.city_name)
			.setValue(obj.cbo_partner_id, record.partner_id, record.partner_name)
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
		data.land_isdisabled = '0'

		data.landtype_id = '0'
		data.landtype_name = '-- PILIH --'
		data.zone_id = '0'
		data.zone_name = '-- PILIH --'
		data.city_id = '0'
		data.city_name = '-- PILIH --'
		data.partner_id = '0'
		data.partner_name = '-- PILIH --'

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
	// apabila ada keperluan untuk update state grid list di sini


	if (typeof hnd.form_updategridstate == 'function') {
		hnd.form_updategridstate(record);
	}
}

function form_viewmodechanged(viewmode) {
	var OnViewModeChangedEvent = new CustomEvent('OnViewModeChanged', {detail: {}})
	$ui.triggerevent(OnViewModeChangedEvent, {
		viewmode: viewmode
	})
}

function form_idsetup(options) {
	var objid = obj.txt_land_id
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
	console.log(err)
	if (typeof hnd.form_datasaveerror == 'function') {
		hnd.form_datasaveerror(err, options);
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



