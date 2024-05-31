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
 * ent/affiliation/partnertype/apis/list.php
 *
 * ========
 * DataList
 * ========
 * Menampilkan data-data pada tabel header partnertype (mst_partnertype)
 * sesuai dengan parameter yang dikirimkan melalui variable $option->criteria
 *
 * Agung Nugroho <agung@fgta.net> http://www.fgta.net
 * Tangerang, 26 Maret 2021
 *
 * digenerate dengan FGTA4 generator
 * tanggal 07/09/2022
 */
$API = new class extends partnertypeBase {

	public function execute($options) {

		$userdata = $this->auth->session_get_user();

		$handlerclassname = "\\FGTA4\\apis\\partnertype_headerHandler";
		if (class_exists($handlerclassname)) {
			$hnd = new partnertype_headerHandler($options);
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

			
			$criteriaValues = [
				"search" => " A.partnertype_id LIKE CONCAT('%', :search, '%') OR A.partnertype_name LIKE CONCAT('%', :search, '%') "
			];
			if (is_object($hnd)) {
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
			}

			$where = \FGTA4\utils\SqlUtility::BuildCriteria($options->criteria, $criteriaValues);
			$result = new \stdClass; 
			$maxrow = 30;
			$offset = (property_exists($options, 'offset')) ? $options->offset : 0;

			/* prepare DbLayer Temporay Data Helper if needed */
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'prepareListData')) {
					// ** prepareListData(object $options, array $criteriaValues) : void
					//    misalnya perlu mebuat temporary table,
					//    untuk membuat query komplex dapat dibuat disini	
					$hnd->prepareListData($options, $criteriaValues);
				}
			}


			/* Data Query Configuration */
			$sqlFieldList = [
				'partnertype_id' => 'A.`partnertype_id`', 'partnertype_name' => 'A.`partnertype_name`', 'partnertype_descr' => 'A.`partnertype_descr`', 'partnercategory_id' => 'A.`partnercategory_id`',
				'itemclass_id' => 'A.`itemclass_id`', 'unbill_accbudget_id' => 'A.`unbill_accbudget_id`', 'unbill_coa_id' => 'A.`unbill_coa_id`', 'payable_accbudget_id' => 'A.`payable_accbudget_id`',
				'payable_coa_id' => 'A.`payable_coa_id`', 'arunbill_accbudget_id' => 'A.`arunbill_accbudget_id`', 'arunbill_coa_id' => 'A.`arunbill_coa_id`', 'ar_accbudget_id' => 'A.`ar_accbudget_id`',
				'ar_coa_id' => 'A.`ar_coa_id`', 'partnertype_isempl' => 'A.`partnertype_isempl`', 'partnertype_ishaveae' => 'A.`partnertype_ishaveae`', 'partnertype_ishavecollector' => 'A.`partnertype_ishavecollector`',
				'partnertype_isdisabled' => 'A.`partnertype_isdisabled`', '_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`',
				'_createby' => 'A.`_createby`', '_createdate' => 'A.`_createdate`', '_modifyby' => 'A.`_modifyby`', '_modifydate' => 'A.`_modifydate`'
			];
			$sqlFromTable = "mst_partnertype A";
			$sqlWhere = $where->sql;
			$sqlLimit = "LIMIT $maxrow OFFSET $offset";

			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'SqlQueryListBuilder')) {
					// ** SqlQueryListBuilder(array &$sqlFieldList, string &$sqlFromTable, string &$sqlWhere, array &$params) : void
					//    menambah atau memodifikasi field-field yang akan ditampilkan
					//    apabila akan memodifikasi join table
					//    apabila akan memodifikasi nilai parameter
					$hnd->SqlQueryListBuilder($sqlFieldList, $sqlFromTable, $sqlWhere, $where->params);
				}
			}
			$sqlFields = \FGTA4\utils\SqlUtility::generateSqlSelectFieldList($sqlFieldList);


			/* Sort Configuration */
			if (!is_array($options->sortData)) {
				$options->sortData = [];
			}
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'sortListOrder')) {
					// ** sortListOrder(array &$sortData) : void
					//    jika ada keperluan mengurutkan data
					//    $sortData['fieldname'] = 'ASC/DESC';
					$hnd->sortListOrder($options->sortData);
				}
			}
			$sqlOrders = \FGTA4\utils\SqlUtility::generateSqlSelectSort($options->sortData);


			/* Compose SQL Query */
			$sqlCount = "select count(*) as n from $sqlFromTable $sqlWhere $sqlLimit";
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

				$record = array_merge($record, [
					// // jikalau ingin menambah atau edit field di result record, dapat dilakukan sesuai contoh sbb: 
					//'tanggal' => date("d/m/y", strtotime($record['tanggal'])),
				 	//'tambahan' => 'dta'
					'partnercategory_name' => \FGTA4\utils\SqlUtility::Lookup($record['partnercategory_id'], $this->db, 'mst_partnercategory', 'partnercategory_id', 'partnercategory_name'),
					'itemclass_name' => \FGTA4\utils\SqlUtility::Lookup($record['itemclass_id'], $this->db, 'mst_itemclass', 'itemclass_id', 'itemclass_name'),
					'unbill_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['unbill_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
					'unbill_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['unbill_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'payable_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['payable_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
					'payable_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['payable_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'arunbill_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['arunbill_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
					'arunbill_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['arunbill_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					'ar_accbudget_name' => \FGTA4\utils\SqlUtility::Lookup($record['ar_accbudget_id'], $this->db, 'mst_accbudget', 'accbudget_id', 'accbudget_name'),
					'ar_coa_name' => \FGTA4\utils\SqlUtility::Lookup($record['ar_coa_id'], $this->db, 'mst_coa', 'coa_id', 'coa_name'),
					 
				]);

				if (is_object($hnd)) {
					if (method_exists(get_class($hnd), 'DataListLooping')) {
						// ** DataListLooping(array &$record) : void
						//    apabila akan menambahkan field di record
						$hnd->DataListLooping($record);
					}
				}

				array_push($records, $record);
			}

			/* modify and finalize records */
			if (is_object($hnd)) {
				if (method_exists(get_class($hnd), 'DataListFinal')) {
					// ** DataListFinal(array &$records) : void
					//    finalisasi data list
					$hnd->DataListFinal($records);
				}
			}

			// kembalikan hasilnya
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