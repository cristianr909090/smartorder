<?php
session_start();
// if(!isset($_SESSION['userLoginId']) || $_SESSION['userLoginId']==0){
// 	header("Location: login.php");
//     exit;
// }
// echo $_SESSION['userLoginId'].'---';
$_SESSION['order_id']=-1;
$_SESSION['old_orders']= array();
include('config.php');
$table=-1;
$cid=-1;
$tableDescription="";

if(isset($_GET['cid'])){
	$cid=$_GET['cid'];
	$_SESSION['cid']=$_GET['cid'];
}
if(isset($_GET['t'])){
	$t=$_GET['t'];
	$queryC = "SELECT id, description from tables where client_id=$cid and extnumber='$t'";
	$result = mysqli_query($db_con,$queryC) or die('Errant query:  '.$queryC);
	
	while ($record = mysqli_fetch_array($result)){
		$table = $record['id'];
		$tableDescription=$record['description'];
	}
}

//load language file
if(isset($_GET['lang']) && $_GET['lang']=='it'){
	$_SESSION['lang']="it";
   	require_once('lang/it.php');
}
else{
	if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")require_once('lang/it.php');
	else{
		$_SESSION['lang']="en";
		require_once('lang/en.php');
	}
}



$cliente = "Servizi Smart";
$user_login_required=1;
$show_wait_time=1;
$choose_delivery_method=1;
$enable_order=1;
$lazy_required=1;
$enable_print=0;
$show_rating =0;

$avarage_rating=0;
$avarage_count=0;

$queryC = "SELECT name, user_login_required, show_wait_time, choose_delivery_method, enable_order, lazy_required, show_rating, enable_print from clients where id=$cid LIMIT 1";
$result = mysqli_query($db_con,$queryC) or die('Errant query:  '.$queryC);

while ($record = mysqli_fetch_array($result)){
	$cliente = $record['name'];
	$user_login_required=$record['user_login_required'];
	$show_wait_time=$record['show_wait_time'];
	$choose_delivery_method=$record['choose_delivery_method'];
	$enable_order=$record['enable_order'];
	$lazy_required=$record['lazy_required'];
	$enable_print=$record['enable_print'];
	$show_rating=$record['show_rating'];
}
$queryR = "SELECT count(rating) as number, COALESCE(AVG(rating), 0) as avarage FROM rating where client_id=$cid";
$result = mysqli_query($db_con,$queryR) or die('Errant query:  '.$queryR);

while ($record = mysqli_fetch_array($result)){
	$avarage_rating=$record['avarage'];
	$avarage_count=$record['number'];
}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<title>ServiziSmart</title>
	<link rel="stylesheet" href="style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet" href="style/jRating.jquery.css" />
	<link rel="stylesheet"  href="style/ui-progress-bar.css" />
	<link rel="stylesheet" href="style/my.css" />
	<link rel="stylesheet" href="style/jquery.timepicker.css" />
	<link rel="stylesheet"  href="style/cristian.css" />
	<script src="js/cristian.js"></script>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery.mobile-1.4.2.min.js"></script>
	<script src="js/jquery.lazyload.js"></script>
	<script src="js/jRating.jquery.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<!--
	<script src="http://maps.google.com/maps/api/js?sensor=true"></script> 
	<!--<script src="js/gmaps.js"></script>-->
	<script src="js/my.js"></script>
	<!--
	<script src="js/iscroll.js"></script>
	-->
	<?php
	//set hidden value for using in js
	echo "<script> cid=".$cid.";
				var enable_order=".$enable_order.";
				var table=".$table.";
				var tableDescription='".$tableDescription."';
				var sessione='".session_id()."';
				var user_login_required = ".$user_login_required.";
				var lazy_required = '".$lazy_required."';
				var choose_delivery_method = ".$choose_delivery_method.";
				var selected_lang='".$_SESSION['lang']."';
		</script>";
	?>
	<script src="js/smartorder.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>

<?php


//non elegante ma per migliorare prestazioni e tempi di sviluppo
// get 
$query = "SELECT id,
			name,
			position, 
			type,
			data
		FROM tabs 
		where client_id =$cid AND visibility = 1 order by position, tOrder";

