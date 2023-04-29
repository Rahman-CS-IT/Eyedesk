<?php

namespace App\Models;

use CodeIgniter\Model;
use CodeIgniter\Database\RawSql;
class StaffregisterModel extends Model
{

    public function register($data)
    {

        $builder = $this->db->table('staff')
                    ->insert($data);
    }

    public function saveDynamic($data)
    {

        $builder = $this->db->table('history_opthalmic_history')
                    ->insert($data);
    }

    public function getDoctorData()
    {
        $builder = $this->db->table('staff');
        $builder->select('*');
        $builder->join('role', 'staff.role_id=role.id');
        $query = $builder->get();
        return $query->getResult();
    }

    public function getrole()
    {
        $builder = $this->db->table('role');
        $query = $builder->get();
        return $query->getResult();
    }

    function getData($id)
    {
        $query = $this->db->query('SELECT * FROM staff WHERE `id` =>' . $id);
        return $query->row();
    }

    function staffdelete($id)
    {
        // $this->db->delete('staff', $id);
        $builder = $this->db->table('staff');
        $builder->delete(['id' => $id]);     

    }
}
