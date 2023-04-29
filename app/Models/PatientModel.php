<?php

namespace App\Models;

use CodeIgniter\Model;

class PatientModel extends Model
{
    protected $db;
    public function __construct(){
		$this->db = \Config\Database::connect();
    }
    protected $DBGroup          = 'default';
    protected $table            = 'patients';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $insertID         = 0;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];

    function fetch_data()
	{
        // $builder = $this->db->table('patients')
        //                 ->select('*')
        //                 ->join('appoit', 'patients.app_id=appoit.pat_id')
        //                 ->orderBy('appointment_start_time', "ASC");
        // $query = $builder->get();
        // return $query->getResult();
        $builder = $this->db->table('appoit')
                    ->select('*')
                    ->join('patients', 'patients.pat_id=appoit.pat_id', 'right')
                    ->orderBy('appointment_start_time', "ASC");
$query = $builder->get();
return $query->getResult();
	}



    public function getRecords(){
        $builder = $this->db->table('appoit')
                        ->select('*')
                        ->where([DATE(created_at),DATE(NOW())])
                        ->orderBy('appointment_start_time', "DESC");
        $query = $builder->get();
        return $query->getResult();
    }   
}


