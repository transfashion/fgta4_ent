var this_page_id;
var this_page_options;

import {fgta4slideselect} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4slideselect.mjs'

const reload_header_modified = true;


const txt_title = $('#pnl_editaccountform-title')
const btn_edit = $('#pnl_editaccountform-btn_edit')
const btn_save = $('#pnl_editaccountform-btn_save')
const btn_delete = $('#pnl_editaccountform-btn_delete')
const btn_prev = $('#pnl_editaccountform-btn_prev')
const btn_next = $('#pnl_editaccountform-btn_next')
const btn_addnew = $('#pnl_editaccountform-btn_addnew')
const chk_autoadd = $('#pnl_editaccountform-autoadd')


const pnl_form = $('#pnl_editaccountform-form')
const obj = {
	txt_partnertypeaccbudget_id: $('#pnl_editaccountform-txt_partnertypeaccbudget_id'),
	cbo_projectmodel_id: $('#pnl_editaccountform-cbo_projectmodel_id'),
	cbo_unbill_accbudget_id: $('#pnl_editaccountform-cbo_unbill_accbudget_id'),
	cbo_unbill_coa_id: $('#pnl_editaccountform-cbo_unbill_coa_id'),
	cbo_payable_accbudget_id: $('#pnl_editaccountform-cbo_payable_accbudget_id'),
	cbo_payable_coa_id: $('#pnl_editaccountform-cbo_payable_coa_id'),
	cbo_arunbill_accbudget_id: $('#pnl_editaccountform-cbo_arunbill_accbudget_id'),
	cbo_arunbill_coa_id: $('#pnl_editaccountform-cbo_arunbill_coa_id'),
	cbo_ar_accbudget_id: $('#pnl_editaccountform-cbo_ar_accbudget_id'),
	cbo_ar_coa_id: $('#pnl_editaccountform-cbo_ar_coa_id'),
	txt_partnertype_id: $('#pnl_editaccountform-txt_partnertype_id')
}


let form;
let header_data;



export async function init(opt) {
	this_page_id = opt.id
	this_page_options = opt;

	
	form = new global.fgta4form(pnl_form, {
		primary: obj.txt_partnertypeaccbudget_id,
		autoid: true,
		logview: 'mst_partnertypeaccbudget',
		btn_edit: btn_edit,
		btn_save: btn_save,
		btn_delete: btn_delete,		
		objects : obj,
		OnDataSaving: async (data, options) => { await form_datasaving(data, options) },
		OnDataSaved: async (result, options) => {  await form_datasaved(result, options) },
		OnDataDeleting: async (data, options) => { await form_deleting(data, options) },
		OnDataDeleted: async (result, options) => { await form_deleted(result, options) },
		OnIdSetup : (options) => { form_idsetup(options) },
		OnViewModeChanged : (viewonly) => { form_viewmodechanged(viewonly) }
	});
	form.getHeaderData = () => {
		return header_data;
	}	

	form.AllowAddRecord = true
	form.AllowRemoveRecord = true
	form.AllowEditRecord = true
	form.CreateRecordStatusPage(this_page_id)
	form.CreateLogPage(this_page_id)





	obj.cbo_projectmodel_id.name = 'pnl_editaccountform-cbo_projectmodel_id'		
	new fgta4slideselect(obj.cbo_projectmodel_id, {
		title: 'Pilih projectmodel_id',
		returnpage: this_page_id,
		api: $ui.apis.load_projectmodel_id,
		fieldValue: 'projectmodel_id',
		fieldDisplay: 'projectmodel_name',
		fields: [
			{mapping: 'projectmodel_id', text: 'projectmodel_id'},
			{mapping: 'projectmodel_name', text: 'projectmodel_name'}
		],

	})				
			
	obj.cbo_unbill_accbudget_id.name = 'pnl_editaccountform-cbo_unbill_accbudget_id'		
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
			
	obj.cbo_unbill_coa_id.name = 'pnl_editaccountform-cbo_unbill_coa_id'		
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
			
	obj.cbo_payable_accbudget_id.name = 'pnl_editaccountform-cbo_payable_accbudget_id'		
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
			
	obj.cbo_payable_coa_id.name = 'pnl_editaccountform-cbo_payable_coa_id'		
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
			
	obj.cbo_arunbill_accbudget_id.name = 'pnl_editaccountform-cbo_arunbill_accbudget_id'		
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
			
	obj.cbo_arunbill_coa_id.name = 'pnl_editaccountform-cbo_arunbill_coa_id'		
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
			
	obj.cbo_ar_accbudget_id.name = 'pnl_editaccountform-cbo_ar_accbudget_id'		
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
			
	obj.cbo_ar_coa_id.name = 'pnl_editaccountform-cbo_ar_coa_id'		
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
			


	btn_addnew.linkbutton({ onClick: () => { btn_addnew_click() }  })
	btn_prev.linkbutton({ onClick: () => { btn_prev_click() } })
	btn_next.linkbutton({ onClick: () => { btn_next_click() } })

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
	
	document.addEventListener('OnButtonBack', (ev) => {
		if ($ui.getPages().getCurrentPage()==this_page_id) {
			ev.detail.cancel = true;
			if (form.isDataChanged()) {
				form.canceledit(()=>{
					$ui.getPages().show('pnl_editaccountgrid', ()=>{
						form.setViewMode()
						$ui.getPages().ITEMS['pnl_editaccountgrid'].handler.scrolllast()
					})					
				})
			} else {
				$ui.getPages().show('pnl_editaccountgrid', ()=>{
					form.setViewMode()
					$ui.getPages().ITEMS['pnl_editaccountgrid'].handler.scrolllast()
				})
			}
		
		}		
	})

	document.addEventListener('OnButtonHome', (ev) => {
		if ($ui.getPages().getCurrentPage()==this_page_id) {
			ev.detail.cancel = true;
		}
	})

	document.addEventListener('OnSizeRecalculated', (ev) => {
		OnSizeRecalculated(ev.detail.width, ev.detail.height)
	})
	
	
	document.addEventListener('OnViewModeChanged', (ev) => {
		if (ev.detail.viewmode===true) {
			form.lock(true)
			btn_addnew.allow = false
			btn_addnew.linkbutton('disable')
			chk_autoadd.attr("disabled", true);	
			chk_autoadd.prop("checked", false);			
		} else {
			form.lock(false)
			btn_addnew.allow = true
			btn_addnew.linkbutton('enable')
			chk_autoadd.removeAttr("disabled");
			chk_autoadd.prop("checked", false);
		}
	})



}


