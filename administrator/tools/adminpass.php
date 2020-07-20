<?php

include('../../config.php');
$passwordori = 'admin';

$md5_psw_salt="kjsdhfjsh";
$md5_psw_salt_admin="olkkohfjshpoiu";

$password=md5(($passwordori).$md5_psw_salt_admin);

echo $password;

?>