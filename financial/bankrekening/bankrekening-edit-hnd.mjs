let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;

	obj.chk_bankrekening_isdisabled.checkbox({ onChange: (checked) => { chk_bankrekening_isdisabled_changed(checked) }});
	
}

	

function  chk_bankrekening_isdisabled_changed(checked) {
	if (checked===undefined) {
		checked = form.getValue(obj.chk_bankrekening_isdisabled);
	}

	// tampilkan field depresiasi
	var fields = document.querySelectorAll('.nonactive');
	for (var el of fields) {
		if (checked) {
			el.classList.remove('hidden');
		} else {
			el.classList.add('hidden');
		}
	}
}
	