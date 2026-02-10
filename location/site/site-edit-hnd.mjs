let editor, form, obj, opt;

export function init(ed) {
	editor = ed;
	form = editor.form;
	obj = editor.obj;
	opt = editor.opt;


	const btnDeploy = document.getElementById('pnl_edit-btn_deploy')
	btnDeploy.addEventListener('click', ()=> {
		btnDeploy_click(form)
	})	



	
}


async function btnDeploy_click(form) {
	if (form.isDataChanged() || !form.isInViewMode()) {
		$ui.ShowMessage('[WARNING]Simpan dulu perubahan data, dan tidak sedang dalam mode edit.');
		return;
	}

	const header_data = form.getData();
	const site_id = header_data.site_id

	console.log('data processing')
	let mask = $ui.mask('wait..');
	try {
		const apiurl = `${global.modulefullname}/deploy-to-transbrowser`
		const args = {site_id: site_id}
		try {
			const result = await $ui.apicall(apiurl, args)


			console.log(result)
			$ui.ShowMessage('[INFO]Data Exported to TransBrowser');
		} catch (err) {
			throw err
		}
	} catch (err) {
		console.error(err);
		$ui.ShowMessage('[ERROR]' + err.message);
	} finally {
		$ui.unmask(mask);
	}
	
}

export function do_other_action(args) {
	console.log(args)
}