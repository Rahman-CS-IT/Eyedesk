<?php

namespace App\Controllers;

use App\Controllers\BaseController;

use App\Models\FullcalendarModel;
use App\Models\StaffregisterModel;


class Fullcalendar extends BaseController
{
    // Load Calendar page
    public function index()
    {
        $staff_model = new StaffregisterModel();
		$data['result'] = $staff_model->getDoctorData();
        return view('inc\navbar',$data);
    }

    
	public function load()
    {
        $calendar_model = new FullcalendarModel();
        $event_data = $calendar_model->fetch_all_event();
        foreach ($event_data->getResultArray() as $row) {

            $data = [
                'id' => $row['id'],
                'title' => $row['firstname'],
                'start' => $row['appointment_start_time'],
                'end' => $row['appointment_end'],
            ];

        }
        return $this->response->setJSON($data);

    }

    public function insert()
    {
        $cal_model= new FullcalendarModel;
        $appointmenttype =  $this->request->getPost('appointmenttype');
        $startdate = $this->request->getPost('start');
        $start_time = $this->request->getPost('timestart');
        $hours = 3600;
        $time = strtotime($start_time) + $hours; // Add 1 hour
        $end_time = date('G:i:s', $time);

        $location = $this->request->getPost('location');
        $consultant = $this->request->getPost('consultant');
        $appointmentreason = $this->request->getPost('appointmentreason');
        $appointmentcategory = $this->request->getPost('appointmentcategory');
        $data = [
            'appointmenttype' =>  $appointmenttype,
            'appointment_start_time' => $startdate . ' ' . $start_time,
            'appointment_end' => $startdate . ' ' . $end_time,
            'location' => $location,
            'consultant' => $consultant,
            'appointmentreason' => $appointmentreason,
            'appointmentcategory' => $appointmentcategory,
        ];
        $cal_model->insert_event($data);
    }

    
    public function insert_day()
    {
        $startdate = $this->request->getPost('start');
        $start_time = $this->request->getPost('timestart');
        $end_time = strtotime($start_time) + 60 * 60;
        if ($this->request->getPost('u_id')) {

            $data = array(
                'u_id'  => $this->request->getPost('u_id'),
                'appointment_start_time' => $this->request->getPost('start'),
                'appointment_end' => $this->request->getPost('end'),
            );

            $res = $calendar_model->insert_event($data);
            return $this->response->setJSON($data);
        }
    }

    public function update()
    {
        $data = array(
            'u_id'  => $this->request->getPost('u_id'),
            'appointment_start_time' => $this->request->getPost('start'),
            'appointment_end' => $this->request->getPost('end'),
        );

        $res = $calendar_model->update_event($data, $this->request->getPost('id'));
        return $this->response->setJSON($data);

        // echo json_encode($res);
    }

    public function delete()
    {
        if ($this->request->getPost('id')) {
            $calendar_model->delete_event($this->input->post('id'));
        }
    }

    public function get_cal_data()
    {
        $id = $this->request->getPost('id');
        $event_data = $calendar_model->get_id_data($id);

        foreach ($event_data->result_array() as $row) {
            $test = $row['appointment_start_time'];
            $first = explode(" ", $test);
            $start_date = $first[0];
            $start_time = $first[1];
            $data[] = array(
                'id'  => $row['id'],
                'u_id'  => $row['u_id'],
                'appointment_start_time' => $row['appointment_start_time'],
                'start_date' => $start_date,
                'start_time' => $start_time,
                'appointmenttype' => $row['appointmenttype'],
                'location' => $row['location'],
                'consultant' => $row['consultant'],
                'appointmentreason' => $row['appointmentreason'],
                'appointmentcategory' => $row['appointmentcategory'],
            );
        }
        return $this->response->setJSON($data);

    }

    function up_insert()
    {
        $appointmenttype =  $this->request->getPost('up_appointmenttype');
        $start_date = $this->request->getPost('up_start');
        $start_time = $this->request->getPost('up_timestart');
        $hours = 3600;
        $time = strtotime($start_time) + $hours; // Add 1 hour
        $end_time = date('G:i:s', $time);

        $location = $this->request->getPost('up_location');
        $consultant = $this->request->getPost('up_consultant');
        $appointmentreason = $this->request->getPost('up_appointmentreason');
        $appointmentcategory = $this->request->getPost('up_appointmentcategory');
        $data = array(
            'appointmenttype' =>  $appointmenttype,
            'appointment_start_time' => $start_date . ' ' . $start_time,
            'appointment_end' => $start_date . ' ' . $end_time,
            'location' => $location,
            'consultant' => $consultant,
            'appointmentreason' => $appointmentreason,
            'appointmentcategory' => $appointmentcategory,
        );

        $this->fullcalendar_model->update_insert($data, $this->request->getPost('up_id'));
        return $this->response->setJSON('');

        // echo json_encode('');
    }
}
