<?php

namespace App\Models;

use CodeIgniter\Model;

class FullcalendarModel extends Model
{
    function fetch_all_event()
    {
        $builder = $this->db->table('patients')
                            ->orderBy('appointment_start_time', 'ASC')
                            ->join('appoit', 'patients.app_id=appoit.pat_id');
        $appointment = $builder->get();

        return $appointment;
    }

    function insert_event($data)
    {
        $builder = $this->db->table('appoit')
                        ->insert($data);
    }

    function update_event($data, $id)
    {
        $builder = $this->db->table('appoit')
                        ->update($data,['id'=>$id]);
    }

    function delete_event($id)
    {
        $builder = $this->db->table('appoit')
                        ->delete(['id' => $id]);
    }

    function update_insert($data, $id)
    {
        $builder = $this->db->table('appoit')
                        ->update($data,['id'=>$id]);
    }

    function get_id_data($id = '')
    {
        $this->db->select("appoit.*")->from('patients')->order_by('appointment_start_time', 'ASC');
        $this->db->join('appoit', 'patients.app_id=appoit.pat_id');

        if (!empty($id)) {

            $this->db->where('appoit.id', $this->input->post('id'));
        }

        $appointment = $this->db->get();

        return $appointment;
    }
}
