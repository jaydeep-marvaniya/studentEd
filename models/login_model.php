<?php

class Login_Model extends Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function run()
    {
        $sth = $this->db->prepare("SELECT userid, user_type_id FROM user WHERE 
                user_name = :login AND password = :password");
        $sth->execute(array(
            ':login' => $_POST['login'],
            ':password' => Hash::create('sha256', $_POST['password'], HASH_PASSWORD_KEY)
        ));
        
        $data = $sth->fetch();
        
        $count =  $sth->rowCount();
        if ($count > 0) {
            // login
            Session::init();
            Session::set('type', $data['user_type_id']);
            Session::set('loggedIn', true);
            Session::set('userid', $data['userid']);
            header('location: ../homepage');
        } else {
            header('location: ../login');
        }
        
    }
    
}