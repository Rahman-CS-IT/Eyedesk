<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use \Mpdf\Mpdf;
use App\Models\UserModel;
use App\Models\PatientModel;
use App\Models\StaffregisterModel;


class Dashboard extends BaseController
{
    public function index()
    {
        //
    }

    public function registerPatient(){

        $this->db = \Config\Database::connect();

        $u_model = new UserModel();

        // patients details

        $fname = $this->request->getPost('firstname');
        $mname = $this->request->getPost('middlename');
        $lname = $this->request->getPost('last_name');
        $mobile = $this->request->getPost('mobilenumber');
        $sec_no = $this->request->getPost('secondarynumber');
        $mail = $this->request->getPost('email');
        $gender = $this->request->getPost('gender');
        $dob = $this->request->getPost('dob');
        $year = $this->request->getPost('year');
        $months = $this->request->getPost('months');
        $lang = $this->request->getPost('language');
        $patient_type = $this->request->getPost('patienttype');
        $add1 = $this->request->getPost('address1');
        $add2 = $this->request->getPost('address2');
        $state = $this->request->getPost('state');
        $city = $this->request->getPost('city');
        $pin = $this->request->getPost('pincode');
        $occupation = $this->request->getPost('occupation');
        $emp_id = $this->request->getPost('employeeid');
        $medical_record = $this->request->getPost('medicalrecordno');
        $gov_id = $this->request->getPost('governmentid');
        $gov_idno = $this->request->getPost('governmentidno');

        $blood_grp = $this->request->getPost('blood_grp');
        $mrt_status = $this->request->getPost('maritail_status');
        $eyed = $this->request->getPost('one_eyed');
        $emg_relation = $this->request->getPost('emg_relation');
        $emg_name = $this->request->getPost('emg_name');
        $emg_number = $this->request->getPost('emg_number');
        $opthalmic_comment = $this->request->getPost('opthalmic_comment');
        $systemic_comment = $this->request->getPost('systemic_comment');
        $medical_history = $this->request->getPost('medical_history');
        $family_history = $this->request->getPost('family_history');
        $paedairic_type = $this->request->getPost('paedairic_type');
        $paedairic_comment = $this->request->getPost('paedairic_comment');
        $immunization_type = $this->request->getPost('immunization_type');
        $immunization_comment = $this->request->getPost('immunization_comment');
        $drug_comment = $this->request->getPost('drug_comment');
        $contact_comment = $this->request->getPost('contact_comment');
        $food_comment = $this->request->getPost('food_comment');
        $other_comment = $this->request->getPost('other_comment');

        $file = $this->request->getFile('image');

        if (!$file->isValid() || !in_array($file->getClientMimeType(), ['image/png', 'image/jpg', 'image/jpeg'])) {
            return "Invalid file type. Only PNG and JPG files are allowed.";
        }

        //* Upload directory 
        $uploadDir ='patients_image/';

        $fileName = $file->getRandomName();

        $file->move($uploadDir, $fileName);

        $fileType = $file->getClientExtension();

        $image = 'patients_image/'. $fileName;


        //* appoitment details

        $appoi_type = $this->request->getPost('appointment_type');
        $appoi_date = $this->request->getPost('appointment_date');
        $appoi_time = $this->request->getPost('appointment_time');
        $location = $this->request->getPost('location');
        $consultant = $this->request->getPost('consultant');
        $appointment_t = $this->request->getPost('appointment_t');
        $appointment_category = $this->request->getPost('appointment_category');

        //* dynamic data
        $name = $this->request->getPost('name');
        $duration = $this->request->getPost('duration');
        $duration_unit = $this->request->getPost('duration_unit');
        $comments = $this->request->getPost('comments');
            
        $data1 = [
            'firstname' => $fname,
            'middlename' => $mname,
            'lastname' => $lname,
            'mobilenumber' => $mobile,
            'secondarynumber' => $sec_no,
            'email' => $mail,
            'gender' => $gender,
            'dob' => $dob,
            'year' => $year,
            'months' => $months,
            'language' => $lang,
            'patienttype' => $patient_type,
            'address1' => $add1,
            'address2' => $add2,
            'state' => $state,
            'city' => $city,
            'pincode' => $pin,
            'occupation' => $occupation,
            'employeeid' => $emp_id,
            'medicalrecordno' => $medical_record,
            'governmentid' => $gov_id,
            'governmentidno' => $gov_idno,
            'img_path' => $image,
            'blood_grp' => $blood_grp,
            'maritail_status' => $mrt_status,
            'one_eyed' => $eyed,
            'emg_relation' => $emg_relation,
            'emg_name' => $emg_name,
            'emg_number' => $emg_number,
            'opthalmic_comment' => $opthalmic_comment,
            'systemic_comment' => $systemic_comment,
            'medical_history' => $medical_history,
            'family_history' => $family_history,
            'paedairic_type' => $paedairic_type,
            'paedairic_comment' => $paedairic_comment,
            'immunization_type' => $immunization_type,
            'immunization_comment' => $immunization_comment ,
            'drug_comment' => $drug_comment,
            'contact_comment' => $contact_comment,
            'food_comment' => $food_comment,
            'other_comment' => $other_comment,
            'emr_path' => 'EMR/'.$fname.' EMR.pdf',
            'created_at' => date('Y-m-d H:i:s'),
        ];

        $pat_id = $u_model->Create($data1);

       
        $dataEmr = [
            'pat_id' => $pat_id,
            'firstname' => $fname,
            'middlename' => $mname,
            'lastname' => $lname,
            'mobilenumber' => $mobile,
            'secondarynumber' => $sec_no,
            'email' => $mail,
            'gender' => $gender,
            'dob' => $dob,
            'year' => $year,
            'months' => $months,
            'language' => $lang,
            'patienttype' => $patient_type,
            'address1' => $add1,
            'address2' => $add2,
            'state' => $state,
            'city' => $city,
            'pincode' => $pin,
            'occupation' => $occupation,
            'employeeid' => $emp_id,
            'medicalrecordno' => $medical_record,
            'governmentid' => $gov_id,
            'governmentidno' => $gov_idno,
            'img_path' => $image,
            'blood_grp' => $blood_grp,
            'maritail_status' => $mrt_status,
            'one_eyed' => $eyed,
            'emg_relation' => $emg_relation,
            'emg_name' => $emg_name,
            'emg_number' => $emg_number,
            'opthalmic_comment' => $opthalmic_comment,
            'systemic_comment' => $systemic_comment,
            'medical_history' => $medical_history,
            'family_history' => $family_history,
            'paedairic_type' => $paedairic_type,
            'paedairic_comment' => $paedairic_comment,
            'immunization_type' => $immunization_type,
            'immunization_comment' => $immunization_comment ,
            'drug_comment' => $drug_comment,
            'contact_comment' => $contact_comment,
            'food_comment' => $food_comment,
            'other_comment' => $other_comment,
            'emr_path' => 'EMR/'.$fname.' EMR.pdf',
            'created_at' => date('Y-m-d H:i:s'),
        ];

        $data3 = [];
        for ($i = 0; $i < count($name); $i++) {
            $data3[] = [
                'patient_id' => $pat_id,
                'name' => $name[$i],
                'duration' => $duration[$i],
                'duration_unit' => $duration_unit[$i],
                'comment' => $comments[$i]
            ];
        }
        $u_model->DynamicData($data3);
        
        $u_model->generateEmr($dataEmr);

        // $u_model->updateEmrPath($pat_id, $emr_path);



        $hours = 3600;
        $time = strtotime($appoi_time) + $hours; // Add 1 hour
        $end_time = date('G:i:s', $time);
        $data2 = [
            'pat_id' => $pat_id,
            'appointmenttype' => $appoi_type,
            'appointment_date' => $appoi_date,
            'appointment_start_time' => $appoi_time,
            'appointment_end' => $appoi_date . ' ' . $end_time,
            'location'=> $location,
            'consultant' => $consultant,
            'appointmentreason'=> $appointment_t,
            'appointmentcategory' => $appointment_category,
            'created_at' => date('Y-m-d H:i:s'),
        ];

        $u_model->createAppointment($data2);

      
        return $this->response->setJSON(['success' => true, 'pat_id' => $pat_id]);

    }

