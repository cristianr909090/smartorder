<?php
session_start(); 
//echo (session_id());
session_regenerate_id();
//echo (session_id());
header('Content-type: application/json');
echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'sessione'=>session_id()));
?>