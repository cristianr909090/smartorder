<?php
include('../../config.php');

$maxTable=200;
$saltNumber=33;
$client_id=1001;
$descriptionPrefix="Tavolo ";
$numberLenght=6;
for($i=1; $i<=$maxTable; $i++){
	$extnumber=(((($i+($saltNumber*7))*13)+43)*3);
	$extstring = str_pad($extnumber, $numberLenght, "0", STR_PAD_LEFT);
	$description=$descriptionPrefix.$i;
	$query="INSERT INTO tables (id, client_id, extnumber , description ) VALUES($i, $client_id, '$extstring','$description');";
	$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
}
?>
