<?php

class Register_Model extends Model {

    public function __construct() {
        parent::__construct();
    }
    
    public function selectType() 
    {
        $text = $_POST['type'];
        
        return $text;
    }
    public function registerStudent($data)
    {
    	$this->db->insert('address', array(
    			'line1' => $data['addressLine1'],
    			'line2' => $data['addressLine2'],
    			'city' => $data['city'],
    			'state' => $data['state'],
    			'landmark' => $data['landMark'],
    			'pin_code' => $data['pinCode'],
    	));
    	
    	$addressid= $this->db->lastInsertId();
    	
    	$this->db->insert('contact_information', array(
    			'address_id' => $addressid,
    			'phone_number' => $data['phoneNumber'],
    			'mobile_number' => $data['mobileNumber'],
    			'facebook_link' => $data['facebookLink']
    	));
    	
    	$contactid= $this->db->lastInsertId();
    	
    	$this->db->insert('user', array(
    			'user_name' => $data['userid'],
    			'password' => Hash::create('sha256', $data['password'], HASH_PASSWORD_KEY),
    			'user_type_id' =>'1',
    			'contact_information_id' => $contactid,
    			'emailid' => $data['email']
    			
    	));
    	
    	$userid= $this->db->lastInsertId();
    	
    	echo $userid."<br />";
    	$this->db->insert('student', array(
    			'userid' => $userid,
    			'fore_name' =>$data['firstName'],
    			'middle_name' =>$data['middleName'],
    			'last_name' =>$data['lastName'],
    			'Qualification_id' => '1'
    			
    			 
    	));
    	
    	
      echo "success";
    }

    public function registerTeacher($data)
    {
    	$this->db->insert('address', array(
    			'line1' => $data['addressLine1'],
    			'line2' => $data['addressLine2'],
    			'city' => $data['city'],
    			'state' => $data['state'],
    			'landmark' => $data['landMark'],
    			'pin_code' => $data['pinCode'],
    	));
    	 
    	$addressid= $this->db->lastInsertId();
    	 
    	$this->db->insert('contact_information', array(
    			'address_id' => $addressid,
    			'phone_number' => $data['phoneNumber'],
    			'mobile_number' => $data['mobileNumber'],
    			'facebook_link' => $data['facebookLink']
    	));
    	 
    	$contactid= $this->db->lastInsertId();
    	 
    	$this->db->insert('user', array(
    			'user_name' => $data['userid'],
    			'password' => Hash::create('sha256', $data['password'], HASH_PASSWORD_KEY),
    			'user_type_id' =>'2',
    			'contact_information_id' => $contactid,
    			'emailid' => $data['email']
    			 
    	));
    	 
    	$userid= $this->db->lastInsertId();
    	 
    	$this->db->insert('teacher', array(
    			'userid' => $userid,
    			'fore_name' =>$data['firstName'],
    			'middle_name' =>$data['middleName'],
    			'last_name' =>$data['lastName'],
    			'Qualification_id' => '1',
    			'type_id' => '1',
    			'subtype_id' => '1'
    
    	));
    	 
    	echo "success";
    }    

    public function registerPrivateInstitute($data)
    {
    	$this->db->insert('address', array(
    			'line1' => $data['addressLine1'],
    			'line2' => $data['addressLine2'],
    			'city' => $data['city'],
    			'state' => $data['state'],
    			'landmark' => $data['landMark'],
    			'pin_code' => $data['pinCode'],
    	));
    
    	$addressid= $this->db->lastInsertId();
    
    	$this->db->insert('contact_information', array(
    			'address_id' => $addressid,
    			'phone_number' => $data['phoneNumber'],
    			'mobile_number' => $data['mobileNumber'],
    			'facebook_link' => $data['facebookLink']
    	));
    
    	$contactid= $this->db->lastInsertId();
    
    	$this->db->insert('user', array(
    			'user_name' => $data['userid'],
    			'password' => Hash::create('sha256', $data['password'], HASH_PASSWORD_KEY),
    			'user_type_id' =>'3',
    			'contact_information_id' => $contactid,
    			'emailid' => $data['email']
    
    	));
    
    	$userid= $this->db->lastInsertId();
    
    	$this->db->insert('private_institute', array(
    			'userid' => $userid,
    			'name' =>$data['name'],
    			'start_date' => date("m.d.y"),
    			'type_id' => '1',
    			'subtype_id' => '1'
    
    	));
    
    	echo "success";
    }

    function checkUsername($data)
    {
    	
     $result=$this->db->select('SELECT userid FROM user WHERE user_name = :username', array(':username' => $data['username']));
     
     echo json_encode(count($result));	
    }

}