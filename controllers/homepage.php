<?php
class homepage extends Controller {
	function __construct() {
		parent::__construct();
		Auth::handleLogin();
	}
	
	function index()
	{
		
		$this->view->render('homepage/index');
	}
}