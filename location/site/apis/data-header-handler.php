<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}



class site_headerHandler extends WebAPI  {

	private $options;
	private $list_by_brand_id;

	function __construct($options) {
		$this->options = $options;
	}

	public function buildListCriteriaValues(object &$options, array &$criteriaValues) : void {
		// if (is_array($options->criteria)) {
		// 	$options->criteria = (object)$options->criteria;
		// }
		


		if (property_exists($options->criteria, 'getcityid')) {
			$this->getcityid = true;
			unset($options->criteria->getcityid);
		}




		if (property_exists($options->criteria, 'brand_id')) {
			$this->list_by_brand_id = $options->criteria->brand_id;
			$criteriaValues['brand_id'] = " B.brand_id  = :brand_id ";
		}
		

		$criteriaValues['site_isdisabled'] = " A.site_isdisabled = :site_isdisabled ";
	}


	public function prepareListData(object $options, array $criteriaValues) : void {

	}

	public function SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void {
		if (property_exists($this, 'getcityid')) {
			if ($this->getcityid) {
				$sqlFieldList['city_id'] = 'C.`city_id`';
				$sqlFieldList['city_name'] = 'C.`city_name`';
				$sqlFromTable = "
					mst_site A inner join mst_land B on B.land_id=A.land_id
				               inner join mst_city C on C.city_id=B.city_id
				";
			}
		} else if (property_exists($this, 'list_by_brand_id')) {
			$brand_id = $this->list_by_brand_id;
			if ($brand_id!=null) {
				$sqlFromTable = "
					mst_brand B inner join mst_siteunit C on C.unit_id = B.unit_id inner join mst_site A on A.site_id = C.site_id 
				";
			}
			
		}

		
	}

	
	public function DataListLooping(array &$record) : void {
		if (property_exists($this->options, 'load_branch_id')) {
			if ($this->options->load_branch_id) {
				$site_id = $record['site_id'];
				
				$sql = "select siteref_code as branch_id from mst_siteref where site_id = :site_id and interface_id='TB' and siteref_name='branch_id'";
				$stmt = $this->db->prepare($sql);
				$stmt->execute([':site_id'=>$site_id]);
				$row = $stmt->fetch();
				if ($row!=null) {
					$record['branch_id'] = $row->branch_id;
				}
			}
		}
	}	
	
	
}		
		
		
		