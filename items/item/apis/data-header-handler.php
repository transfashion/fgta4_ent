<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class item_headerHandler extends WebAPI  {

	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['dept_id'] = " A.dept_id = :dept_id "; 
	}


}		
		
		
		