    public function getDataofOpd(){
        $u_model = new UserModel();

        $id = $this->request->getGet('id');

        $data = $u_model->findDataById($id);

        return $this->response->setJSON($data);
    }
    
    public function opd(){

        $staff_model = new StaffregisterModel();
        $patient_model = new PatientModel();

        $data1['result'] = $staff_model->getDoctorData();
        echo view('inc/navbar',$data1);
        $data2['fetch_data'] = $patient_model->fetch_data();
        echo view('Pages/opd',$data2);
    }

    public function adminDashboard(){
        
        //doc Dashboard
        $staff_model = new StaffregisterModel();
        $patient_model = new PatientModel();
        $data1['result'] = $staff_model->getDoctorData();
        echo view('inc/navbar',$data1);
        $data2['fetch_data'] = $patient_model->fetch_data();
            echo view('Pages/dashboard',$data2);
			// return view('inc/navbar',$data1,$data2)
                // .view('Pages/dashboard');        
	}

    //Facility Settings
    public function Facilities(){
        $staff_model = new StaffregisterModel();
        $data['role'] = $staff_model->getrole();
        return view('inc/navbar',$data).view('Settings/Facility');
    }
    
    public function sendMail($id){
        $u_model = new UserModel();
        $u_model->sendEmail($id);
        return redirect()->to(previous_url());
    }
    public function getRecordsByDay(){
        $u_model = new PatientModel();
        $data['today'] = $u_model->getRecords();
        return view('inc/navbar',$data);    
    }

    public function emrRecords(){
        $u_model = new UserModel();
        $query = $this->request->getPost('search-query');
        if($query){
            $data = $u_model->searchData($query);
        }else{
            $data = $u_model->getAllData();
        }
        return $this->response->setJson($data);
    }

    public function getRecordsOfOpf(){
        $u_model = new UserModel();
        $query = $this->request->getPost('opd-search');
        if($query){
            $data = $u_model->fetchDataOpd($query);
        }else{
            $data = $u_model->getAllOpdData();
        }
        return $this->response->setJson($data);
    }



	
}
