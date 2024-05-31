let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;


	obj.chk_partnertype_isempl.checkbox({ onChange: (checked) => { chk_partnertype_isempl_changed(checked) }});
	obj.chk_partnertype_isdefname.checkbox({ onChange: (checked) => { chk_partnertype_isdefname_changed(checked) }});

	
}


export function form_newdata(data, options) {

	data.partnertype_isdefname = '1';

	options.OnNewData = () => {
		chk_partnertype_isempl_changed();
		chk_partnertype_isdefname_changed();
	}
}

export function form_dataopened(result, options) {
	chk_partnertype_isempl_changed();
	chk_partnertype_isdefname_changed();
}


export function cbo_empl_id_dataloading(criteria, options) {
	criteria.enabled = 1;
}


export function cbo_partnertype_id_selected(value, display, record, args) {
	form.setValue(obj.chk_partnertype_isempl, toBool(record.partnertype_isempl));
	chk_partnertype_isempl_changed();
	chk_partnertype_isdefname_changed();
}

export function cbo_empl_id_selected(value, display, record, args) {

	form.setValue(obj.txt_partner_name, record.empl_name);
	form.setValue(obj.txt_partner_addressline1, record.empl_addressline1);
	form.setValue(obj.txt_partner_addressline2, record.empl_addressline2);
	form.setValue(obj.txt_partner_addressline3, record.empl_addressline3);
	form.setValue(obj.txt_partner_city, record.empl_city);
	form.setValue(obj.txt_partner_postcode, record.empl_postcode);
	form.setValue(obj.cbo_partner_country, record.country_id, record.country_name);
	form.setValue(obj.txt_partner_phone, record.empl_phone);
	form.setValue(obj.txt_partner_mobilephone, record.empl_mobilephone);
	form.setValue(obj.txt_partner_email, record.empl_email);

	form.setValue(obj.chk_partnertype_isdefname, false);


	form.setValue(obj.txt_partner_npwp, record.empl_npwp);
	if (record.empl_npwp.length<5) {
		form.setValue(obj.chk_partner_isnonnpwp, true);
	} else {
		form.setValue(obj.chk_partner_isnonnpwp, false);
	}

}
	


function chk_partnertype_isempl_changed(checked) {
	var promptMandatory = form.getDefaultPrompt(true)
	var promptOptional = form.getDefaultPrompt(false)

	if (checked===undefined) {
		checked = form.getValue(obj.chk_partnertype_isempl);
	}

	if (checked) {
		// employe: mandatory
		// txt_partner_phone: optional
		// txt_partner_mobilephone: mandatory

		$('.employee').show();

		var isdefname = false;
		var partner_name = obj.txt_partner_name.textbox('getText');
		var empl_name = obj.cbo_empl_id.combo('getText');
		if (partner_name.trim()!=='' && (partner_name!=empl_name)) {
			isdefname = true;
		}

		form.setValue(obj.chk_partnertype_isdefname, isdefname);
		form.setDisable(obj.cbo_empl_id, false)
		obj.cbo_empl_id.revalidate(mandatoryValidation('pnl_edit-cbo_empl_id', 'Employee harus diisi'));
		obj.txt_partner_phone.revalidate({required: false, invalidMessage: null}); // optional
		obj.txt_partner_mobilephone.revalidate({required: true, invalidMessage: 'HP harus diisi'}); // mandatory

		if (!form.isEventSuspended()) {
			form.setValue(obj.cbo_empl_id, promptMandatory.value, promptMandatory.text);
		}

	} else {
		// employe: no need
		// txt_partner_phone: mandatory
		// txt_partner_mobilephone: optional

		$('.employee').hide();

		form.setValue(obj.chk_partnertype_isdefname, true);
		form.setDisable(obj.cbo_empl_id, true)
		obj.cbo_empl_id.revalidate(optionalValidation());
		obj.txt_partner_phone.revalidate({required: true, invalidMessage: 'Phone harus diisi'}); // mandatory
		obj.txt_partner_mobilephone.revalidate({required: false, invalidMessage: null}); // optional

		if (!form.isEventSuspended()) {
			form.setValue(obj.cbo_empl_id, promptOptional.value, promptOptional.text);
		};
	}
}


function chk_partnertype_isdefname_changed(checked) {
	if (checked===undefined) {
		checked = form.getValue(obj.chk_partnertype_isdefname);
	}

	if (checked) {
		$('#pnl_edit-partner_name').show();
	} else {
		$('#pnl_edit-partner_name').hide();
	}
}


function toBool(value) {
	return value==1 ? true : false;
}
	
function optionalValidation() {
	return {
		required: false, invalidMessage: null, prompt: form.getDefaultPrompt(false).text,
		validType: null,
	}
}	

function mandatoryValidation(elid, invalidmessage) {
	return {
		required: true, invalidMessage:  invalidmessage, prompt: form.getDefaultPrompt(true).text,
		validType: `requiredcombo['${elid}']`
	}
}