<?php namespace FGTA4\apis;

if (!defined('FGTA4')) {
	die('Forbiden');
}

require_once __ROOT_DIR.'/core/sqlutil.php';
require_once __DIR__ . '/xapi.base.php';

if (is_file(__DIR__ .'/data-header-handler.php')) {
	require_once __DIR__ .'/data-header-handler.php';
}



use \FGTA4\exceptions\WebException;


$API = new class extends itemgroupBase {

	public function execute($options) {

		$userdata = $this->auth->session_get_user();

		try {
		
			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "list", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			$dept_id = $options->criteria->dept_id;
			$dept = \FGTA4\utils\SqlUtility::LookupRow($dept_id, $this->db, 'mst_dept', 'dept_id');
			$deptmodel_id = $dept['deptmodel_id'];

			$options->criteria->deptmodel_id = $deptmodel_id;
			$criteriaValues = [
				"search" => " A.itemgroup_id LIKE CONCAT('%', :search, '%') OR A.itemgroup_name LIKE CONCAT('%', :search, '%') OR A.itemgroup_nameshort LIKE CONCAT('%', :search, '%') ",
				"dept_id" => null,
				'deptmodel_id' => ' B.deptmodel_id = :deptmodel_id ',
			];


			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			
			$maxrow = 30;
			$offset = (property_exists($options, 'offset')) ? $options->offset : 0;


			/* Data Query Configuration */
			$sqlFieldList = [
				'itemgroup_id' => 'A.`itemgroup_id`', 'itemgroup_name' => 'A.`itemgroup_name`', 'itemgroup_nameshort' => 'A.`itemgroup_nameshort`', 'itemgroup_descr' => 'A.`itemgroup_descr`',
				'itemgroup_parent' => 'A.`itemgroup_parent`', 'itemgroup_isparent' => 'A.`itemgroup_isparent`', 'itemgroup_isexselect' => 'A.`itemgroup_isexselect`', 'dept_id' => 'A.`dept_id`',
				'itemgroup_pathid' => 'A.`itemgroup_pathid`', 'itemgroup_path' => 'A.`itemgroup_path`', 'itemgroup_level' => 'A.`itemgroup_level`', '_createby' => 'A.`_createby`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "mst_itemgroup A left join mst_dept B on A.dept_id = B.dept_id";
			$sqlWhere = $where->sql;
			$sqlLimit = "LIMIT $maxrow OFFSET $offset";

			// filter select columns
			if (!property_exists($options, 'selectFields')) {
				$options->selectFields = [];
			}
			$columsSelected = $this->SelectColumns($sqlFieldList, $options->selectFields);
			$sqlFields = \FGTA4\utils\SqlUtility::generateSqlSelectFieldList($columsSelected);


			/* Sort Configuration */
			if (!property_exists($options, 'sortData')) {
				$options->sortData = [];
			}
			if (!is_array($options->sortData)) {
				if (is_object($options->sortData)) {
					$options->sortData = (array)$options->sortData;
				} else {
					$options->sortData = [];
				}
			}

			$sqlOrders = \FGTA4\utils\SqlUtility::generateSqlSelectSort($options->sortData);


			/* Compose SQL Query */
			$sqlCount = "select count(*) as n from $sqlFromTable $sqlWhere";
			$sqlData = "
				select 
				$sqlFields 
				from 
				$sqlFromTable 
				$sqlWhere 
				$sqlOrders 
				$sqlLimit
			";

			/* Execute Query: Count */
			$stmt = $this->db->prepare($sqlCount );
			$stmt->execute($where->params);
			$row  = $stmt->fetch(\PDO::FETCH_ASSOC);
			$total = (float) $row['n'];

			/* Execute Query: Retrieve Data */
			$stmt = $this->db->prepare($sqlData);
			$stmt->execute($where->params);
			$rows  = $stmt->fetchall(\PDO::FETCH_ASSOC);


			/* Proces result */
			$records = [];
			foreach ($rows as $row) {
				$record = [];
				foreach ($row as $key => $value) {
					$record[$key] = $value;
				}


				/*
				$record = array_merge($record, [
					// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
					//'tanggal' => date("d/m/y", strtotime($record['tanggal'])),
				 	//'tambahan' => 'dta'
					'itemgroup_parent_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemgroup_parent'], $this->db, 'mst_itemgroup', 'itemgroup_id', 'itemgroup_name'),
					'dept_name' => \FGTA4\utils\SqlUtility::Lookup($record['dept_id'], $this->db, 'mst_dept', 'dept_id', 'dept_name'),
					 
				]);
				*/


				// lookup data id yang refer ke table lain
				$this->addFields('itemgroup_parent_name', 'itemgroup_parent', $record, 'mst_itemgroup', 'itemgroup_name', 'itemgroup_id');
				$this->addFields('dept_name', 'dept_id', $record, 'mst_dept', 'dept_name', 'dept_id');


				$record['_id'] = $record['itemgroup_id'];
				array_push($records, $record);
			}

			// kembalikan hasilnya
			$result = new \stdClass; 
			$result->total = $total;
			$result->offset = $offset + $maxrow;
			$result->maxrow = $maxrow;
			$result->records = $records;
			return $result;
		} catch (\Exception $ex) {
			throw $ex;
		}
	}

};