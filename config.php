<?php
//parameters
$period_second=30; //query first time in monitor
$period_milli_block=30000; //time before remove block in monitor (put in table clients)
$refresh_monitor=35;
$version="v 0.9.2";
//$cliente = "L'incontro";
// Connection's Parameters
$db_host="127.0.0.1";
//$db_name="smartrestaurant";
$db_name="tapitap";
//$db_name="smartrestaurant";
$username="root";
$password="helloworld";
// $password="zxcvasdfqwer1234Z";
//OLD WAY
//$db_con=mysql_connect($db_host,$username,$password);
//$connection_string=mysql_select_db($db_name);
//NEW WAY
$db_con = mysqli_connect($db_host, $username, $password, $db_name);

mysqli_set_charset($db_con,"utf8");

// Connection
//mysqli_connect($db_host,$username,$password,$db_name);
//mysqli_select_db($db_name);
//login
//$user_login_required=1; //al posto di metterli in tabella considerare i metterli in un file separato per cliente clients/client1.php
//forse è meglio lasciarli sul DB, li scarico la prima volta per l'index e poi nella librery se servono facico la query.
//$show_wait_time=1;
//$choose_delivery_method=1;//fa aprire una pagina di scelta delivery con il pulsante ordina


//sms register
$gateway_url = "http://gateway.skebby.it/api/send/smseasy/advanced/http.php";
$gateway_usr = "xxx";
$gateway_psw = "xxx";
$sender_name = "xxx"; //skebby max 11 caratteri

//email PHPMailer config

$smtp_address ='xxxx';
$smtp_usr = 'xxx'; 
$smtp_psw = 'xxx';
$email_from = 'xxx';
$email_from_name = 'ServiziSmart';

//ordinazione o solo catalogo
//$enable_order=1;

//immagini con lazy_load
//$lazy_required=1;

//stampa
//$enablePrint=0;
$tentativi =3; // è bloccante attenzione
$connessione="tcp://192.168.1.25:9100";
$filler1 = "\n";
$filler2 = "\n\n\n\n\n\n\n";
$underlineON = "\x1B\x2D\x02";
$underlineOFF = "\x1B\x2D\x00";
$boldON = "\x1D\x21\x01";
$boldOFF = "\x1D\x21\x00";
$bip = "\x1C\xC0\x07"; //segnale acustico
$cut = "\x1B\x69";	//taglio carta

define('_LANGUAGE_SHOW', false);
?>