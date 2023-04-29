<?php

namespace App\Models;
use \Mpdf\Mpdf;
// require_once  ('C:\xampp\htdocs\EyeDesk\vendor\autoload.php');

// require_once __DIR__ . '/vendor/autoload.php';

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'patients';
    protected $primaryKey       = 'id';
    // protected $useAutoIncrement = true;
    protected $insertID         = 'id';
    // protected $returnType       = 'array';
    // protected $useSoftDeletes   = false;
    // protected $protectFields    = true;
    // protected $allowedFields    = [];

    // // Dates
    // protected $useTimestamps = false;
    // protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    // protected $deletedField  = '';

    // // Validation
    // protected $validationRules      = [];
    // protected $validationMessages   = [];
    // protected $skipValidation       = false;
    // protected $cleanValidationRules = true;

    // // Callbacks
    protected $allowCallbacks = true;
    // protected $beforeInsert   = [];
    // protected $afterInsert    = [];
    // protected $beforeUpdate   = [];
    // protected $afterUpdate    = [];
    // protected $beforeFind     = [];
    // protected $afterFind      = [];
    // protected $beforeDelete   = [];
    // protected $afterDelete    = [];
	protected $db;
    public function __construct(){
		$this->db = \Config\Database::connect();
    }

    public function Create($data)
	{
		
        $builder = $this->db->table('patients');
		$builder->insert($data);
		$id= $this->db->insertID();
		if(true){
			$pat_id = "AEH-".substr($data['firstname'],0,3)."-".$id;
			$this->db->query("UPDATE patients SET pat_id='".$pat_id."' WHERE id = '".$id."'");
		}
		return $pat_id;
       
	}

	public function createAppointment($data){
		$builder = $this->db->table('appoit');
		$builder->insert($data);
	}

	public function DynamicData($data){
		$builder = $this->db->table('dynamic_data');
		// $builder->set($data);
		if(!empty($data)){

			$builder->insertBatch($data);
		}
	}

	public function findDataById($id){
		$builder = $this->db->table('patients');

		$query = $builder->getWhere([ 'id' => $id ]);

		return $query->getRowArray();
	}



	public function generateEmr($data)
	{
		$mpdf = new \Mpdf\Mpdf();
		$mpdf->SetHeader('EyeDesk|AEH|{PAGENO}');
		$mpdf->SetFooter('EMR');

		$builder = $this->db->table('dynamic_data');
		$query = $builder->getWhere(['patient_id'=> $data['pat_id']]);
		$result = $query->getResult();

		$dbDate = $data['created_at'];

		$timestamp = strtotime($dbDate);

		// Format the Unix timestamp to the desired date format
		$formattedDate = date('d/m/Y', $timestamp);
		$html2 = '<div style="width:150px;height:150px;"><img src="'.$data['img_path'].'"  ></div>
		<span><strong>'.ucfirst($data['firstname']).' '.ucfirst($data['middlename']).' '.ucfirst($data['lastname']).'</strong></span>
		<span>( '.$data['gender'].' | '.$data['year'].' years)</span>
		<table>
			<tr>
				<td><strong>Patient ID</strong></td>
				<td>:</td>
				<td>'.(isset($data['pat_id']) ? $data['pat_id'] : '').'</td>
				<td><strong>Registration Date</strong></td>
				<td>:</td>
				<td>'.$formattedDate.'</td>
			</tr>
			<tr>
				<td><strong>Primary Contact</strong></td>
				<td>:</td>
				<td>'.$data['mobilenumber'].'</td>
				<td><strong>Language</strong></td>
				<td>:</td>
				<td>'.$data['language'].'</td>
			</tr>
			<tr>
				<td><strong>Patient Type</strong></td>
				<td>:</td>
				<td>'.$data['patienttype'].'</td>
				<td><strong>Occupation</strong></td>
				<td>:</td>
				<td>'.$data['occupation'].'</td>
			</tr>
			<tr>
				<td><strong>Address</strong></td>
				<td>:</td>
				<td style="max-width:40px">'.$data['address1'].'</td>
				<td><strong>Medical Record No.</strong></td>
				<td>:</td>
				<td>'.$data['medicalrecordno'].'</td>
			</tr>
			<tr>
				<td><strong>Government Issued ID</strong></td>
				<td>:</td>
				<td>'.$data['governmentid'].'</td>
				<td><strong>Blood Group</strong></td>
				<td>:</td>
				<td>'.$data['blood_grp'].'</td>
			</tr>
			<tr>
				<td><strong>Marital Status</strong></td>
				<td>:</td>
				<td>'.$data['maritail_status'].'</td>
				<td><strong>One Eyed</strong></td>
				<td>:</td>
				<td>'.$data['one_eyed'].'</td>
			</tr>
			<tr>
				<td><strong>Emergency Name</strong></td>
				<td>:</td>
				<td>'.$data['emg_name'].'</td>
				<td><strong>Emergency Number</strong></td>
				<td>:</td>
				<td>'.$data['emg_number'].'</td>
			</tr>
		</table>
		<hr>
		<h2 style="text-align: center;">History & Allergies</h2>';

			if(!empty($result)){
		$html2 .='
		<table style="width:100%;text-align: center;">
		<tr>
		<th style="padding:8px;width:23.33%;">Name</th>
		<th style="padding:8px;width:23.33%;">Duration</th>
		<th style="padding:8px;width:23.33%;">Duration Unit</th>
		<th style="padding:8px;width:30%;">Comment</th>
		</tr>
		';

		
		foreach ($result as $row) {
			$name = $row->name;
			$duration = $row->duration;
			$duration_unit = $row->duration_unit;
			$comment = $row->comment;
		
			// Add the HTML content for the row
			$html2 .= '<tr><td style="padding:8px;width:23.33%;">' . $name . '</td>';
			$html2 .= '<td style="padding:8px;width:23.33%;">' . $duration . '</td>';
			$html2 .= '<td style="padding:8px;width:23.33%;">' . $duration_unit . '</td>';
			$html2 .= '<td style="padding:8px;width:30%;">' . $comment . '</td></tr>';
		}
		$html2 .= '</table>'; 
	}else{
		$html2 .='<tr><td>No data found</td></tr>'; 
	}
		$html2 .='
		<table style="width:100%;margin:1rem;">
		<tr style="margin:5px;">
		<hr>
		<td><strong>Opthalmic Comment</strong></td>
		<td>:</td>
		<td>'.$data['opthalmic_comment'].'</td>
		<td></td>
		</tr>';
		$html2 .='<tr style="margin:5px;">
		<td><strong>Systemic Comment</strong></td>
		<td>:</td>
		<td>'.$data['systemic_comment'].'</td>
		<td></td>
		</tr>';
		$html2 .= 
		'<tr style="margin:5px;">
		<td><strong>Mdeical History:</strong></td>
		<td>'.$data['medical_history'].'</td>
		<td><strong>Family History:</strong></td>
		<td>'.$data['family_history'].'</td>
		</tr>';
		$html2 .='
		<tr style="margin:5px;">
		<td><strong>Nutrition Assessment</strong></td>
		<td>'.$data['paedairic_type'].'</td>
		<td><strong>Immunization Assessment</strong></td>
		<td>'.$data['immunization_type'].'</td>

		</tr>';
		$html2 .= '
		<tr style="margin:5px;">
		<td><strong>Paedairic Comment</strong></td>
		<td>'.$data['paedairic_comment'].'</td>
		<td></td>
		<td></td>
		</tr>';
		$html2 .='
		<tr style="margin:5px;">
		<td><strong>Immunization Comment</strong></td>
		<td>'.$data['immunization_comment'].'</td>
		<td></td>
		<td></td>
		</tr>
		<tr style="margin:5px;">
		<td><strong>Drug Allergies</strong></td>
		<td>'.$data['drug_comment'].'</td>
		<td></td>
		<td></td>
		</tr>
		<tr style="margin:5px;">
		<td><strong>Contact Allergies</strong></td>
		<td>'.$data['contact_comment'].'</td>
		<td></td>
		<td></td>
		</tr>
		<tr style="margin:5px;">
		<td><strong>Food Allergies</strong></td>
		<td>'.$data['food_comment'].'</td>
		<td></td>
		<td></td>
		</tr>
		<tr style="margin:5px;">
		<td><strong>Other Comments</strong></td>
		<td>'.$data['other_comment'].'</td>
		<td></td>
		<td></td>
		</tr>
		</table>';
	
		$mpdf->WriteHTML($html2);
		
		// Generate a unique filename
		$timestamp = time(); // or use any other timestamp
		$randomString = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 10); // generate a random string
		$fileName = $data['firstname'] . '_' . $timestamp . '_' . $randomString . '.pdf'; // append timestamp and random string to the original filename
		$filePath = 'EMR/'.$fileName;
		$content=$mpdf->Output('EMR/'.$fileName,'F');	
		$data2 = [
			'emr_path' => $filePath,	
			'updated_at' => date('Y-m-d H:i:s')
		];

		// Update the record in the database
		$builder = $this->db->table('patients');
		$builder->set($data2)
			->where('pat_id', $data['pat_id'])
			->update();

	}

	public function getAllData() {
		$builder = $this->db->table('patients');
		$query = $builder->get();
		return $query->getResultArray();
	}

	public function searchData($query) {
		$builder = $this->db->table('patients');
		$builder->orLike([
			'firstname'=>$query,
			'pat_id'=>$query,
			'created_at'=>$query,
		]);
		$query = $builder->get();
		return $query->getResultArray();
	}

	public function getAllOpdData(){
		$builder = $this->db->table('appoit')
							->select('*')
							->join('patients', 'patients.pat_id=appoit.pat_id','right')
							->orderBy('appointment_start_time', "ASC");
		$query = $builder->get();
		return $query->getResultArray();
	}

	public function fetchDataOpd($query)
	{
        $builder = $this->db->table('appoit')
                    ->join('patients', 'patients.pat_id=appoit.pat_id', 'right')
                    ->orderBy('appointment_start_time', "ASC");
		$builder->orLike([
			'firstname'=>$query,
			'patients.pat_id'=>$query,
			'appointment_start_time'=>$query,
		]);
		$query = $builder->get();
		return $query->getResultArray();
	}

	public function sendEmail($id)
	{
		$to;
		$path;
		$email = \Config\Services::email();
		$builder = $this->db->table('patients')
						->select('*')
						->where(['pat_id'=>$id]);
						

		$query = $builder->get();
		$result = $query->getRow();
		if(isset($result)){
			$to = $result->email;
			$path = $result->emr_path;
			$subject = "EMR From EyeDesk";

		$email->setFrom('eyedeskconnect@gmail.com', 'EyeDesk Team');
		$email->setTo($to);
		$email->setSubject($subject);
		$email->attach($path);

		if($email->send()){
			echo "succesfully send mail";
		}else{
			echo "fail";
			$data= $email->printDebugger(['headers']);
			print_r($data);
		}
	}
	}

	function getData($id)
	{
        $builder = $this->db->table('appoit');
        $query = $builder->getwhere(['id'=>$id]);
		// $query = $this->db->query('SELECT * FROM appoit WHERE `id` =' . $id);
		return $query->getRow();
	}


	public function checkAdmin($email,$password)
	{
		$builder = $this->db->table("admin");
		$builder->select("*");
		$builder->where([
			'email' => $email,
			'password' => $password,
		]);
		$result = $builder->get();
		if(count($result->getResultArray())==1){
			return $result->getRow();
		}else{
			return false;
		}
	}


	function checkDoctor($email,$password)
	{

		$query = $this->db->query("SELECT * FROM doctor WHERE password='$password' AND email='$email'");
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return false;
		}
	}

	function checkLaboratorist($email,$password)
	{

		$query = $this->db->query("SELECT * FROM laboratorist WHERE password='$password' AND email='$email'");
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return false;
		}
	}

	function checkNurse($email,$password)
	{

		$query = $this->db->query("SELECT * FROM nurse WHERE password='$password' AND email='$email'");
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return false;
		}
	}

	function checkOptometrists($email,$password)
	{

		$query = $this->db->query("SELECT * FROM optometrists WHERE password='$password' AND email='$email'");
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return false;
		}
	}

	function checkPatient($email,$password)
	{
		$query = $this->db->query("SELECT * FROM patient WHERE password='$password' AND email='$email'");
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return false;
		}
	}

	function checkPharmacist($email,$password)
	{
		$query = $this->db->query("SELECT * FROM pharmacist WHERE password='$password' AND email='$email'");
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return false;
		}
	}
	function checkAccuntant($email,$password)
	{
		$query = $this->db->query("SELECT * FROM accountant WHERE password='$password' AND email='$email'");
		if ($query->num_rows() == 1) {
			return $query->row();
		} else {
			return false;
		}
	}
}
