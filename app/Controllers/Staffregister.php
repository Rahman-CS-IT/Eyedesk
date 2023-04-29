<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\StaffregisterModel;

class Staffregister extends BaseController
{
    public function index()
    {
        $staff_model= new StaffregisterModel();
        $data['result'] = $staff_model->getDoctorData();
        return view('inc/navbar', $data);
    }

    public function registerStaff()
    {
        $staff_model= new StaffregisterModel();

        $name = $this->request->getPost('name');
        $email = $this->request->getPost('email');
        $password = $this->request->getPost('password');
        $gender = $this->request->getPost('gender');
        $dob = $this->request->getPost('DOB');
        $age = $this->request->getPost('age');
        $address = $this->request->getPost('address');
        $mob = $this->request->getPost('mobile_no');
        $img = $this->request->getPost('img');
        $qualification = $this->request->getPost('qualification');
        $speciality =  $this->request->getPost('speciality');
        $id_proof = $this->request->getPost('ID_proof');
        $id_img =  $this->request->getPost('ID_img');
        $joined = $this->request->getPost('joined_at');
        $role_id = $this->request->getPost('role_id');

        $data = [
                'name' => $name,
                'email' => $email,
                'password' => $password,
                'gender' => $gender,
                'DOB' => $dob,
                'age' => $age,
                'address' => $address,
                'mobile_no' => $mob,
                'img' => $img,
                'qualification' => $qualification,
                'speciality' => $speciality,
                'ID_proof' => $id_proof,
                'ID_img' => $id_img,
                'joined_at' => $joined,
                'role_id' => $role_id,
                'status' => '1',
                'created_at' => date('Y-m-d H:i:s'),
            ];
        $result = $staff_model->register($data);
        return redirect()->to(base_url('doctor-dashboard'));
    }
}
