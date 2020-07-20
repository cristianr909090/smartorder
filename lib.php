<?php
session_start();
include('config.php');
require 'lib/PHPMailer/PHPMailerAutoload.php';

if(isset($_POST['operation'])){
	$md5_psw_salt="kjsdhfjsh";
	$md5_psw_salt_admin="olkkohfjshpoiu";
	/*
	if($_POST['operation']=="getTabs"){
		
		$query = "SELECT * FROM tabs where visibility =1 order by position, tOrder";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}

	if($_POST['operation']=="get_category"){
		
		$query = "SELECT * FROM categories order by category_type";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('records'=>$records));
			//echo json_encode($records);
			//break;
		}
	}
	*/	
	if($_POST['operation']=="updateCall" && isset($_POST['id'])){
		$id=$_POST['id'];
		$query = "UPDATE requests set escapee=1 where id=$id";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		
	}

	else if($_POST['operation']=="updateTabEdit" && isset($_POST['tab_id'])){
		$tab_id=$_POST['tab_id'];
		$tab_name=$_POST['tab_name'];
		$tab_visibility=$_POST['tab_visibility'];
		$tab_position=$_POST['tab_position'];
		$tab_tOrder=$_POST['tab_tOrder'];
		$tab_type=$_POST['tab_type'];
		$tab_data=$_POST['tab_data'];

		$query = "UPDATE tabs SET name='$tab_name' , visibility=$tab_visibility, position=$tab_position, tOrder=$tab_tOrder, type=$tab_type, data='$tab_data' WHERE id=$tab_id";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
	}
	else if($_POST['operation']=="addTabEdit"){
		$tab_cid=$_POST['tab_cid'];
		$tab_name=$_POST['tab_name'];
		$tab_visibility=$_POST['tab_visibility'];
		$tab_position=$_POST['tab_position'];
		$tab_tOrder=$_POST['tab_tOrder'];
		$tab_type=$_POST['tab_type'];
		$tab_data=$_POST['tab_data'];

		$query = "INSERT INTO tabs (client_id, name, visibility, position, tOrder, type, data) VALUES ($tab_cid, '$tab_name' , $tab_visibility, $tab_position, $tab_tOrder, $tab_type, '$tab_data')";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
	}
	else if($_POST['operation']=="deleteTabEdit"){
		$tab_id=$_POST['tab_id'];
		$query = "DELETE FROM tabs WHERE id=$tab_id;";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
	}

	else if($_POST['operation']=="insertCall" && isset($_POST['table']) && isset($_POST['cid'])){
		$table = $_POST['table'];
		if($table==-1){
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'1'));

		}else{
			$type="0"; //0 for simple call
			$session="NULL";
			$cid=$_POST['cid'];
			$d = "NULL";
			$dTime="NULL";
			if(isset($_POST['type'])) $type=$_POST['type']; // type is passed from parameter 1=request bill, 2=request water, 3=request coffe, 4 is menù type r_session != null
			if(isset($_POST['session'])) $session="'".$_POST['session']."'";

			if(isset($_POST['d']) && $_POST['d']!='') $d=$_POST['d']; 
			if(isset($_POST['dTime']) && $_POST['dTime']!='') $dTime="'".$_POST['dTime']."'";
			/*
			if($type==4 && isset($_POST['session']) && isset($_POST['order_id'])){
				$r_session=$_POST['session'];
				$order_id=$_POST['order_id'];
				$query = "INSERT INTO requests (r_type, r_table, escapee, r_session, order_id) VALUES ('$type', $table, 0, '$r_session', $order_id)";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				$query = "UPDATE orderrows set client_visibility = 0 where order_id = $order_id";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				//DA SOSTITUIRE
				$_SESSION['order_id']=-1;

			}
			*/
			//else{
			$orderId='NULL';
			if(isset($_POST['session'])){
				$session2 = $_POST['session'];
				$query = "SELECT id from orders where session = '$session2' and client_id=$cid ORDER BY id DESC LIMIT 1";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				
				if(isset($_SESSION['old_orders'])){
					$old_orders = $_SESSION['old_orders'];
				}
				else{
					$old_orders = array();
					$_SESSION['old_orders']=$old_orders;
				}
				while ($record = mysqli_fetch_array($result)){
					array_push($old_orders, $record[0]);
					$orderId=$record[0];
				}
				$_SESSION['old_orders']=$old_orders;
			}
			$queryC = "SELECT user_login_required, enable_print from clients where id=$cid LIMIT 1";
			$result = mysqli_query($db_con,$queryC) or die('Errant query:  '.$queryC);

			while ($record = mysqli_fetch_array($result)){
				$enable_print=$record['enable_print'];
				$user_login_required=$record['user_login_required'];
			}
			$userId='NULL';
			if($user_login_required==1){
				if(isset($_SESSION['userLoginId'])){
					$userId=$_SESSION['userLoginId'];
				}
				else{
					header('Content-type: application/json');
					echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
					exit;
				}
				
			}
			$query = "INSERT INTO requests (client_id, r_type, r_table, escapee, r_session, order_id, user_id, delivery, delivery_time) VALUES ($cid, '$type', $table, 0, $session, $orderId, $userId, $d, $dTime)";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			$lastinserdetId = mysqli_insert_id($db_con);
			//}
			
						
			if ($enable_print==1) {
				// type is passed from parameter 1=request bill, 2=request water, 3=request coffe, 4 is menù type r_session != null
				if($type == "4" ){
					//$query = "select r.r_table,  COALESCE(m.printdescription,m.name) as name, ors.number, ors.note from requests r inner join orders o on r.r_session = o.session inner join orderrows ors on o.id = ors.order_id inner join menurows m on ors.row_id = m.id where r.id = $lastinserdetId";
					$query = "SELECT 
									t.description as r_table,  
									COALESCE(m.printdescription,m.name) as name, 
									ors.number, 
									ors.note 
								from 
									requests r inner join tables t on r.r_table=t.id inner join orders o on r.r_session = o.session inner join orderrows ors on o.id = ors.order_id inner join menurows m on ors.row_id = m.id 
								where r.id = $lastinserdetId";
					$tabl ="-1";
					$data="";
					$result =mysqli_query($db_con,$query) or die('Errant query:  '.$query);
					while ($record = mysqli_fetch_array($result)){
						$tabl = $record[0];
						//$data .= $record[1].": ".$record[2]."\n";
						$data .= " ".$record[2].": \t".$record[1];//."\n";
						if($record[3] != ""){
							$data .= " (".$record[3].")\n";
						}
						else{
							$data .= "\n";
						}
					}
				}
				else{
					$query = "select printdescription from callstype where type=$type";
					$tabl =$table;
					$data="";
					$result =mysqli_query($db_con,$query) or die('Errant query:  '.$query);
					while ($record = mysqli_fetch_array($result)){
						$data .= "\t".$record[0]."\n";
					}
				}
				$fp = stream_socket_client($connessione, $errno, $errstr, 3);
				if (!$fp) {
					//echo "$errstr ($errno)<br />\n";
					for ($i=0; $i < $tentativi; $i++) { 
						usleep(20);
						$fp = stream_socket_client($connessione, $errno, $errstr, 3);
						if ($fp){
							$table= $filler1."possibile errore segnalare a Fabio".$filler1.$boldON.$tabl.$boldOFF.$filler1.$filler1;
							$towrite = $bip.$table.$data.$filler2.$cut;
							fwrite($fp, $towrite);
							//echo ("Ho stampato:\n".$towrite);
							fclose($fp);
							break;
						}
					}
				} 
				else {
					$table= $filler1.$boldON.$tabl.$boldOFF.$filler1.$filler1;
					$towrite = $bip.$table.$data.$filler2.$cut;
					fwrite($fp, $towrite);
					//echo ("Ho stampato:\n".$towrite);
					fclose($fp);
				}
				//break;
			}

			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'requestId'=>$lastinserdetId));
		}
		
	}
	/*
	else if($_POST['operation']=="getRows" && isset($_POST['tabId'])){
		//$section=$_POST['section'];
		$tabId=$_POST['tabId'];
		//$query = "SELECT * FROM menurows where section=$section and status = 1 order by name";
		$query = "SELECT c.name as cName, IF(c.saleable=0,0,mc.saleable) as saleable, m.id, m.name, m.description, m.price, m.image_path_low from categories c LEFT JOIN menurowcategories mc on mc.idc = c.id LEFT JOIN menurows m on mc.idm = m.id where COALESCE(m.status,1) = 1 and c.visibility =1 and c.tabId = $tabId order by  mc.mcOrder";
		
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}
	*/
	else if($_POST['operation']=="getDetail" && isset($_POST['id']) && isset($_POST['cid'])){
		$id=$_POST['id'];
		$cid= $_POST['cid'];
		//$query = "SELECT * FROM menurows where id=$id";
		$query = "SELECT name, price, COALESCE(long_description,'') as long_description, COALESCE(long_description_en,'') as long_description_en, image_path_high, note FROM menurows where id=$id AND client_id=$cid";
		
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}
	else if($_POST['operation']=="getOrderDetail" && isset($_POST['oid']) && isset($_POST['session'])){
		$oid=$_POST['oid'];
		$session=$_POST['session'];
		$query = "SELECT m.name, m.price, COALESCE(m.long_description,'') as long_description, COALESCE(m.long_description_en,'') as long_description_en, m.image_path_high, m.note, orr.note as notetext, orr.number FROM menurows as m join orderrows as orr on m.id = orr.row_id join orders as o on orr.order_id = o.id where orr.id= $oid and o.session = '$session'";
		
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}
	else if($_POST['operation']=="insertOrderRow" && isset($_POST['rowId']) && isset($_POST['number']) && isset($_POST['session']) && isset($_POST['table']) && isset($_POST['note']) && isset($_POST['cid'])){
		
		$rowId=$_POST['rowId'];
		$number=$_POST['number'];
		$session=$_POST['session'];
		$table=$_POST['table'];
		$note=$_POST['note'];
		$cid=$_POST['cid'];

		$queryS = "SELECT id FROM orders where session='$session' and client_id=$cid";
		
		//error_log(' /n 1 '.$queryS, 3, "log/log.txt");

		$result = mysqli_query($db_con,$queryS);
		if (!$result) {
		    echo 'Could not run query: ' . mysqli_error() .$queryS;
		    exit;
		}
		$row = mysqli_fetch_row($result);
		
		//echo (intval($order_id));

		$orderId=$row[0];

		//error_log(' /n 2 '.$orderId, 3, "log/log.txt");

		if(empty($orderId)) {
			$query = "INSERT INTO orders (client_id, session, tableId) VALUES ($cid, '$session', '$table')";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			$orderId=mysqli_insert_id($db_con);

			//error_log(' /n 3 '.$orderId, 3, "log/log.txt");
		}
		//controllo se è stato già inserito e nel caso faccio l'update del number
		$queryS2 = "SELECT id FROM orderrows where row_id='$rowId' and order_id=$orderId and note='$note'";
		$result = mysqli_query($db_con,$queryS2);
		if (!$result) {
		    echo 'Could not run query: ' . mysqli_error() .$queryS2;
		    exit;
		}
		$row2 = mysqli_fetch_row($result);
		
		$rowselected=$row2[0];

		//error_log(' /n 4 '.$rowselected, 3, "log/log.txt");

		if(empty($rowselected)) {
			$query = "INSERT INTO orderrows (client_id, order_id, row_id, number, note) VALUES ($cid, $orderId, $rowId, $number, '$note')";
			//error_log(' /n 5 '.$rowselected, 3, "log/log.txt");
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}
		else{
			$query="UPDATE orderrows set number = number+$number where id = $rowselected";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}

		
	}
	else if($_POST['operation']=="getCart" && isset($_POST['session']) && isset($_POST['cid'])){
		$session=$_POST['session'];
		$cid=$_POST['cid'];
		$query = "SELECT o.id as oid, m.id, m.name, COALESCE(m.description,'') as description, m.price, CONCAT(left(m.price, length(m.price)-2),',',right(m.price, 2)) as pricedes ,m.image_path_low, o.id as cart_row_id, o.order_id, o.number from menurows as m JOIN orderrows as o on m.id = o.row_id where m.client_id=$cid AND o.order_id = (SELECT max(id) FROM orders where session='$session') and client_visibility = 1 order by m.name";
		
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}
	else if($_POST['operation']=="pushNumber" && isset($_POST['cartRowId'])){
		$id=$_POST['cartRowId'];
		$queryS = "SELECT m.qty_min, m.qty_max, m.qty_step FROM menurows m join orderrows o on o.row_id=m.id where o.id=$id and m.client_id=o.client_id;";
		$result = mysqli_query($db_con,$queryS) or die('Errant query:  '.$queryS);

		$min;
		$max;
		$step;

		while ($record = mysqli_fetch_array($result)){
			$min=$record['qty_min'];
			$max=$record['qty_max'];
			$step=$record['qty_step'];
		}
		$query="UPDATE orderrows set number = IF(number < $max , number+$step, number) where id = $id";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		exit;
	}
	else if($_POST['operation']=="pullNumber" && isset($_POST['cartRowId'])){
		$id=$_POST['cartRowId'];
		$queryS = "SELECT m.qty_min, m.qty_max, m.qty_step FROM menurows m join orderrows o on o.row_id=m.id where o.id=$id and m.client_id=o.client_id;";
		$result = mysqli_query($db_con,$queryS) or die('Errant query:  '.$queryS);

		$min;
		$max;
		$step;

		while ($record = mysqli_fetch_array($result)){
			$min=$record['qty_min'];
			$max=$record['qty_max'];
			$step=$record['qty_step'];
		}
		$query="UPDATE orderrows set number = IF(number > $min , number-$step, number) where id = $id";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		exit;
	}
	else if($_POST['operation']=="deleteOrderRow" && isset($_POST['cartRowId'])){
		$id=$_POST['cartRowId'];
		$query="DELETE FROM orderrows where id = $id";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		exit;
	}
	else if($_POST['operation']=="updateOrderRow" && isset($_POST['rowOrderId']) && isset($_POST['number']) && isset($_POST['note'])){
		$id=$_POST['rowOrderId'];
		$number=$_POST['number'];
		$note=mysqli_real_escape_string($db_con,$_POST['note']);
		$query="UPDATE orderrows set number = $number, note= '$note' where id = $id";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		exit;
	}
	else if($_POST['operation']=="login" && isset($_POST['username']) && isset($_POST['password'])){
		$usr=mysqli_real_escape_string($db_con,$_POST['username']);
		$password=md5(($_POST['password']).$md5_psw_salt);
		
		$query="SELECT id, client_id, username, activated, image_path_low from users where (username='$usr' OR phone_number = '$usr') AND password = '$password' LIMIT 1";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

		
		
		
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
				
				$_SESSION['userLoginId'] = $post['id'];
				$_SESSION['userLoginUsername'] = $post['username'];
				$_SESSION['userLoginActvated'] = $post['activated'];
			}
		}
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}

	else if($_POST['operation']=="activateAccount" && isset($_POST['code'])){
		
		
		if(isset($_SESSION['userLoginId'])){
			$id=$_SESSION['userLoginId'];
			$code=mysqli_real_escape_string($db_con,$_POST['code']);
			$query="UPDATE users set activated = 1 where id=$id and confirmation_code=$code";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			if(mysqli_affected_rows()>0){

				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			}
				
			else{

				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_NOUPDATE','returnCode'=>'1'));
			}
			exit;
		}
		else{

			header('Content-type: application/json');
			echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
			exit;
		}
		
	}

	else if($_POST['operation']=="logout"){
		
		unset($_SESSION['userLoginId']);
		unset($_SESSION['userLoginUsername']);
		unset($_SESSION['userLoginActvated']);

		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));

	}

	else if($_POST['operation']=="isLogin"){
		if(isset($_SESSION['userLoginId'])){
			$id = $_SESSION['userLoginId'];
			$query="SELECT id, username, activated, image_path_low from users where id= $id";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

			$records= array();
			if(mysqli_num_rows($result)) {
				while($post = mysqli_fetch_assoc($result)) {
					$records[] = array('record'=>$post);
				}
			}
			// if we have new data return it
			if(!empty($records)) {
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
				//echo json_encode($records);
				//break;
			}
			else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			}

		}
		else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}
	else if($_POST['operation']=="forgetPassword" && isset($_POST['username'])){
		$username=mysqli_real_escape_string($db_con,$_POST['username']);
		$queryS = "SELECT id FROM users where username = '$username'";
		

		$result = mysqli_query($db_con,$queryS);
		if (!$result) {
		    echo 'Could not run query: ' . mysqli_error() .$queryS;
		    exit;
		}
		$row = mysqli_fetch_row($result);

		$userId=$row[0];

		if(empty($userId)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_EUSER','returnCode'=>'1'));
			exit;
		}
		else{
			//creazione password random
			$passwordClear=rand(10000000, 99999999);
			$password=md5(($passwordClear).$md5_psw_salt);

			$query="UPDATE users set password='$password' where id =$userId";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);


			$mail = new PHPMailer;
			$mail->isSMTP();
			$mail->Host = $smtp_address;
			$mail->SMTPAuth = true;                               // Enable SMTP authentication
			$mail->Username = $smtp_usr;                            // SMTP username
			$mail->Password = $smtp_psw;                           // SMTP password
			$mail->From = $email_from;
			$mail->FromName = $email_from_name;

			$mail->addAddress($username, $username); 
			$mail->WordWrap = 50;                                 // Set word wrap to 50 characters

			$mail->Subject = 'Password dimenticata Servizi Smart';
			$mail->Body    = 'riepilgo dati di accesso </br> <p>Utente: <b>'.$username.'</b> </br> <p>Password: <b>'.$passwordClear.'</b>';
			$mail->AltBody = 'riepilgo dati di accesso Utente: '.$username.' Password: '.$passwordClear;

			if(!$mail->send()) {
   				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_EMAIL','returnCode'=>'3'));
				exit;
			}
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}

	}
	else if($_POST['operation']=="changePassword" && isset($_POST['passwordNew']) && isset($_POST['passwordOld'])){
		
		$pswold=mysqli_real_escape_string($db_con,$_POST['passwordOld']);
		$pswnew=mysqli_real_escape_string($db_con,$_POST['passwordNew']);

		$pswoldc=md5(($pswold).$md5_psw_salt);
		$pswnewc=md5(($pswnew).$md5_psw_salt);

		$id=-1;
		if(isset($_SESSION['userLoginId'])){
			$id = $_SESSION['userLoginId'];
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_ESESSION','returnCode'=>'100'));
			exit;
		}
		$queryS = "SELECT password, username  FROM users where id = $id";
		

		$result = mysqli_query($db_con,$queryS);
		if (!$result) {
		    echo 'Could not run query: ' . mysqli_error() .$queryS;
		    exit;
		}
		$row = mysqli_fetch_row($result);

		$pass=$row[0];
		$username = $row[1];

		if(empty($pass) || $pass != $pswoldc) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_EPASS','returnCode'=>'2'));
			exit;
		}
		else{

			$query="UPDATE users set password='$pswnewc' where id =$id";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);


			$mail = new PHPMailer;
			$mail->isSMTP();
			$mail->Host = $smtp_address;
			$mail->SMTPAuth = true;                               // Enable SMTP authentication
			$mail->Username = $smtp_usr;                            // SMTP username
			$mail->Password = $smtp_psw;                           // SMTP password
			$mail->From = $email_from;
			$mail->FromName = $email_from_name;

			$mail->addAddress($username, $username); 
			$mail->WordWrap = 50;                                 // Set word wrap to 50 characters

			$mail->Subject = 'Cambio password Servizi Smart';
			$mail->Body    = 'riepilgo dati di accesso </br> <p>Utente: <b>'.$username.'</b> </br> <p>Password: <b>'.$pswnew.'</b>';
			$mail->AltBody = 'riepilgo dati di accesso Utente: '.$username.' Password: '.$pswnew;

			if(!$mail->send()) {
   				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_EMAIL','returnCode'=>'3'));
				exit;
			}
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}
		/*
		$query="UPDATE users set password='$pswnewc' where id =$id";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

		$mail = new PHPMailer;
		$mail->isSMTP();
		$mail->Host = $smtp_address;
		$mail->SMTPAuth = true;                               // Enable SMTP authentication
		$mail->Username = $smtp_usr;                            // SMTP username
		$mail->Password = $smtp_psw;                           // SMTP password
		$mail->From = $email_from;
		$mail->FromName = $email_from_name;

		$mail->addAddress($username, $username); 
		$mail->WordWrap = 50;                                 // Set word wrap to 50 characters

		$mail->Subject = 'AAAA';
		$mail->Body    = 'riepilgo dati di accesso </br>';
		$mail->AltBody = 'riepilgo dati di accesso';

		if(!$mail->send()) {
   			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_EMAIL','returnCode'=>'3'));
			exit;
		}
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		exit;

/*
		$mail = new PHPMailer;
		$mail->isSMTP();
		$mail->Host = $smtp_address;
		$mail->SMTPAuth = true;                               // Enable SMTP authentication
		$mail->Username = $smtp_usr;                            // SMTP username
		$mail->Password = $smtp_psw;                           // SMTP password
		$mail->From = $email_from;
		$mail->FromName = $email_from_name;

		$mail->addAddress($username, $username); 
		$mail->WordWrap = 50;                                 // Set word wrap to 50 characters

		$mail->Subject = 'Cambio password Servizi Smart';
		$mail->Body    = 'Password cambiata con successo</br> <p>Nuova password: <b>'.$pswnew.'</b>';
		$mail->AltBody = 'Password cambiata con successo Nuova password: '.$pswnew;

		if(!$mail->send()) {
   			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_EMAIL','returnCode'=>'3'));
			exit;
		}
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		exit;
		*/

	}
	//$.post('lib.php', {operation: "insertUserAddress", aName: aName, aLastName: aLastName, aAddress: aAddress, aNumber: aNumber, aApartmentNumber: aApartmentNumber, aFloor: aFloor, aZipCode: aZipCode, aRegioni: aRegioni, aProvince: aProvince, aComuni: aComuni}, onInsertUserAddress);
														

	else if($_POST['operation']=="insertUserAddress" && isset($_POST['aName']) && isset($_POST['aLastName']) && isset($_POST['aAddress']) && isset($_POST['aNumber']) && isset($_POST['aDoorBell']) && isset($_POST['aZipCode']) && isset($_POST['aRegioni']) && isset($_POST['aProvince']) && isset($_POST['aComuni'])){
		$id=-1;
		if(isset($_SESSION['userLoginId'])){
			$id = $_SESSION['userLoginId'];
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_ESESSION','returnCode'=>'100'));
			exit;
		}

		$aApartmentNumber="NULL";
		$aFloor="NULL";

		$aName = $_POST['aName'];
		$aLastName = $_POST['aLastName'];
		$aAddress = $_POST['aAddress'];
		$aNumber = $_POST['aNumber'];
		$aDoorBell = $_POST['aDoorBell'];
		$aZipCode = $_POST['aZipCode'];
		$aRegioni = $_POST['aRegioni'];
		$aProvince = $_POST['aProvince'];
		$aComuni = $_POST['aComuni'];

		if(isset($_POST['aApartmentNumber'])){
			$aApartmentNumber="'".$_POST['aApartmentNumber']."'";
		}
		if(isset($_POST['aFloor'])){
			$aFloor="'".$_POST['aFloor']."'";
		}
		$query ="INSERT INTO useraddresses (user_id, name, last_name, address, address_number, doorbell, apartment_number, floor, zip_code, district_id) VALUES ($id, '$aName', '$aLastName', '$aAddress', '$aNumber', '$aDoorBell', $aApartmentNumber, $aFloor, $aZipCode, $aComuni)";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		exit;
		
	}
	else if($_POST['operation']=="changeNumber" && isset($_POST['cellpre']) && isset($_POST['cell'])){
		
		$prefix=mysqli_real_escape_string($db_con,$_POST['cellpre']);
		$number=mysqli_real_escape_string($db_con,$_POST['cell']);


		$id=-1;
		if(isset($_SESSION['userLoginId'])){
			$id = $_SESSION['userLoginId'];
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_ESESSION','returnCode'=>'100'));
			exit;
		}

		$queryS = "SELECT id FROM users where pre_phone_number='$prefix' AND phone_number = '$number'";
		

		$result = mysqli_query($db_con,$queryS);
		if (!$result) {
		    echo 'Could not run query: ' . mysqli_error() .$queryS;
		    exit;
		}
		$row = mysqli_fetch_row($result);

		$userId=$row[0];


		if(empty($userId)) {

			$confirm=rand(100000, 999999);

			$query="UPDATE users set pre_phone_number=$prefix, phone_number=$number, confirmation_code=$confirm, activated=0 where id=$id";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

			$fields = array(
			'method' => 'send_sms_classic',
			//'method' => 'send_sms_basic',
			'username' => $gateway_usr,
			'password' => $gateway_psw,
			'recipients[]' => $prefix.$number,
			'text' => 'codice attivazione: '.$confirm,
			'sender_string' => $sender_name
			);
			
			// use key 'http' even if you send the request to https://...

			$options = array(
			    'http' => array(
		        'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
		        'method'  => 'POST',
		        'content' => http_build_query($fields),
		    	),
			);
			$context = stream_context_create($options);
			$result = file_get_contents($gateway_url, false, $context);

			parse_str($result, $output);



			if ($output['status'] == 'success'){
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
				exit;
			}
			else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_NOSMS','returnCode'=>'2'));
				exit;
			}
		}
		else{

			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_ENUMBER','returnCode'=>'1'));
			exit;
		}
	}

	else if($_POST['operation']=="register" && isset($_POST['username']) && isset($_POST['password']) && isset($_POST['prefix']) && isset($_POST['number']) && isset($_POST['email']) && isset($_POST['cid'])){
		

		$username=mysqli_real_escape_string($db_con,$_POST['username']);

		$password=md5(($_POST['password']).$md5_psw_salt);
		$passwordClear = $_POST['password'];
		$prefix=mysqli_real_escape_string($db_con,$_POST['prefix']);
		$number=mysqli_real_escape_string($db_con,$_POST['number']);
		$email=mysqli_real_escape_string($db_con,$_POST['email']);
		$confirm=rand(100000, 999999);
		$cid = $_POST['cid'];

		$queryS = "SELECT id FROM users where pre_phone_number='$prefix' AND phone_number = '$number'";
		

		$result = mysqli_query($db_con,$queryS);
		if (!$result) {
		    echo 'Could not run query: ' . mysqli_error() .$queryS;
		    exit;
		}
		$row = mysqli_fetch_row($result);

		$userId=$row[0];


		if(empty($userId)) {
			$query="INSERT INTO users (client_id, username, password , pre_phone_number , phone_number , email , confirmation_code , activated ) VALUES($cid, '$username','$password','$prefix','$number','$email', '$confirm' ,0)";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);


			//SEND MAIL

			
			$mail = new PHPMailer;
			$mail->isSMTP();
			$mail->Host = $smtp_address;
			$mail->SMTPAuth = true;                               // Enable SMTP authentication
			$mail->Username = $smtp_usr;                            // SMTP username
			$mail->Password = $smtp_psw;                           // SMTP password
			$mail->From = $email_from;
			$mail->FromName = $email_from_name;

			$mail->addAddress($username, $username); 
			$mail->WordWrap = 50;                                 // Set word wrap to 50 characters

			$mail->Subject = 'Creazione nuovo account Servizi Smart';
			$mail->Body    = 'riepilgo dati di accesso </br> <p>Utente: <b>'.$username.'</b> </br> <p>Password: <b>'.$passwordClear.'</b>';
			$mail->AltBody = 'riepilgo dati di accesso Utente: '.$username.' Password: '.$passwordClear;

			if(!$mail->send()) {
   				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_EMAIL','returnCode'=>'3'));
				exit;
			}




			// Submit those variables to the server
			$fields = array(
			'method' => 'send_sms_classic',
			//'method' => 'send_sms_basic',
			'username' => $gateway_usr,
			'password' => $gateway_psw,
			'recipients[]' => $prefix.$number,
			'text' => 'codice attivazione: '.$confirm,
			'sender_string' => $sender_name
			);
			
			// use key 'http' even if you send the request to https://...
			$options = array(
			    'http' => array(
			        'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
			        'method'  => 'POST',
			        'content' => http_build_query($fields),
			    ),
			);
			$context = stream_context_create($options);
			$result = file_get_contents($gateway_url, false, $context);

			parse_str($result, $output);
			//echo $output['status']; 
			//echo $output['remaining_sms']; // foo bar

			/*

			$fields_string="";
			//url-ify the data for the POST
			foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
			rtrim($fields_string,'&');
			
			//open connection
			$ch = curl_init();
			
			//set the url, number of POST vars, POST data
			curl_setopt($ch,CURLOPT_URL,$gateway_url);
			curl_setopt($ch,CURLOPT_POST,count($fields));
			curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);
			
			//execute post
			$result = curl_exec($ch);

			//non fanno ciò che mi aspetto
			curl_setopt($ch, CURLOPT_NOBODY, true);
			curl_setopt($ch, CURLOPT_HEADER, false); //clear header
			
			//close connection
			curl_close($ch);

			*/



			if ($output['status'] == 'success'){
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
				exit;
			}
			else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_NOSMS','returnCode'=>'2'));
				exit;
			}
		}
		else{

			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_ENUMBER','returnCode'=>'1'));
			exit;
		}
	}

	//ADMIN FUNCTION
	//CHECK ALWAYS IF SESSION IS OK
	else if($_POST['operation']=="adminLogin" && isset($_POST['username']) && isset($_POST['password'])){
		//$usr=mysqli_real_escape_string($db_con,$_POST['username']);
		$usr=mysqli_real_escape_string($db_con,$_POST['username']) ;
		$password=md5(($_POST['password']).$md5_psw_salt_admin);
		
		$query="SELECT id, client_id, username, activated from adminusers where (username='$usr' OR phone_number = '$usr') AND password = '$password' LIMIT 1";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
				
				$_SESSION['adminLoginId'] = $post['id'];
				$_SESSION['adminLoginUsername'] = $post['username'];
				$_SESSION['adminLoginActvated'] = $post['activated'];
				$_SESSION['adminClientId'] = $post['client_id'];
			}
		}
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}

	else if($_POST['operation']=="langChanged"){
		$_SESSION['lang']=$_POST['lang'];
	}

	else if($_POST['operation']=="adminLogout"){
		
		unset($_SESSION['adminLoginId']);
		unset($_SESSION['adminLoginUsername']);
		unset($_SESSION['adminLoginActvated']);
		unset($_SESSION['adminClientId']);

		header('Content-type: application/json');
		echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));

	}


	else if($_POST['operation']=="insertProduct" &&  isset($_POST['cid']) && isset($_POST['pName']) && isset($_POST['pPrintDescription']) && isset($_POST['pPrice'])&& isset($_POST['pStatus'])&& isset($_POST['pNote'])&& isset($_POST['pDescription'])  && isset($_POST['pLongDescription'])&& isset($_POST['pLongDescriptionEn']) && isset($_POST['pImgH']) && isset($_POST['pImgL']) && isset($_POST['qmin']) && isset($_POST['qmax']) && isset($_POST['qstep']) ){
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$cid=$_POST['cid'];
			$name=mysqli_real_escape_string($db_con,$_POST['pName']);
			$printdescription=mysqli_real_escape_string($db_con,$_POST['pPrintDescription']);
			$price=mysqli_real_escape_string($db_con,$_POST['pPrice']);
			$status=$_POST['pStatus'];
			$note=$_POST['pNote'];
			$category=$_POST['pCategory'];
			$description=mysqli_real_escape_string($db_con,$_POST['pDescription']);
			$long_description=mysqli_real_escape_string($db_con,$_POST['pLongDescription']);
			$long_description_en=mysqli_real_escape_string($db_con,$_POST['pLongDescriptionEn']);
			$img_high=$_POST['pImgH'];
			$img_low=$_POST['pImgL'];
			$category_sequence=$_POST['pSequence'];

			$qmin=$_POST['qmin'];
			$qmax=$_POST['qmax'];
			$qstep=$_POST['qstep'];
		
			if ($printdescription =='') $printdescription='NULL' ;
			else $printdescription="'".$printdescription."'";

			if ($description =='') $description='NULL' ;
			else $description="'".$description."'";		
		
			if ($long_description =='') $long_description='NULL' ;
			else $long_description="'".$long_description."'";	
		
			if ($long_description_en =='') $long_description_en='NULL' ;
			else $long_description_en="'".$long_description_en."'";

			$query="INSERT INTO menurows (client_id,name,printdescription,price,status,note,description,long_description,long_description_en,image_path_low,image_path_high, qty_min, qty_max, qty_step) VALUES ($cid,'$name',$printdescription,'$price',$status,$note,$description,$long_description,$long_description_en,'$img_low','$img_high', $qmin, $qmax, $qstep )";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

			$last_insert_id=mysqli_insert_id($db_con);
			$query1="INSERT INTO menurowcategories (client_id,idM,idC,saleable,mcOrder) VALUES ($cid,$last_insert_id,$category,1,$category_sequence)";
			$result1 = mysqli_query($db_con,$query1) or die('Errant query:  '.$query);
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}
	else if($_POST['operation']=="updateProduct" &&  isset($_POST['cid']) && isset($_POST['id']) && isset($_POST['pName']) && isset($_POST['pPrintDescription']) && isset($_POST['pPrice'])&& isset($_POST['pStatus'])&& isset($_POST['pNote'])&& isset($_POST['pDescription'])  && isset($_POST['pLongDescription'])&& isset($_POST['pLongDescriptionEn']) && isset($_POST['pImgH']) && isset($_POST['pImgL']) && isset($_POST['qmin']) && isset($_POST['qmax']) && isset($_POST['qstep']) ){
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$id=$_POST['id'];
			$cid=$_POST['cid'];
			$name=mysqli_real_escape_string($db_con,$_POST['pName']);
			$printdescription=mysqli_real_escape_string($db_con,$_POST['pPrintDescription']);
			$price=mysqli_real_escape_string($db_con,$_POST['pPrice']);
			$status=$_POST['pStatus'];
			$note=$_POST['pNote'];
			$category=$_POST['pCategory'];
			$description=mysqli_real_escape_string($db_con,$_POST['pDescription']);
			$long_description=mysqli_real_escape_string($db_con,$_POST['pLongDescription']);
			$long_description_en=mysqli_real_escape_string($db_con,$_POST['pLongDescriptionEn']);
			$img_high=$_POST['pImgH'];
			$img_low=$_POST['pImgL'];
			$category_sequence=$_POST['pSequence'];
		
			$qmin=$_POST['qmin'];
			$qmax=$_POST['qmax'];
			$qstep=$_POST['qstep'];
		
			if ($printdescription =='') $printdescription='NULL' ;
			else $printdescription="'".$printdescription."'";

			if ($description =='') $description='NULL' ;
			else $description="'".$description."'";		
		
			if ($long_description =='') $long_description='NULL' ;
			else $long_description="'".$long_description."'";	
		
			if ($long_description_en =='') $long_description_en='NULL' ;
			else $long_description_en="'".$long_description_en."'";

			$query="UPDATE menurows set name ='$name', printdescription = $printdescription, price ='$price', status =$status, note =$note, description =$description, long_description =$long_description, long_description_en =$long_description_en, image_path_low = '$img_low', image_path_high = '$img_high', qty_min = $qmin, qty_max = $qmax, qty_step = $qstep where id=$id";
			
			$query_select="SELECT * From menurowcategories where idM=$id";
			$result_select=mysqli_query($db_con,$query_select) or die('Errant query:  '.$query_select);
			$query1='';
			if(mysqli_num_rows($result_select)) {
				$query1="UPDATE menurowcategories set idC=$category, mcOrder=$category_sequence where idM=$id";
			}else $query1="INSERT INTO menurowcategories (client_id,idM,idC,saleable,mcOrder) VALUES ($cid,$id,$category,1,$category_sequence)";
			
			//$query="INSERT INTO menurows (name,printdescription,price,status,note,description,long_description,long_description_en,image_path_low,image_path_high) VALUES ('$name',$printdescription,'$price',$status,$note,$description,$long_description,$long_description_en,'$img_low','$img_high' )";

			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			$result1 = mysqli_query($db_con,$query1) or die('Errant query:  '.$query1);
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}
	else if($_POST['operation']=="disableOrEnableProduct" && isset($_POST['product_id']) && isset($_POST['type'])){
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$id=$_POST['product_id'];
			if($_POST['type']=='delete'){
				//check if this is only one or first project
				// $query="SELECT TOP 1 id FROM menurowcategories where idc=(SELECT idC FROM menurowcategories where id=$id) Order by mcOrder";
				// $results = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				// while($result = mysqli_fetch_assoc($results)) {
				// 	if($id = $result["id"]);
				// }

				// delete from orderrows
				$query="DELETE FROM orderrows where row_id=$id";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

				//delete from menurowcategories
				$query_1="DELETE FROM menurowcategories where idM=$id";
				$result_1 = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

				// delete from menurows
				$query="DELETE FROM menurows where id=$id";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				
			}else{
				$status=($_POST['type']=='disable')?0:1;
				$query="UPDATE menurows set status = $status where id=$id";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			}
			
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}
	else if($_POST['operation']=="getProduct" && isset($_POST['id']) && isset($_POST['cid'])){
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$id=$_POST['id'];
			$cid=$_POST['cid'];
			//$query = "SELECT * FROM menurows where id=$id";
			//$query = "SELECT name, price, COALESCE(long_description,'') as long_description, COALESCE(long_description_en,'') as long_description_en, image_path_high FROM menurows where id=$id";
			$query = "SELECT name, COALESCE(printdescription,'') as printdescription, price, COALESCE(description,'') as description, COALESCE(long_description,'') as long_description, COALESCE(long_description_en,'') as long_description_en, image_path_low, image_path_high, status, note, qty_min, qty_max, qty_step FROM menurows where id=$id and client_id = $cid";
			
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			$records= array();
			if(mysqli_num_rows($result)) {
				while($post = mysqli_fetch_assoc($result)) {
					$records[] = array('record'=>$post);
				}
			}
			$query1 = "SELECT idM, idC, mcOrder FROM menurowcategories where idM=$id and client_id = $cid";
			$result1 = mysqli_query($db_con,$query1) or die('Errant query:  '.$query1);
			if(mysqli_num_rows($result1)) {
				while($post = mysqli_fetch_assoc($result1)) {
					$category_id = $post["idC"];
					$sequence = $post["mcOrder"];
				}
			}
			// if we have new data return it
			if(!empty($records)) {
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records, 'category_id'=>$category_id, 'sequence'=>$sequence));
				//echo json_encode($records);
				//break;
			}
			else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			}
		}
		else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}
	else if($_POST['operation']=="getCategory" && isset($_POST['cid'])){
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$cid=$_POST['cid'];
			$query = "SELECT id, name FROM categories where client_id = $cid";
			
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			$records= array();
			if(mysqli_num_rows($result)) {
				while($post = mysqli_fetch_assoc($result)) {
					$records[] = array('record'=>$post);
				}
			}
			// if we have new data return it
			if(!empty($records)) {
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			}
			else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			}
		}else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}
	else if($_POST['operation']=="escapeRequest" && isset($_POST['id']) && isset($_POST['cid'])){
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$id=$_POST['id'];
			$cid=$_POST['cid'];
			//$query = "SELECT * FROM menurows where id=$id";
			//$query = "SELECT name, price, COALESCE(long_description,'') as long_description, COALESCE(long_description_en,'') as long_description_en, image_path_high FROM menurows where id=$id";
			$query = "UPDATE requests set escapee=1 where id=$id and client_id=$cid";
			
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
		else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}
	

	// Inserita da me
	else if($_POST['operation']=="insertCategory" ){
			
		
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$cid=$_POST['cid'];
			$name=$_POST['cName'];
			$tab=$_POST['cTab1'];
			$parent=$_POST['cParent'];
			$order=$_POST['cOrder'];
			$saleable=$_POST['cSaleable'];
			$status=$_POST['cStatus'];
			$expanded=$_POST['cExpanded'];
			$Rank=$order;
			
		  	if ($parent >0) {
			$query="INSERT INTO categories (client_id,tabid,name,visibility,cOrder,level,saleable,parent,expanded,rank) Select $cid,$tab,'$name',visibility,$order,(level + 1) as level,$saleable,$parent,$expanded,concat(rank,'.','$order') FROM categories where id=$parent and tabId=$tab" ;
		 	}

			if ($parent ==0) {
			 $query="INSERT INTO categories (client_id,tabid,name,visibility,cOrder,level,saleable,parent,expanded,rank)  values ($cid,$tab,'$name',$status,$order,0,$saleable,0,$expanded,'$order')" ;
		 	}
			
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>$query));
			exit;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'110'));
		}
		
		

	}
	else if($_POST['operation']=="checkCategoryDanger" ){
			
		
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId'])  && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$categoryId=$_POST['categoryId'];

			$query="SELECT * FROM menurows WHERE category=$categoryId" ;
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			if(mysqli_num_rows($result)){
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>mysqli_num_rows($result)));
				exit;
			}else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			}
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}
	else if($_POST['operation']=="deleteCategory" ){
			
		
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId'])  && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$categoryId=$_POST['categoryId'];

			$query="DELETE FROM  categories WHERE id=$categoryId" ;
		 	
			
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}



		// inserita da me x gestire modifica categorie
       	else if($_POST['operation']=="modifyCategory" ){
			
		
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$cid=$_POST['cid'];
			$name=$_POST['cName'];
			$tab=$_POST['cTab1'];
			$parent=$_POST['cParent'];
			$order=$_POST['cOrder'];
			$saleable=$_POST['cSaleable'];
			$status=$_POST['cStatus'];
			$expanded=$_POST['cExpanded'];
			$elemento=$_POST['cElemModif'];

		 	//$query="update categories set  saleable=$saleable, cOrder=$order, visibility=$status    where id=$parent and client_id=$cid";

			if (empty($parent)) {
			$query="update categories set  saleable=$saleable, cOrder=$order, visibility=$status, name= '$name' , expanded=$expanded   where id=$elemento and client_id=$cid";
			}
			else
			{
			$query="select concat(rank,'.','$order') as rank from categories where client_id=$cid and id=$parent";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			$result_set = array();
				 		while ($record = mysqli_fetch_array($result)){
				 			$newRank=$record[0];
				 		}
			$query="update categories set  saleable=$saleable, cOrder=$order, visibility=$status, name= '$name', rank='$newRank' , expanded=$expanded  where id=$elemento and client_id=$cid";
			}
		 	//$query="update categories set  saleable=$saleable, cOrder=$order, visibility=$status, name= '$name', rank='$newRank'   where id=$elemento and client_id=$cid";

		 	$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		 	header('Content-type: application/json');
		 	echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			exit;
		}
		else{
		//
		}
		}
	
	
	
	
	
	
	
	
	/*
	else if($_POST['operation']=="getProductList"){
		$query = "SELECT id, name, COALESCE(description,'') as description, price, image_path_low, status from menurows order by name";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
		
	}
	*/
	else if($_POST['operation']=="getCategoryByTab" && isset($_POST['id']) && isset($_POST['cid'])){
		if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			$id = $_POST['id'];
			$cid = $_POST['cid'];
			//$query = "SELECT id, name, level from categories where visibility=1 and tabid=$id order by rank, cOrder";
			$query = "SELECT c.name as cName, c.level, c.cOrder, c.parent, c.id as idC, c.expanded, c.saleable, c.visibility from categories c where tabId=$id and client_id=$cid order by  c.rank, c.cOrder";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			$records= array();
			if(mysqli_num_rows($result)) {
				while($post = mysqli_fetch_assoc($result)) {
					$records[] = array('record'=>$post);
				}
			}
			
			// if we have new data return it
			if(!empty($records)) {
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
				//echo json_encode($records);
				//break;
			}
			else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
			}
		}
		else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
		}
	}
	

	else if($_POST['operation']=="getRequestStatistic" && isset($_POST['cid'])){
		$client_id = $_POST['cid'];
		
		$query = "SELECT (select count(*) from requests where client_id=$client_id and r_type = 4 and r_time >= CURDATE()) as todayOrders,
						(select count(*) from requests where client_id=$client_id and r_type <> 4 and r_time >= CURDATE()) as todayCalls,
						(select count(*) from requests where client_id=$client_id and r_type = 4 and DATE_SUB(CURDATE(),INTERVAL 30 DAY) <= r_time) as monthOrders,
						(select count(*) from requests where client_id=$client_id and r_type <> 4 and DATE_SUB(CURDATE(),INTERVAL 30 DAY) <= r_time) as monthCalls,
						(select count(*) from requests where client_id=$client_id and r_type = 4  ) as allOrders,
						(select count(*) from requests where client_id=$client_id and r_type <> 4 ) as allCalls 
					from requests where client_id=$client_id LIMIT 1;";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}

	else if($_POST['operation']=="getOrderHistory" && isset($_POST['cid']) && isset($_POST['type'])){
		$client_id = $_POST['cid'];
		$type=  $_POST['type'];
		$query='';
		switch($type){
			case '1':
				$query = "SELECT * from requests where client_id=$client_id and r_type = 4 and r_time >= CURDATE()";
				break;
			case '2':
				$query = "SELECT * from requests where client_id=$client_id and r_type = 4 and DATE_SUB(CURDATE(),INTERVAL 30 DAY) <= r_time";
				break;
			default:
				$query = "SELECT * from requests where client_id=$client_id and r_type = 4";
		}

		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		$records= array();
		if(mysqli_num_rows($result)) {
			while($post = mysqli_fetch_assoc($result)) {
				$records[] = array('record'=>$post);
			}
		}
		
		// if we have new data return it
		if(!empty($records)) {
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0', 'records'=>$records));
			//echo json_encode($records);
			//break;
		}
		else{
			header('Content-type: application/json');
			echo json_encode(array('response'=> 'S_OK','returnCode'=>'0'));
		}
	}

	
	
	
		// Inserita da Efix per gestire categorie/prodotti 20/12/2013
		else if($_POST['operation']=="insertProductCategories" ){
	
			if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && $_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
	
				$funz=$_POST['cFunz'];
				$cid=$_POST['cid'];
				$prod=$_POST['cProd'];
				$cat=$_POST['cCategoria'];
			
				if ($funz=="I") {
				$query="insert into  menurowcategories (client_id,idM,idC,saleable,mcOrder) values($cid,$prod,$cat,1,0)";
				}
				if ($funz=="D") {
				$query="delete from  menurowcategories where client_id=$cid and idM=$prod and idC=$cat ";
				}		
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'S_OK','returnCode'=>'0','idElemento'=>+$prod));
				exit;
			}
			else{
				header('Content-type: application/json');
				echo json_encode(array('response'=> 'E_SESSION','returnCode'=>'100'));
			}
		
		}

}

else{
echo("error lib");
}
?>