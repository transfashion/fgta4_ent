<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class partner_headerHandler extends WebAPI  {


	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['partner_isdisabled'] = " A.partner_isdisabled = :partner_isdisabled ";
	}	

	public function DataSavedSuccess($result) {
		// $this->caller->log('save success');
	}	
}		
		
		
		