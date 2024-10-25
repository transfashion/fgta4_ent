import {fgta4grid} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4grid.mjs'
import {fgta4form} from  '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4form.mjs'
import * as fgta4pages from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4pages.mjs'
import * as fgta4pageslider from '../../../../../index.php/asset/fgta/framework/fgta4libs/fgta4pageslider.mjs'
import * as settings from './itemstockperiode.settings.mjs'
import * as apis from './itemstockperiode.apis.mjs'
import * as pList from './itemstockperiode-list.mjs'
import * as pEdit from './itemstockperiode-edit.mjs'
import * as pEditCostgrid from './itemstockperiode-costgrid.mjs'
import * as pEditCostform from './itemstockperiode-costform.mjs'
import * as pEditSaldogrid from './itemstockperiode-saldogrid.mjs'
import * as pEditSaldoform from './itemstockperiode-saldoform.mjs'



const pnl_list = $('#pnl_list')
const pnl_edit = $('#pnl_edit')
const pnl_editcostgrid = $('#pnl_editcostgrid')
const pnl_editcostform = $('#pnl_editcostform')
const pnl_editsaldogrid = $('#pnl_editsaldogrid')
const pnl_editsaldoform = $('#pnl_editsaldoform')



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
			{panel: pnl_editcostgrid, handler: pEditCostgrid},
			{panel: pnl_editcostform, handler: pEditCostform},
			{panel: pnl_editsaldogrid, handler: pEditSaldogrid},
			{panel: pnl_editsaldoform, handler: pEditSaldoform}			
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