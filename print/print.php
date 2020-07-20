<?php
include('../config.php');
$connessione="tcp://192.168.1.25:9100";
$filler1 = "\n";
$filler2 = "\n\n\n\n\n\n\n";
$underlineON = "\x1B\x2D\x02";
$underlineOFF = "\x1B\x2D\x00";
$boldON = "\x1D\x21\x01";
$boldOFF = "\x1D\x21\x00";
$bip = "\x1C\xC0\x07"; //segnale acustico
$cut = "\x1B\x69";	//taglio carta

function printOrder($oid){

//if(isset($_POST['orderid'])){
//	$oid=$_POST['orderid'];
	$query = "select r.r_table,  m.name, ors.number from requests r inner join orders o on r.r_session = o.session inner join orderrows ors on o.id = ors.order_id inner join menurows m on ors.row_id = m.id where r.id = $oid";
	$tabl ="-1";
	$data="";
	$result =mysqli_query($db_con,$query) or die('Errant query:  '.$query);
	while ($record = mysqli_fetch_array($result)){
		$tabl = $record[0];
		$data .= $record[1].": ".$record[2]."\n";
	}
 	$fp = stream_socket_client($connessione, $errno, $errstr, 5);
 	if (!$fp) {
    	echo "$errstr ($errno)<br />\n";
	} else {
		$table= $filler1.$boldON."TAVOLO ".$tabl.$boldOFF.$filler1.$filler1;
		$towrite = $bip.$table.$data.$filler2.$cut;
		fwrite($fp, $towrite);
   		echo ("Ho stampato:\n".$towrite);
   		fclose($fp);
   	}
}

?>