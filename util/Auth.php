<?php
/**
 * 
 */
class Auth
{
    
    public static function handleLogin()
    {
        Session::init();
        $logged = Session::get('loggedIn');
        if ($logged == false) {
            Session::destroy();
            header('location:'.URL.'login');
            exit;
        }
    }
    
}