export function OnSizeRecalculated(width, height) {
}


export function getForm() {
	return form
}

export function open(data, rowid, hdata) {
	// console.log(header_data)
	txt_title.html(hdata.partnertype_name)
	header_data = hdata

	var pOpt = form.getDefaultPrompt(false)
	var fn_dataopening = async (options) => {
		options.api = `${global.modulefullname}/account-open`
		options.criteria[form.primary.mapping] = data[form.primary.mapping]
	}

	var fn_dataopened = async (result, options) => {
		var record = result.record;
		updatefilebox(result.record);
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
		form.SuspendEvent(true);
		form
			.fill(record)
			.setValue(obj.cbo_projectmodel_id, record.projectmodel_id, record.projectmodel_name)
			.setValue(obj.cbo_unbill_accbudget_id, record.unbill_accbudget_id, record.unbill_accbudget_name)
			.setValue(obj.cbo_unbill_coa_id, record.unbill_coa_id, record.unbill_coa_name)
			.setValue(obj.cbo_payable_accbudget_id, record.payable_accbudget_id, record.payable_accbudget_name)
			.setValue(obj.cbo_payable_coa_id, record.payable_coa_id, record.payable_coa_name)
			.setValue(obj.cbo_arunbill_accbudget_id, record.arunbill_accbudget_id, record.arunbill_accbudget_name)
			.setValue(obj.cbo_arunbill_coa_id, record.arunbill_coa_id, record.arunbill_coa_name)
			.setValue(obj.cbo_ar_accbudget_id, record.ar_accbudget_id, record.ar_accbudget_name)
			.setValue(obj.cbo_ar_coa_id, record.ar_coa_id, record.ar_coa_name)
			.setViewMode()
			.rowid = rowid



		/* tambahkan event atau behaviour saat form dibuka
		   apabila ada rutin mengubah form dan tidak mau dijalankan pada saat opening,
		   cek dengan form.isEventSuspended()
		*/ 
		


		form.commit()
		form.SuspendEvent(false);


		// Editable
		if (form.AllowEditRecord!=true) {
			btn_edit.hide();
			btn_save.hide();
			btn_delete.hide();
		}
		

		// tambah baris
		if (form.AllowAddRecord) {
			btn_addnew.show()
		} else {
			btn_addnew.hide()
		}	

		// hapus baris
		if (form.AllowRemoveRecord) {
			btn_delete.show()
		} else {
			btn_delete.hide()
		}

		var prevnode = $(`#${rowid}`).prev()
		if (prevnode.length>0) {
			btn_prev.linkbutton('enable')
		} else {
			btn_prev.linkbutton('disable')
		}

		var nextode = $(`#${rowid}`).next()
		if (nextode.length>0) {
			btn_next.linkbutton('enable')
		} else {
			btn_next.linkbutton('disable')
		}		
	}

	var fn_dataopenerror = (err) => {
		$ui.ShowMessage('[ERROR]'+err.errormessage);
	}

	form.dataload(fn_dataopening, fn_dataopened, fn_dataopenerror)	
}

