<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class unit_headerHandler extends WebAPI  {
	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['unit_isdisabled'] = " A.unit_isdisabled = :unit_isdisabled";
	}
}		
		
		
		