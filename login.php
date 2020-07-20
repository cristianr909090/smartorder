<?php
session_start();
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
	<script src="http://maps.google.com/maps/api/js?sensor=true"></script> <!--attenzione versione offline -->
	<!--<script src="js/gmaps.js"></script>-->
	<script src="js/my.js"></script>
	<!--
	<script src="js/iscroll.js"></script>
	-->
	<script src="js/smartorder.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
<div data-role="page" id="login">
	<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a">
		<!-- <a id="closeButtonLogin" data-rel="back" data-icon="delete">Chiudi</a>	 -->
		<h1>Login</h1>
		<?php if(_LANGUAGE_SHOW){?>
		<select name="lang" id="lang" onchange="lang_changed(this)" >
			<option value="en">English</option>
			<option value="it" <?php if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")echo "selected";?>>Italiano</option>
		</select>
		<?php } ?>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain" class="ui-hide-label">
			<label for="usernameL">Email:</label>
			<input type="email" name="usernameL" id="usernameL" value="" placeholder="Email"/>
			<label for="passwordL">Password:</label>
			<input type="password" name="passwordL" id="passwordL" value="" placeholder="Password"/>
		</div>
		<a href='#' onclick='login()' data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'>Login</a>

		<!--<p class="center-wrapper">Non sei ancora registrato?</p>-->
		<div data-role="collapsible" id="coForget" data-collapsed="true">
			<h3><?php echo _FORGET_PASSWORD;?></h3>
        	<div data-role="fieldcontain" class="ui-hide-label">
				<label for="usernameF">Email:</label>
				<input type="email" name="usernameF" id="usernameF" value="" placeholder="*Email"/>
			</div>
			<p class="center-wrapper">Sarà inviata una mail con una nuova password</p>
			<a href='#' onclick='forgetPassword()' data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'>Invia</a>
    	</div>

		<div data-role="collapsible" id="coTab" data-collapsed="true">
			<h3>Non sei ancora registrato?</h3>
        	<div data-role="fieldcontain" class="ui-hide-label">
				<label for="usernameR">Email:</label>
				<input type="email" name="usernameR" id="usernameR" value="" placeholder="*Email"/>
				<label for="passwordR">Password:</label>
				<input type="password" name="passwordR" id="passwordR" value="" placeholder="*Password"/>
				<label for="passwordR2">Password:</label>
				<input type="password" name="passwordR2" id="passwordR2" value="" placeholder="*Re-inserisci password"/>
				<label for="cellPreR">Prefisso internazionale:</label>
				<input type="number" name="cellPreR" id="cellPreR" value="39" placeholder="Prefisso internazionale senza + ne 00"/>
				<label for="cellR">Prefisso internazionale:</label>
				<input type="number" name="cellR" id="cellR" value="" placeholder="*Numero"/>
				<!--
				<label for="emailR">Email:</label>
				<input type="email" name="emailR" id="emailR" value="" placeholder="Email"/>
				-->
			</div>
			<p class="center-wrapper">Sarà inviata una mail di riepilogo e un SMS contenente un codice di conferma</p>
			<a href='#' onclick='register()' data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'>Registrazione</a>
    	</div>
		
	</div>
</div>

</body>
</html>