$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
$optionPanelContend ="";
if($show_rating == 1){//if let show rating
	$optionPanelContend.="<div onclick='window.location.href=\"about.php\";' class='rounded shadow light'><div class='center-wrapper'><h3>".$cliente." (".$avarage_count.")</h3></div><div class='rating' data-average='".$avarage_rating."' data-id='".$cid."'></div></br></div>";
}
$result_set = array();
$ii=0;
while ($record = mysqli_fetch_array($result)){
	$result_set[$ii] = $record;
	if($record[2] == 1){
		if($record[3]==6) $optionPanelContend.="<a href='".$record[4]."' target='_blank'";
		else $optionPanelContend.="<a href='#tab".$record[0]."'";
		
		if($record[3]==3) $optionPanelContend.="onclick='cartUpdate()'";
		else if($record[3]==5) $optionPanelContend.="onclick='ordersUpdate(".$record[0].")'";
		$optionPanelContend.= "data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'>";
		$optionPanelContend.= $record[1]."</a>";
	}
	$ii++;
	
}
// echo "---------------";
// print_r($result_set);

$iii=0;
foreach ($result_set as $element) {
	
	?>
	<div data-role="page" id="<?php echo 'tab'.$element['id']; ?>">
	<div data-role="panel" class="optionPanelRight" data-position="right" data-theme="a" data-display="reveal" data-position-fixed="true" >
    	<?php echo $optionPanelContend ?>
	</div>
	<?php
	if($user_login_required==1){
	?>
	<div data-role="panel" class="optionPanelLeft" class="optionPanelLeftClass" data-position="left" data-theme="a" data-display="reveal" data-position-fixed="true">
		<div class="center-wrapper">
    		<img class="userimage" src="image/user.png">
    	</div>
    	<p class='usernameText center-wrapper' ><?php echo _user;?></p>

    	<div>
			<section class="work">
         		 <div class="ui-progress-bar success ui-container" id="progress_bar">
           		 	<div class="ui-progress" style="width: 70%;">
            	 		<span class="ui-label"> <!-- style="display:none;"> -->
           		 		<!--Completamento livello-->
              		  	<b class="level-value">70%</b>
             		 	</span>
           		 	</div>
          		</div>
        	</section>
		</div>

    	<a href='login.php' class='loginButton' data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'>Login</a>

    	<a href='#activateAccount' class='activateButton'data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'><?=_Activate_an_account?></a>

    	<a href='userprofile.php' class='profileButton'data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'>Profilo</a>
    	
    	<a href='#' class='logoutButton' onclick='logout()' data-role='button' data-transition='none' data-icon='delete' data-iconpos='right'>Logout</a>
	</div>
	<?php
	}

	if($element['position']==0){
	?>
	<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a">
		<?php
		if($user_login_required==1){
		?>
		<a href="#" onclick="$('.optionPanelLeft:visible').panel('open');" class="ui-btn-left" data-icon="user" data-iconpos="notext">Option</a>
		<?php
		}
		?>
		<h1><?php echo $cliente ?></h1>
		<!-- <h1 class="logo"><a  href="http://m.smarteat.it">Smart Eat</a></h1> -->
		<?php if(_LANGUAGE_SHOW){?>
		<select name="lang" id="lang" onchange="lang_changed(this)" >
			<option value="en">English</option>
			<option value="it" <?php if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")echo "selected";?>>Italiano</option>
		</select>
		<?php } ?>
		<a href="#" onclick="$('.optionPanelRight:visible').panel('open');" class="ui-btn-right" data-icon="bars" data-iconpos="notext">Option</a>	
		
		<div data-role="navbar" id="navbar" class="navbar shadow">
			
				<?php
				if($element['position']==0){
					echo "<ul>";
					for ($j=0; $j < count($result_set); $j++) { 
						if($result_set[$j]['position']==0){
							if($j<$iii){
								echo '<li><a href="#tab'.$result_set[$j]['id'].'"';
								if($result_set[$j]['type']==3) echo ('onclick="cartUpdate()"');
								else if($result_set[$j]['type']==5) echo ('onclick="ordersUpdate('.$result_set[$j]['id'].')"');
								echo ' data-direction="reverse" data-transition="none">'.$result_set[$j]['name'].'</a></li>';
							} 
							else if($j==$iii){
								echo('<li><a href="#tab');
								echo($result_set[$j]['id'].'"');
								if($result_set[$j]['type']==3) echo ('onclick="cartUpdate()"');
								else if($result_set[$j]['type']==5) echo ('onclick="ordersUpdate('.$result_set[$j]['id'].')"');
								echo (' data-theme="a"  data-transition="none" class="ui-btn-active ui-state-persist">');
								echo($result_set[$j]['name']);
								echo ('</a></li>');
							}
							else{
								echo('<li><a href="#tab');
								echo($result_set[$j]['id'].'"');
								if($result_set[$j]['type']==3) echo ('onclick="cartUpdate()"');
								else if($result_set[$j]['type']==5) echo ('onclick="ordersUpdate('.$result_set[$j]['id'].')"');
								echo(' data-transition="none">');
								echo($result_set[$j]['name']);
								echo('</a></li>');
							}
						}
					}
					$iii++;
					echo "</ul>";
					
				}
				?>
			
		</div>

	</div> <!--<div header>--> 
	<?php
	}
	else{
	?>
	<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a">
		<a id="closeButtonCart" data-rel="back" data-icon="delete"><?=_Close?></a>	
		<h1><?php echo ($element['name']) ?></h1>
	</div>
	<?php
	}
	?>
	<div data-role="content" class="contentNAV">
		
		<!--<div data-role="content">-->
		<div class="contentMY">
		<?php
		if($element['type']==0){ //HOME
		?>
			<div id="table">
				<h3>
					<?php echo $tableDescription;?>
				</h3>
			</div>
			<a onclick="call('0', '', '')" data-rel="dialog" data-role="button" data-icon="forward" data-iconpos="right"><?=_Call_waiter?></a>
			<!--<a onclick="call('3')" data-rel="dialog" data-transition="slide" data-role="button" data-icon="forward" data-iconpos="right">Chiedi caffè</a> -->
			<a onclick="call('1', '', '')" data-rel="dialog" data-transition="none" data-role="button" data-icon="forward" data-iconpos="right"><?=_Ask_for_the_bill?></a>
			<!--<a href="#cart" onclick="cartUpdate()" data-role="button" data-transition="slidedown" data-icon="forward" data-iconpos="right">Apri il carrello</a>-->
		<?php
		}
		else if($element['type']==1){ //PLAIN LIST
			//VEDERE SE POSSIBILE OTTIZZAZIONE NELLE JOIN filtrando per client_id
			$tabId = $element['id'];
			$query = "SELECT c.name as cName, IF(c.saleable=0,0,mc.saleable) as saleable, m.id, m.name, m.description, m.price, CONCAT(left(m.price, length(m.price)-2),',',right(m.price, 2)) as pricedes, m.image_path_low from categories c LEFT JOIN menurowcategories mc on mc.idc = c.id AND mc.client_id=c.client_id LEFT JOIN menurows m on mc.idm = m.id AND mc.client_id= m.client_id where COALESCE(m.status,1) = 1 and c.visibility =1 and c.tabId = $tabId and c.client_id=$cid order by  mc.mcOrder";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

			$plainList='<ul id=ul'.$element["id"].' data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">';
			$plainList.='<li data-role="list-divider" >'.$element["name"].'</li>';
			while ($record = mysqli_fetch_array($result)){
				//$plainList.='<li><a href="detail.php?id='.$record["id"].'&s='.$record["saleable"].'&t='.$table.'&cid='.$cid.' " ><img src="'.$record["image_path_low"].'" /><h2>'.$record["name"].'</h2><p>'.$record["description"].'</p><p>€'.$record["price"].'</p></a></li>';
				$plainList.='<li onclick="return getDetailContent('.$record["id"].', '.$record["saleable"].')"><a href="#" ><img src="'.$record["image_path_low"].'" /><h2>'.$record["name"].'</h2><p>'.$record["description"].'</p><p>€'.$record["pricedes"].'</p></a></li>';
			}
			$plainList.='</ul>';
			echo $plainList;
		}

		else if($element['type']==5){ //OLD ORDERS ONLY SESSION
			$tabIdOrders='orders'.$element['id'];
		?>
			<div id="<?php echo $tabIdOrders; ?>"> 
			</div>
		<?php
		}

		else if($element['type']==7){ //iframe link
			$tabIdFrames='iframe'.$element['id'];
			$data =$element['data'];
		?>
			<div id="<?php echo $tabIdFrames; ?>">
			<?php
			if($element['position']==0){
			?>
			<iframe src="<?php echo $data; ?>" frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:80%;width:100%;position:absolute;top:90px;left:0px;right:0px;bottom:0px" height="80%" width="100%"></iframe>
			<?php
			}
			else{
			?>
			<iframe src="<?php echo $data; ?>" frameborder="0" style="overflow:hidden;overflow-x:hidden;overflow-y:hidden;height:90%;width:100%;position:absolute;top:50px;left:0px;right:0px;bottom:0px" height="90%" width="100%"></iframe>
			<?php
			}
			?>
			</div>
		<?php
		}

		else if($element['type']==8){ //about
			$tabId='about'.$element['id'];

		?>
			<div id="<?php echo $tabId; ?>">
				<div class="center-wrapper">
					<img src="image/logo.png" alt="ServiziSmart">
				</div>
				<p class="center-wrapper">Servizi smart a portata di TAP</p>
				<div class="center-wrapper">
					<a href="http://www.servizismart.com" target="_blank">www.ServiziSmart.com</a>
					</br>
					<a href="mailto:info@servizismart.com">info@servizismart.com</a>
				</div>
				<div class="center-wrapper">
					</br>
					<p><?php echo $version;  ?></p>
				</div>
			</div>
		<?php
		}

		/*
		else if($element['type']==9){ //MAP CLIENT POSITION
		?>
			<div class="clientmap" id="clientmap"></div>
		<?php
		}
		*/

		else if($element['type']==2){ //PROMO
			$query = "SELECT id, name, COALESCE(description,'') as description, COALESCE(long_description_en,'') as description_en, DATE_FORMAT(date, '%d/%m/%Y') as date, DATE_FORMAT(time, '%H:%i') as time from events where client_id = $cid AND visibility =1 order by date, time;";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			$lastDate=-1;
			$eventList='<ul data-role="listview" data-inset="true">';
			while ($record = mysqli_fetch_array($result)){
				if($record['date']!=$lastDate){
					$eventList.='<li data-role="list-divider">'.$record['date'].'</li>';
					$lastDate=$record['date'];
				}
				$eventList.='<li><a href="#"><h2>'.$record['name'].'</h2><p><strong>'.$record['description'].'</strong></p><p>'.$record['description_en'].'</p><p class="ui-li-aside">Ore: <strong>'.$record['time'].'</strong></p></a></li>';
			}
			if($lastDate==-1){
				$eventList.='<li>Non ci sono eventi in programma</li>';
			}
			$eventList.='</ul>';
			echo $eventList;
		}
		else if($element['type']==3){ //CART
		//sistemare l'id dell'ul e il parametro di chiamata
		?>
		<!--	<div data-role="content"> -->
				<?php 
				if($enable_order==1){ 
					if($choose_delivery_method==0){
				?>
					<a class="orderButton" onclick="call('4', '', '')" id="orderButton" data-role="button"><?=_Order?></a>
					
				<?php 
					}
					else{
				?>
						<a class="orderButton" onclick="return getOrderSummaryContent()" id="orderButton" data-role="button"><?=_Continue?></a>
				<?php
					}
				} 
				if($user_login_required==1){
				?>
				<a href="#login" class="cartLoginButton loginButton" id="cartLoginButton" data-role="button">Login</a>
				<a href="#activateAccount" class="cartactivateButton activateButton" id="cartLoginButton" data-role="button"><?=_Activate_an_account?></a>
				<?php
				}
				?>
			<!-- </div> -->
			<h3 class="total">Totale: 0€</h3>
			
			<div class="divcart" id="divcart"><!--data-role="content">-->
				<ul class="cart3" id="cart3" data-role="listview" data-inset="true"
    			data-filter="true"
    			data-filter-placeholder="Cerca...">
					<li data-role="list-divider" >Carrello  <?php echo $tableDescription; ?></li>
					<!--<a href="orders.php" id="oldOrdersButton">Ordini effettuati</a>-->
				</ul>
			<!--<a href="orders.php" id="oldOrdersButton">Ordini effettuati</a>-->
			</div>
		<?php
		}
		else if($element['type']==4){ //Tree list
		//sistemare  il parametro di chiamata
		// /adjust the call parameter
		?>
			<?php
				$tabId=$element['id'];
				//vedere se si può ottimizzare la query su client_id
				// see if you can optimize the query on client_id
				$query = "SELECT 
							c.tabId, c.name as cName, 
							c.level, 
							c.cOrder, 
							c.parent, 
							c.id as idC, 
							c.expanded, 
							IF(c.saleable=0,0,mc.saleable) as saleable, 
							m.id, 
							m.name, 
							m.description, 
							m.price, 
							CONCAT(left(m.price, length(m.price)-2),',',right(m.price, 2)) as pricedes, 
							m.image_path_low  
						from categories c LEFT JOIN menurowcategories mc on mc.idc = c.id AND mc.client_id=c.client_id LEFT JOIN menurows m on mc.idm = m.id AND mc.client_id=m.client_id 
						where c.client_id=$cid and COALESCE(m.status,1) =1 and c.visibility =1 and c.tabId = $tabId 
						order by  c.rank, mc.mcOrder";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				//$result_set = array();
				$lastCatId = -1;
				$content = '<ul data-role="listview" data-filter="true" data-filter-placeholder="Cerca...">';
				$addUl = false;
				$i = 0;
				$j = 0;
				$lastLevel = 0;
				
				while ($record = mysqli_fetch_array($result)){
					// if($i==0){echo "-------";print_r($record);}
					$expand='';
					if($record['expanded']==1) $expand='data-collapsed="false"';
					if ($record ['idC'] != $lastCatId) {
						$lastCatId = $record ['idC'];
						if($j>0){
							$content.='</ul>';
							$j--;
							
							if ($record ['level'] <= $lastLevel) {
								$content.='</div>';
								$i--;
							}
							if($record ['level'] < $lastLevel){
								$hop = $lastLevel - $record ['level'];
								for ($i=0; $i < $hop; $i++) { 
									$content.='</div>';
								}
								$i-=$hop;
							}
							//echo ('<script type="text/javascript"> alert ("primo '.$record ['cName'].' '.$record ['name'].'"); </script>');
						}
						//
						else if($i>0 && $record ['level'] == $lastLevel){
							$content.='</div>';
							$i--;
							//echo ('<script type="text/javascript"> alert ("secondo '.$record ['cName'].' '.$record ['name'].'"); </script>');
						}
						else if($i>0 && $record ['level'] < $lastLevel){
							$hop = $lastLevel - $record ['level'];
							$hop++;
							for ($i=0; $i < $hop; $i++) { 
								$content.='</div>';
							}
							$i-=$hop;
							//echo ('<script type="text/javascript"> alert ("terzo '.$record ['cName'].' '.$record ['name'].'"); </script>');
						}
						//echo ('<script type="text/javascript"> alert ("carico correttamente '.$record ['cName'].' '.$record ['name'].'"); </script>');
						$lastLevel = $record ['level'];
						$i++;
						$elementId = 'col'.$record['tabId'].$record['idC'];
						$content .= '<div id="'.$elementId.'" data-role="collapsible" data-mini="false" '.$expand.'><h4>'.$record ['cName'].'</h4>';
						$addUl = true;
						if($record ['id'] != null){
							$j++;
							$content .= '<ul data-role="listview" data-filter="true" data-filter-placeholder="Cerca...">';
							$addUl=false;
							if($lazy_required==1){
								//$content .= '<li><a href="detail.php?id='.$record ['id'].'&s='.$record ['saleable'].'&t='.$table.'&cid='.$cid.'" ><img src="image/load.gif" data-original="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['price'].'</p></a></li>';
								$content .= '<li onclick="return getDetailContent('.$record["id"].', '.$record["saleable"].')"><a href="#" ><img src="image/lazy.png" data-original="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['pricedes'].'</p></a></li>';
							}
							else{
								//$content .= '<li><a href="detail.php?id='.$record ['id'].'&s='.$record ['saleable'].'&t='.$table.'&cid='.$cid.'" ><img src="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['price'].'</p></a></li>';
								$content .= '<li onclick="return getDetailContent('.$record["id"].', '.$record["saleable"].')"><a href="#" ><img src="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['pricedes'].'</p></a></li>';
							}
							//$content .= '<li onclick="$.mobile.changePage(\'detail.php?id='.$record ['id'].'&s='.$record ['saleable'].'\', {transition: \'none\', reverse: false}, true, true)"><img src="image/PNA_high.gif" data-original="'.$record ['image_path_low'].'" width="100" height="100"/><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['price'].'</p></a></li>';
							//echo ('<script type="text/javascript"> alert ("quarto '.$record ['cName'].' '.$record ['name'].'"); </script>');
						}
					}

					else{
						if($lazy_required==1){
							//$content .= '<li><a href="detail.php?id='.$record ['id'].'&s='.$record ['saleable'].'&t='.$table.'&cid='.$cid.'" ><img src="image/load.gif" data-original="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['price'].'</p></a></li>';
							$content .= '<li onclick="return getDetailContent('.$record["id"].', '.$record["saleable"].')"><a href="#" ><img src="image/lazy.png" data-original="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['pricedes'].'</p></a></li>';
						}
						else{
							//$content .= '<li><a href="detail.php?id='.$record ['id'].'&s='.$record ['saleable'].'&t='.$table.'&cid='.$cid.'" ><img src="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['price'].'</p></a></li>';
							$content .= '<li onclick="return getDetailContent('.$record["id"].', '.$record["saleable"].')"><a href="#" ><img src="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['pricedes'].'</p></a></li>';
						}
						//$content .= '<li onclick="$.mobile.changePage(\'detail.php?id='.$record ['id'].'&s='.$record ['saleable'].'\', {transition: \'none\', reverse: false}, true, true)"><img src="image/PNA_high.gif" data-original="'.$record ['image_path_low'].'" width="100" height="100" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['price'].'</p></a></li>';
						
						//echo ('<script type="text/javascript"> alert ("else '.$record ['cName'].' '.$record ['name'].'"); </script>');
					}
				}	
				for (; $j > 0; $j--) { 
					$content.='</ul></div>';
					$j--;
					$i--;
				}
				for (; $i > 0; $i--) { 
					$content.='</div>';
				}
				echo $content;
			?>
			</div>

		<?php
		}
		?>

		</div>
	</div>
</div>

<?php
}

