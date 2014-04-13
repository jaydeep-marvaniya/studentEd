<?php

// Always provide a TRAILING SLASH (/) AFTER A PATH
define('URL', 'http://localhost/studented/trunk/');
define('LIBS', 'libs/');

define('DB_TYPE', 'mysql');
define('DB_HOST', 'localhost');
define('DB_NAME', 'studented');
define('DB_USER', 'new');
define('DB_PASS', '123');

// The sitewide hashkey, do not change this because its used for passwords!
// This is for other hash keys... Not sure yet
define('HASH_GENERAL_KEY', 'KolkataaWdRgYjIL9286');

// This is for database passwords only
define('HASH_PASSWORD_KEY', 'azsxdcfvgbhnjmk820820edrfhjw');