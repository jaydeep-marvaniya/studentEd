<!doctype html>
<html>
<head>
    <title>Studented</title>
    <link rel="stylesheet" href="<?php echo URL; ?>public/css/default.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/sunny/jquery-ui.css" />
    <link rel="stylesheet" href="<?php echo URL; ?>public/bootstrap/css/bs-docs.css" rel="stylesheet">       
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<?php echo URL; ?>public/js/custom.js"></script>
    <script type="text/javascript" src="<?php echo URL; ?>public/bootstrap/js/bootstrap.js"></script>
    
    <?php
    if (isset($this->js)) 
    {
        foreach ($this->js as $js)
        {
            echo '<script type="text/javascript" src="'.URL.'views/'.$js.'"></script>';
        }
    }
    ?>
</head>
<body>

<?php Session::init(); ?>
    
<div id="header">

    Welcome To studented <br />
    <?php 
    
    if(Session::get('loggedIn')==true)
    {
    	
    	echo '<a href="'. URL.'logout">Logout</a>';
    }
    ?>
    
</div>
    

    
    