?>


<div data-role="page" id="activateAccount">
		<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a">
			<a id="closeButtonActivate" data-rel="back" data-icon="delete"><?=_Close?></a>	
			<h1><?=_Activate_an_account?></h1>
		</div>
		<div data-role="content">
			<div data-role="fieldcontain" class="ui-hide-label">
				<label for="codeA">Codice di attivazione:</label>
				<input type="number" name="codeA" id="codeA" value="" placeholder="Codice di attivazione"/>
			</div>
			<a href='#' onclick='activateAccount()' data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'>Attiva</a>
		</div>
</div>
<div data-role="page" id="ordersummary">
		<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a"> 
			<a href="index.php" data-rel="back" data-icon="delete" id="closeSummary" ><?=_Close?></a>
			<h1>Consegna</h1>
		</div>
		<div data-role="content">
			<div id="ordersummarydiv">
				<!--
				<div id="name2"><h3 class="no_margin">Loading...</h3></div><a data-role="button">Loading...</a><input name="number" id="number" value="1"  data-inline="true" /><div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100%; height:auto;" src="image/load.gif" id="image_3" />
				-->
			</div>
		</div>
</div>
<div data-role="page" id="detail">
		<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a" class="shadow"> 
			<a href="index.php" data-rel="back" data-icon="delete" id="closeDetail" ><?=_Close?></a>
			<h1><?=_Detail?></h1>
		</div>
		<div data-role="content">
			<div id="detaildiv">
				<div id="name2"><h3 class="no_margin">Loading...</h3></div><a data-role="button">Loading...</a><input name="number" id="number" value="1"  data-inline="true" /><div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100%; height:auto;" src="image/load.gif" id="image_3" />
			</div>
		</div>
</div>





</body>
</html>
