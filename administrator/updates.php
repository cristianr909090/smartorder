<?php
include('../config.php');
if($_POST['cid']){
$cid=$_POST['cid']; //session have problem

$time = time();
$first = false;
if(isset($_POST['first']) && $_POST['first'] == 'true'){
	$first=true;
}
while((time() - $time) < 25) { //max_execution_time in aphace php.ini max 30 sec ma si potrebbe variare
	
	if($first==false){
		sleep(15);
		$lastid = ($_POST['lastid']);
		//$query = "SELECT id, r_type, r_table from requests WHERE id > $lastid";
		//$query = "SELECT r.id, t.description, r.r_type FROM requests r join tables t on r.r_table=t.id where r.client_id=$cid AND r.id > $lastid";
		$query = "SELECT r.id, r.order_id, date_format(r.r_time,'%H:%i:%s %d-%m-%Y') as r_time, t.description, r.r_type, u.username, u.pre_phone_number, u.phone_number FROM requests r left join tables t on r.r_table=t.id left join users u on r.user_id=u.id where r.escapee = 0 AND  r.client_id=$cid AND r.id > $lastid";
	}
	else{
		//$query = "SELECT * from requests WHERE TIME_TO_SEC(TIMEDIFF(NOW(),r_time)) < $period_second;";
		//$query = "SELECT id, r_type, r_table from requests WHERE TIME_TO_SEC(TIMEDIFF(NOW(),r_time)) < $period_second;";
		//$query = "SELECT id, lat, lon, provider, time FROM trace WHERE time between current_date() and date_add(current_date(), INTERVAL 1 DAY)";
		//$query = "SELECT id, lat, lon, provider, time FROM trace";
		//$query = "SELECT r.id, t.description, r.r_type FROM requests r join tables t on r.r_table=t.id where r.client_id=$cid AND TIME_TO_SEC(TIMEDIFF(NOW(),r_time)) < $period_second;";
		$query = "SELECT r.id, r.order_id, date_format(r.r_time,'%H:%i:%s %d-%m-%Y') as r_time, t.description, r.r_type, u.username, u.pre_phone_number, u.phone_number FROM requests r left join tables t on r.r_table=t.id left join users u on r.user_id=u.id where r.escapee = 0 AND  r.client_id=$cid";
	}
	
	//sleep(1);
	//$query = "SELECT * FROM response_per_provider where device_id = $device_id and response_escapee = 0";
	//$query = "SELECT id, r_type, r_table from requests where escapee=0";
	
	$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
	//where TIME_TO_SEC(TIMEDIFF(NOW(),r_time)) < 10;
	/* create one master array of the records */
	
	$records= array();
	if(mysqli_num_rows($result)) {
		while($post = mysqli_fetch_assoc($result)) {
			$records[] = array('record'=>$post);
			//$id = $post['id'];
			//$query_update="UPDATE requests SET escapee=1 WHERE id=$id"; //tolto escapee automatico verrà fatto dal client
			//mysqli_query($db_con, $query_update) or die('Errant query:  '.$query_update);
			//FARE UN UPDATE NEL DEB SETTANDO ESCAPEE = 1 where i vari id sono quelli presi dal result
		}
	}
	//$data = time();
	
	// if we have new data return it
	if(!empty($records)) {
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0','records'=>$records));
		//echo json_encode($records);
		exit;
	}
	usleep(150000);
}
header('Content-type: application/json');
echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
//echo json_encode($records);
}
else{
	header('Content-type: application/json');
	echo json_encode(array('response'=> 'E_CLIENT','returnCode'=>'50'));
}
?>