<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class brand_headerHandler extends WebAPI  {

	private $options;

	function __construct($options) {
		$this->options = $options;
	}

	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		$criteriaValues['brand_isdisabled'] = " A.brand_isdisabled = :brand_isdisabled ";
	}



	public function DataListLooping(array &$record) : void {
		if (property_exists($this->options, 'load_region_id')) {
			if ($this->options->load_region_id) {
				$brand_id = $record['brand_id'];
				
				$sql = "select brandref_code as region_id from mst_brandref where brand_id = :brand_id and interface_id='TB' and brandref_name='region_id'";
				$stmt = $this->db->prepare($sql);
				$stmt->execute([':brand_id'=>$brand_id]);
				$row = $stmt->fetch();
				if ($row!=null) {
					$record['region_id'] = $row->region_id;
				}
			}
		}
	}

}		
		
		
		