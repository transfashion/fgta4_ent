import {fgta4grid} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4grid.mjs'
import {fgta4form} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4form.mjs'
import * as fgta4pages from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4pages.mjs'
import * as fgta4pageslider from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4pageslider.mjs'
import * as settings from './site.settings.mjs'
import * as apis from './site.apis.mjs'
import * as pList from './site-list.mjs'
import * as pEdit from './site-edit.mjs'
import * as pEditUnitgrid from './site-unitgrid.mjs'
import * as pEditUnitform from './site-unitform.mjs'
import * as pEditMappinggrid from './site-mappinggrid.mjs'
import * as pEditMappingform from './site-mappingform.mjs'
import * as pEditEventgrid from './site-eventgrid.mjs'
import * as pEditEventform from './site-eventform.mjs'
import * as pEditRefgrid from './site-refgrid.mjs'
import * as pEditRefform from './site-refform.mjs'



const pnl_list = $('#pnl_list')
const pnl_edit = $('#pnl_edit')
const pnl_editunitgrid = $('#pnl_editunitgrid')
const pnl_editunitform = $('#pnl_editunitform')
const pnl_editmappinggrid = $('#pnl_editmappinggrid')
const pnl_editmappingform = $('#pnl_editmappingform')
const pnl_editeventgrid = $('#pnl_editeventgrid')
const pnl_editeventform = $('#pnl_editeventform')
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
			{panel: pnl_editunitgrid, handler: pEditUnitgrid},
			{panel: pnl_editunitform, handler: pEditUnitform},
			{panel: pnl_editmappinggrid, handler: pEditMappinggrid},
			{panel: pnl_editmappingform, handler: pEditMappingform},
			{panel: pnl_editeventgrid, handler: pEditEventgrid},
			{panel: pnl_editeventform, handler: pEditEventform},
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