<?php
namespace App\Controllers;

use App\Models\UserModel;
use App\Models\StaffregisterModel;


class Welcome extends BaseController
{
	public function __cnstruct(){
		// $this->Usermodel = new UserModel();
	}

    public function index()
    {
		$staff_model = new StaffregisterModel();
		$data['role'] = $staff_model->getrole();
        return view('Pages/login',$data);
    }

	public function home(){
		return view('Pages/home');
	}

	public function checkUser(){
		$Usermodel= new UserModel();
		$data=[];
		if($this->request->getMethod() == 'post'){
			$rules = [
				'email' => 'required|min_length[6]|max_length[50]|valid_email',
				'password' => 'required|max_length[255]',
			];
			if(!$this->validate($rules)){	
				$data['validation']= $this->validator;
				return redirect()->to('login');
			}else{

				
				if ($this->request->getVar('login_type') == '') {
					session()->setTempdata('error','Select Your Role Please',5);
					return redirect()->to(current_url());
				}
				elseif ($this->request->getVar('login_type') == 'Admin') {
					$email= $this->request->getVar('email');
					$password = $this->request->getVar('password');
					$status = $Usermodel->checkAdmin($email,$password);
					if($status){
						$name = $status->name;
						$session_data =array(
							'name' => $name,
						);
						session()->set('AdminLoginSession', $session_data);
						return redirect()->to(base_url('doctor-dashboard'));
					}else{
						session()->setTempdata('error','Email or Password is Wrong',5);
						return redirect()->to(current_url());
					}
				}
				elseif ($this->request->getVar('login_type') == 'doctor') {
					$status=$this->Usermodel->checkDoctor($email,$password);
					if($status){
						$name = $status->name;
						$session_data =array(
							'name' => $name,
						);
						return redirect()->to(base_uel('doctor-dashboard'));
					}else{
						session()->setTempdata('error','Email or Password is Wrong',5);
						return redirect()->to(current_url());
					}
				}
				elseif ($this->request->getVar('login_type') == 'optometrists') {
					$status=$this->Usermodel->checkOptometrists($email,$password);
					if($status){
						$name = $status->name;
						$session_data =array(
							'name' => $name,
						);
						return redirect()->to(base_uel('doctor-dashboard'));
					}else{
						session()->setTempdata('error','Email or Password is Wrong',5);
						return redirect()->to(current_url());
					}
				}
				elseif ($this->request->getVar('login_type') == 'laboratorist') {
					$status=$this->Usermodel->checkLaboratorist($email,$password);
					if($status){
						$name = $status->name;
						$session_data =array(
							'name' => $name,
						);
						return redirect()->to(base_uel('doctor-dashboard'));
					}else{
						session()->setTempdata('error','Email or Password is Wrong',5);
						return redirect()->to(current_url());
					}
				}
				elseif ($this->request->getVar('login_type') == 'nurse') {
					$status=$this->Usermodel->checkNurse($email,$password);
					if($status){
						$name = $status->name;
						$session_data =array(
							'name' => $name,
						);
						return redirect()->to(base_uel('doctor-dashboard'));
					}else{
						session()->setTempdata('error','Email or Password is Wrong',5);
						return redirect()->to(current_url());
					}
				}
				elseif ($this->request->getVar('login_type') == 'patient') {
					$status=$this->Usermodel->checkPatient($email,$password);
					if($status){
						$name = $status->name;
						$session_data =array(
							'name' => $name,
						);
						return redirect()->to(base_uel('doctor-dashboard'));
					}else{
						session()->setTempdata('error','Email or Password is Wrong',5);
						return redirect()->to(current_url());
					}
				}
				elseif ($this->request->getVar('login_type') == 'pharmacist') {
					$status=$this->Usermodel->checkPharmacist($email,$password);
					if($status){
						$name = $status->name;
						$session_data =array(
							'name' => $name,
						);
						
						return redirect()->to(base_uel('doctor-dashboard'));
					}else{
						session()->setTempdata('error','Email or Password is Wrong',5);
						return redirect()->to(current_url());
					}
				}
				elseif ($this->request->getVar('login_type') == 'accountant') {
					$status=$this->Usermodel->checkAccountant($email,$password);
					if($status){
						$name = $status->name;
						$session_data =array(
							'name' => $name,
						);
						return redirect()->to(base_uel('doctor-dashboard'));
					}else{
						session()->setTempdata('error','Email or Password is Wrong',5);
						return redirect()->to(current_url());
					}
				}
			}
		}else{
			session()->setTempdata('error','Faild to login Try Again',5);
			return redirect()->to(base_url('login'));
		}
		return view('Pages/login',$data);
	}

    public function logout()
	{
		// session_destroy();
		session()->destroy('AdminLoginSession');
		return redirect()->to(base_url('login'));
		session()->setTempdata('success', 'Successfully Logged Out',5);
	}
}
