<?php
class register extends Controller {
	function __construct() {
		
		
		parent::__construct();
		$this->view->js = array('register/js/default.js','register/js/jquery.validate.min.js','register/js/validate.js');
	}
	
	function index()
	{
		
		$this->view->render('register/index');
	}
	
	function selectType()
	{
	
		$type=$this->model->selectType();
		$page='register/'.$type;
		header('location: ' . URL .$page );
	}
	function student()
	{
		
		$this->view->render('register/student');
		
	}
	function teacher()
	{
	
		$this->view->render('register/teacher');
	
	}
	function privateInstitute()
	{
		$this->view->render('register/privateInstitute');
		
		
	}
    function registerStudent()
    {   $data=array();
        $data['userid']=$_POST['userid'];
        $data['firstName']=$_POST['firstName'];
        $data['middleName']=$_POST['middleName'];
        $data['lastName']=$_POST['lastName'];
        $data['password']=$_POST['password1'];
        $data['email']=$_POST['email'];
        $data['mobileNumber']=$_POST['mobileNumber'];
        $data['phoneNumber']=$_POST['phoneNumber'];
        $data['addressLine1']=$_POST['addressLine1'];
        $data['addressLine2']=$_POST['addressLine2'];
        $data['city']=$_POST['city'];
        $data['state']=$_POST['state'];
        $data['pinCode']=$_POST['pinCode'];
        $data['landMark']=$_POST['landMark'];
        $data['facebookLink']=$_POST['facebookLink'];
    	$this->model->registerStudent($data);
    	
    	
    }
    function registerTeacher()
    {
    	$data=array();
    	$data['userid']=$_POST['userid'];
    	$data['firstName']=$_POST['firstName'];
    	$data['middleName']=$_POST['middleName'];
    	$data['lastName']=$_POST['lastName'];
    	$data['password']=$_POST['password1'];
    	$data['email']=$_POST['email'];
    	$data['mobileNumber']=$_POST['mobileNumber'];
    	$data['phoneNumber']=$_POST['phoneNumber'];
    	$data['addressLine1']=$_POST['addressLine1'];
    	$data['addressLine2']=$_POST['addressLine2'];
    	$data['city']=$_POST['city'];
    	$data['state']=$_POST['state'];
    	$data['pinCode']=$_POST['pinCode'];
    	$data['landMark']=$_POST['landMark'];
    	$data['facebookLink']=$_POST['facebookLink'];
    	$this->model->registerTeacher($data);
     	
    	
    	
    }
    function registerPrivateInstitute()
    {
    	$data=array();
    	$data['userid']=$_POST['userid'];
    	$data['name']=$_POST['name'];
    	$data['password']=$_POST['password1'];
    	$data['email']=$_POST['email'];
    	$data['mobileNumber']=$_POST['mobileNumber'];
    	$data['phoneNumber']=$_POST['phoneNumber'];
    	$data['addressLine1']=$_POST['addressLine1'];
    	$data['addressLine2']=$_POST['addressLine2'];
    	$data['city']=$_POST['city'];
    	$data['state']=$_POST['state'];
    	$data['pinCode']=$_POST['pinCode'];
    	$data['landMark']=$_POST['landMark'];
    	$data['facebookLink']=$_POST['facebookLink'];
    	$this->model->registerPrivateInstitute($data);
    
    	 
    	 
    }
    
    function checkUsername()
    {
    	
    	$data=array();
    	$data['username']=$_POST['username'];
    	$this->model->checkUsername($data);
    }
}