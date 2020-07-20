<?php
/*
Example of use of PrintSendLPR
@author Mick Sear
eCreate 2005
LGPL
*/

$connessione="tcp://192.168.1.25:9100";

$fp = stream_socket_client($connessione, $errno, $errstr, 5);

if (!$fp) {
    echo "$errstr ($errno)<br />\n";
} else {
	$orders = array("pizza al salame: 1", "pizza 4 stagioni: 2", "pizza ai frutti di mare: 2", "pizza ortolana: 1", "birra media: 1", "pizza al fromaggio: 2"); 
	//$data ="pizza al salame: 1\npizza 4 stagioni: 2\npizza ai frutti di mare: 2";
	
	$filler1 = "\n";
	$filler2 = "\n\n\n\n\n\n\n";
	$underlineON = "\x1B\x2D\x02";
	$underlineOFF = "\x1B\x2D\x00";
	$boldON = "\x1D\x21\x01";
	$boldOFF = "\x1D\x21\x00";
	$table= $boldON."TAVOLO 10\n\n".$boldOFF;
	//$cut = "\x00\x1Bi\x00";
	//$cut = "\x00\x1B\x69\x00";
	$data = $filler1.$table;
	foreach ($orders as $order) {
		if($order == "birra media: 1"){ //qui ci sarà un flag nella risposta
			//$data .=$boldON;
			$data .=$underlineON;
			$data .= $order;
			$data .="\n";
			//$data .=$boldOFF;
			$data .=$underlineOFF;
		}
		else{
			$data .= $order;
			$data .="\n";
		}
	}
	$data .=$filler2;
	//$filler ="\x00\x1B\x641\x00"; //avanza di una riga righe
	$bip = "\x1C\xC0\x07"; //segnale acustico
	$cut = "\x1B\x69";	//taglio carta
	//fwrite($fp, header("Connection: close", true));
	/*
	$p = fopen("C:\\qr.png", "rb");
	fwrite($fp, fread($p, filesize("C:\\qr.png")));
    */
    fwrite($fp, $bip.$data.$cut);
    echo ("Ho stampato:\n".$data);
    fclose($fp);
    /*
    while (!feof($fp)) {
        echo fgets($fp, 1024);
    }
    fclose($fp);
    */
}



/*
$printer = "http://192.168.1.25:9100";

// Open connection to the thermal printer
$fp = fopen($printer, "w");
if (!$fp){
  die('no connection');
}

$data = " PRINT THIS ";

// Cut Paper
$data .= "\x00\x1Bi\x00";

if (!fwrite($fp,$data)){
  die('writing failed');
}
*/
/*
error_reporting(E_ALL);

include("PrintSend.php");
include("PrintSendLPR.php");

echo "<h1>PrintSendLPR example</h1>";
$lpr = new PrintSendLPR();
$lpr->setHost("192.168.1.25");//Put your printer IP here
$lpr->setPort("9100");
$lpr->setTimeout("2");
//$lpr->setData("C:\\wampp2\\htdocs\\print\\test.txt");//Path to file, OR string to print.
$lpr->setData("prima prova stampa da php");
//echo $lpr->printJob("someQueue");//If your printer has a built-in printserver, it might just accept anything as a queue name.
$data ="pizza al salame: 1\npizza 4 stagioni: 2\npizza ai frutti di mare: 2";

echo $lpr->printJob($data."\n\n\n\n\n\n\n"."\x00\x1Bi\x00");



echo "<h3>Debug</h3><pre>".$lpr->getDebug()."</pre>";

/*
$addr = '\\\\192.168.1.25:9100';
print $addr;
$handle = printer_open($addr); 
printer_set_option($handle, PRINTER_MODE, "RAW");
printer_write($handle, "TEXT To print");
printer_close($handle);
*/

?>