import {fgta4grid} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4grid.mjs'
import {fgta4form} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4form.mjs'
import * as fgta4pages from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4pages.mjs'
import * as fgta4pageslider from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4pageslider.mjs'
import * as settings from './unit.settings.mjs'
import * as apis from './unit.apis.mjs'
import * as pList from './unit-list.mjs'
import * as pEdit from './unit-edit.mjs'
import * as pEditBrandgrid from './unit-brandgrid.mjs'
import * as pEditBrandform from './unit-brandform.mjs'
import * as pEditItemclassgrid from './unit-itemclassgrid.mjs'
import * as pEditItemclassform from './unit-itemclassform.mjs'
import * as pEditRefgrid from './unit-refgrid.mjs'
import * as pEditRefform from './unit-refform.mjs'



const pnl_list = $('#pnl_list')
const pnl_edit = $('#pnl_edit')
const pnl_editbrandgrid = $('#pnl_editbrandgrid')
const pnl_editbrandform = $('#pnl_editbrandform')
const pnl_edititemclassgrid = $('#pnl_edititemclassgrid')
const pnl_edititemclassform = $('#pnl_edititemclassform')
const pnl_editrefgrid = $('#pnl_editrefgrid')
const pnl_editrefform = $('#pnl_editrefform')



var pages = fgta4pages;
var slider = fgta4pageslider;


export const SIZE = {width:0, height:0}


export async function init(opt) {
	// $ui.grd_list = new fgta4grid()
	// $ui.grd_edit = new fgta4grid()

	global.fgta4grid = fgta4grid
	global.fgta4form = fgta4form



	$ui.apis = apis
	document.getElementsByTagName("body")[0].style.margin = '5px 5px 5px 5px'

	opt.variancedata = global.setup.variancedata;
	settings.setup(opt);

	pages
		.setSlider(slider)
		.initPages([
			{panel: pnl_list, handler: pList},
			{panel: pnl_edit, handler: pEdit},
			{panel: pnl_editbrandgrid, handler: pEditBrandgrid},
			{panel: pnl_editbrandform, handler: pEditBrandform},
			{panel: pnl_edititemclassgrid, handler: pEditItemclassgrid},
			{panel: pnl_edititemclassform, handler: pEditItemclassform},
			{panel: pnl_editrefgrid, handler: pEditRefgrid},
			{panel: pnl_editrefform, handler: pEditRefform}			
		], opt)

	$ui.setPages(pages)


	document.addEventListener('OnButtonHome', (ev) => {
		if (ev.detail.cancel) {
			return
		}

		ev.detail.cancel = true;
		ExitModule();
	})
	
	document.addEventListener('OnSizeRecalculated', (ev) => {
		OnSizeRecalculated(ev.detail.width, ev.detail.height)
	})	



	await PreloadData()

}


export function OnSizeRecalculated(width, height) {
	SIZE.width = width
	SIZE.height = height
}

export async function ExitModule() {
	$ui.home();
}



async function PreloadData() {
	
}