<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class dept_headerHandler extends WebAPI  {


	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['dept_isdisabled'] = " A.dept_isdisabled = :dept_isdisabled ";
		$criteriaValues['dept_isassetowner'] = " A.dept_isassetowner = :dept_isassetowner ";
		$criteriaValues['dept_isassetmaintainer'] = " A.dept_isassetmaintainer = :dept_isassetmaintainer ";
		$criteriaValues['dept_isstockowner'] = " A.dept_isstockowner = :dept_isstockowner ";
		$criteriaValues['dept_isnonitemowner'] = " A.dept_isnonitemowner = :dept_isnonitemowner ";
		$criteriaValues['dept_ispartnerselect'] = " A.dept_ispartnerselect = :dept_ispartnerselect ";
		$criteriaValues['dept_isparent'] = " A.dept_isparent = :dept_isparent ";


		// untuk keperluan pilih departemen yang mengelola items
		$criteriaValues['dept_isitemowner'] = " (
			   A.dept_isassetowner=:dept_isitemowner 
			or A.dept_isstockowner=:dept_isitemowner
			or A.dept_isnonitemowner=:dept_isitemowner
			or A.dept_ispartnerselect=:dept_isitemowner
		)";
		$criteriaValues['dept_isitemaintainer'] = " (A.dept_isassetmaintainer=:dept_isitemaintainer)";
	
		// $criteriaValues['dept_isitemmanager'] = " (A.dept_isitemaintainer=:dept_isitemmanager or A.dept_isitemowner=:dept_isitemmanager)";
	}

	public function sortListOrder(array &$sortData) : void {
		$sortData['dept_name'] = 'ASC';
	}

}		
		
		
		