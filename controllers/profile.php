<?php 
class profile extends Controller {
	function __construct() {
	     parent::__construct();
	     Auth::handleLogin();
		 //$this->view->js=array('/public/bootstrap/js/bootstrap.js');
	}
	function index()
	{
		$this->view->render('profile/index');
// 		$userid=Session::get('userid');
// 	    $this->view('userid',true);
		
	}
	function view($username,$flag=false)
	{
		$details=array();
		if($flag==TRUE)
		{   
			$details=$this->model->getDetails($username,true);
			$details['userid']=$username;
		}
		else 
		{
			$details=$this->model->getDetails($username);
			
		}
		
	}
	
}