export function createnew(hdata) {
	header_data = hdata

	txt_title.html('Create New Row')
	form.createnew(async (data, options)=>{
		data.partnertype_id= hdata.partnertype_id
		data.account_value = 0


		data.projectmodel_id = '0'
		data.projectmodel_name = '-- PILIH --'
		data.unbill_accbudget_id = '0'
		data.unbill_accbudget_name = '-- PILIH --'
		data.unbill_coa_id = '0'
		data.unbill_coa_name = '-- PILIH --'
		data.payable_accbudget_id = '0'
		data.payable_accbudget_name = '-- PILIH --'
		data.payable_coa_id = '0'
		data.payable_coa_name = '-- PILIH --'
		data.arunbill_accbudget_id = '0'
		data.arunbill_accbudget_name = '-- PILIH --'
		data.arunbill_coa_id = '0'
		data.arunbill_coa_name = '-- PILIH --'
		data.ar_accbudget_id = '0'
		data.ar_accbudget_name = '-- PILIH --'
		data.ar_coa_id = '0'
		data.ar_coa_name = '-- PILIH --'




		form.rowid = null
		options.OnCanceled = () => {
			$ui.getPages().show('pnl_editaccountgrid')
		}
	})
}


async function form_datasaving(data, options) {
	options.api = `${global.modulefullname}/account-save`

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

		
}

async function form_datasaved(result, options) {
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
	form.rowid = $ui.getPages().ITEMS['pnl_editaccountgrid'].handler.updategrid(data, form.rowid)

	var autoadd = chk_autoadd.prop("checked")
	if (autoadd) {
		setTimeout(()=>{
			btn_addnew_click()
		}, 1000)
	}

	if (reload_header_modified) {
		var currentRowdata =  $ui.getPages().ITEMS['pnl_edit'].handler.getCurrentRowdata();
		$ui.getPages().ITEMS['pnl_edit'].handler.open(currentRowdata.data, currentRowdata.rowid, false, (err, data)=>{
			$ui.getPages().ITEMS['pnl_list'].handler.updategrid(data, currentRowdata.rowid);
		});	
	}

	

}

async function form_deleting(data, options) {
	options.api = `${global.modulefullname}/account-delete`
	
}

async function form_deleted(result, options) {
	options.suppressdialog = true
	$ui.getPages().show('pnl_editaccountgrid', ()=>{
		$ui.getPages().ITEMS['pnl_editaccountgrid'].handler.removerow(form.rowid)
	});

	if (reload_header_modified) {
		var currentRowdata =  $ui.getPages().ITEMS['pnl_edit'].handler.getCurrentRowdata();
		$ui.getPages().ITEMS['pnl_edit'].handler.open(currentRowdata.data, currentRowdata.rowid, false, (err, data)=>{
			$ui.getPages().ITEMS['pnl_list'].handler.updategrid(data, currentRowdata.rowid);
		});	
	}

	
	
}

function updatefilebox(record) {
	// apabila ada keperluan untuk menampilkan data dari object storage

}

function form_viewmodechanged(viewonly) {
	if (viewonly) {
		btn_prev.linkbutton('enable')
		btn_next.linkbutton('enable')
		if (btn_addnew.allow) {
			btn_addnew.linkbutton('enable')
		} else {
			btn_addnew.linkbutton('disable')
		}
	} else {
		btn_prev.linkbutton('disable')
		btn_next.linkbutton('disable')
		btn_addnew.linkbutton('disable')
	}
}


function form_idsetup(options) {
	var objid = obj.txt_partnertypeaccbudget_id
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

function btn_addnew_click() {
	createnew(header_data)
}


function btn_prev_click() {
	var prevode = $(`#${form.rowid}`).prev()
	if (prevode.length==0) {
		return
	} 
	
	var trid = prevode.attr('id')
	var dataid = prevode.attr('dataid')
	var record = $ui.getPages().ITEMS['pnl_editaccountgrid'].handler.getGrid().DATA[dataid]

	if (form.isDataChanged()) {
		var datachangemessage = form.getDataChangeMessage();
		$ui.ShowMessage(datachangemessage, {
			"Ya" : () => {
				open(record, trid, header_data);
			},
			"Tidak" : () => {}
		})
	} else {
		open(record, trid, header_data);
	}
}

function btn_next_click() {
	var nextode = $(`#${form.rowid}`).next()
	if (nextode.length==0) {
		return
	} 

	var trid = nextode.attr('id')
	var dataid = nextode.attr('dataid')
	var record = $ui.getPages().ITEMS['pnl_editaccountgrid'].handler.getGrid().DATA[dataid]

	if (form.isDataChanged()) {
		var datachangemessage = form.getDataChangeMessage();
		$ui.ShowMessage(datachangemessage, {
			"Ya" : () => {
				open(record, trid, header_data);
			},
			"Tidak" : () => {}
		})
	} else {
		open(record, trid, header_data);
	}
}