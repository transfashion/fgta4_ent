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

/**
 * ent/organisation/dept/apis/list.php
 *
 * ========
 * DataList
 * ========
 * Menampilkan data-data pada tabel header dept (mst_dept)
 * sesuai dengan parameter yang dikirimkan melalui variable $option->criteria
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 02/09/2024
 */
$API = new class extends deptBase {

	public function execute($options) {

		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\dept_headerHandler";
		if (class_exists($handlerclassname)) {
			$hnd = new dept_headerHandler($options);
			$hnd->caller = &$this;
			$hnd->db = $this->db;
			$hnd->auth = $this->auth;
			$hnd->reqinfo = $this->reqinfo;
		} else {
			$hnd = new \stdClass;
		}


		try {
		
			// cek apakah user boleh mengeksekusi API ini
			if (!$this->RequestIsAllowedFor($this->reqinfo, "list", $userdata->groups)) {
				throw new \Exception('your group authority is not allowed to do this action.');
			}

			if (method_exists(get_class($hnd), 'init')) {
				// init(object &$options) : void
				$hnd->init($options);
			}

			$criteriaValues = [
				"search" => " A.dept_id LIKE CONCAT('%', :search, '%') OR A.dept_name LIKE CONCAT('%', :search, '%') "
			];

			if (method_exists(get_class($hnd), 'buildListCriteriaValues')) {
				// ** buildListCriteriaValues(object &$options, array &$criteriaValues) : void
				//    apabila akan modifikasi parameter2 untuk query
				//    $criteriaValues['fieldname'] = " A.fieldname = :fieldname";  <-- menambahkan field pada where dan memberi parameter value
				//    $criteriaValues['fieldname'] = "--";                         <-- memberi parameter value tanpa menambahkan pada where
				//    $criteriaValues['fieldname'] = null                          <-- tidak memberi efek pada query secara langsung, parameter digunakan untuk keperluan lain 
				//
				//    untuk memberikan nilai default apabila paramter tidak dikirim
				//    // \FGTA4\utils\SqlUtility::setDefaultCriteria($options->criteria, '--fieldscriteria--', '--value--');
				$hnd->buildListCriteriaValues($options, $criteriaValues);
			}

			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			
			$maxrow = 30;
			$offset = (property_exists($options, 'offset')) ? $options->offset : 0;

			/* prepare DbLayer Temporay Data Helper if needed */
			if (method_exists(get_class($hnd), 'prepareListData')) {
				// ** prepareListData(object $options, array $criteriaValues) : void
				//    misalnya perlu mebuat temporary table,
				//    untuk membuat query komplex dapat dibuat disini	
				$hnd->prepareListData($options, $criteriaValues);
			}


			/* Data Query Configuration */
			$sqlFieldList = [
				'dept_id' => 'A.`dept_id`', 'deptdegree_id' => 'A.`deptdegree_id`', 'dept_name' => 'A.`dept_name`', 'dept_descr' => 'A.`dept_descr`',
				'deptgroup_id' => 'A.`deptgroup_id`', 'unit_id' => 'A.`unit_id`', 'depttype_id' => 'A.`depttype_id`', 'deptmodel_id' => 'A.`deptmodel_id`',
				'authlevel_id' => 'A.`authlevel_id`', 'dept_isdisabled' => 'A.`dept_isdisabled`', 'dept_isitemdefiner' => 'A.`dept_isitemdefiner`', 'dept_isassetowner' => 'A.`dept_isassetowner`',
				'dept_isassetmaintainer' => 'A.`dept_isassetmaintainer`', 'dept_isstockowner' => 'A.`dept_isstockowner`', 'dept_isnonitemowner' => 'A.`dept_isnonitemowner`', 'dept_ispartnerselect' => 'A.`dept_ispartnerselect`',
				'dept_isbudgetmandatory' => 'A.`dept_isbudgetmandatory`', 'dept_issingleprojectbudget' => 'A.`dept_issingleprojectbudget`', '_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "mst_dept A";
			$sqlWhere = $where->sql;
			$sqlLimit = "LIMIT $maxrow OFFSET $offset";

			if (method_exists(get_class($hnd), 'SqlQueryListBuilder')) {
				// ** SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void
				//    menambah atau memodifikasi field-field yang akan ditampilkan
				//    apabila akan memodifikasi join table
				//    apabila akan memodifikasi nilai parameter
				$hnd->SqlQueryListBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
			}
			
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

		


			if (method_exists(get_class($hnd), 'sortListOrder')) {
				// ** sortListOrder(array &$sortData) : void
				//    jika ada keperluan mengurutkan data
				//    $sortData['fieldname'] = 'ASC/DESC';
				$hnd->sortListOrder($options->sortData);
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


			$handleloop = false;
			if (method_exists(get_class($hnd), 'DataListLooping')) {
				$handleloop = true;
			}

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
					'deptdegree_name' => \FGTA4\utils\SqlUtility::Lookup($record['deptdegree_id'], $this->db, 'mst_deptdegree', 'deptdegree_id', 'deptdegree_name'),
					'deptgroup_name' => \FGTA4\utils\SqlUtility::Lookup($record['deptgroup_id'], $this->db, 'mst_deptgroup', 'deptgroup_id', 'deptgroup_name'),
					'unit_name' => \FGTA4\utils\SqlUtility::Lookup($record['unit_id'], $this->db, 'mst_unit', 'unit_id', 'unit_name'),
					'depttype_name' => \FGTA4\utils\SqlUtility::Lookup($record['depttype_id'], $this->db, 'mst_depttype', 'depttype_id', 'depttype_name'),
					'deptmodel_name' => \FGTA4\utils\SqlUtility::Lookup($record['deptmodel_id'], $this->db, 'mst_deptmodel', 'deptmodel_id', 'deptmodel_name'),
					'authlevel_name' => \FGTA4\utils\SqlUtility::Lookup($record['authlevel_id'], $this->db, 'mst_authlevel', 'authlevel_id', 'authlevel_name'),
					 
				]);
				*/


				// lookup data id yang refer ke table lain
				$this->addFields('deptdegree_name', 'deptdegree_id', $record, 'mst_deptdegree', 'deptdegree_name', 'deptdegree_id');
				$this->addFields('deptgroup_name', 'deptgroup_id', $record, 'mst_deptgroup', 'deptgroup_name', 'deptgroup_id');
				$this->addFields('unit_name', 'unit_id', $record, 'mst_unit', 'unit_name', 'unit_id');
				$this->addFields('depttype_name', 'depttype_id', $record, 'mst_depttype', 'depttype_name', 'depttype_id');
				$this->addFields('deptmodel_name', 'deptmodel_id', $record, 'mst_deptmodel', 'deptmodel_name', 'deptmodel_id');
				$this->addFields('authlevel_name', 'authlevel_id', $record, 'mst_authlevel', 'authlevel_name', 'authlevel_id');
					 


				if ($handleloop) {
					// ** DataListLooping(array &$record) : void
					//    apabila akan menambahkan field di record
					$hnd->DataListLooping($record);
				}

				array_push($records, $record);
			}

			/* modify and finalize records */
			if (method_exists(get_class($hnd), 'DataListFinal')) {
				// ** DataListFinal(array &$records) : void
				//    finalisasi data list
				$hnd->DataListFinal($records);
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