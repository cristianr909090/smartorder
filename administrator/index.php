<?php
session_start(); 
include('../config.php');

if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
	header( 'Location: admin.php' ) ;
	exit();
}
else{
	//load language file
	if(isset($_GET['lang']) && $_GET['lang']=='it'){
		$_SESSION['lang']="it";
		require_once('../lang/it.php');
	}
	else{
		if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")require_once('../lang/it.php');
		else{
			$_SESSION['lang']="en";
			require_once('../lang/en.php');
		}
	}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<title>Admin ServiziSmart</title>
	<link rel="stylesheet" href="../style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet" href="../style/my.css" />
	<link rel="stylesheet"  href="../style/cristian.css" />
	<script src="../js/cristian.js"></script>
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/jquery.mobile-1.4.2.min.js"></script>
	<script src="../js/jquery.lazyload.js"></script>
	<script src="../js/my.js"></script>
	<script type="text/javascript">

		function showMessage(message){
			$("<div class='ui-loader ui-overlay-shadow ui-body-e ui-corner-all'><h3>"+message+"</h3></div>").css({ "display": "block", "position": "fixed", "opacity": 0.92, "left": 0, "top": "15%", "width": "100%", "text-align": "center" }).appendTo( $.mobile.pageContainer ).delay( 4500 ).fadeOut( 3000, function(){
					$(this).remove();
			});
		}

		function adminLogin(){
			var user=$('#usernameLA').val();
			var psw=$('#passwordLA').val();
			if(user=='' || psw == ''){
				//mostra messaggio di dati obbligatori
				alert('inserire dati obbligatori');
			}
			else{
				$.mobile.loading("show");
				$.post('../lib.php', {operation: "adminLogin", username: user, password: psw}, onAdminLoginSuccess);
			}
			
		}
		function onAdminLoginSuccess(response){

			if(response.returnCode=='0' && response.records != null){
				if(response.records[0].record.activated == 1){
					window.location.href = "admin.php";
				}
				else{
					$.mobile.loading("hide");
					showMessage('Utente non ancora attivato correttamente');
				}
			}
			else{
				$.mobile.loading("hide");
				showMessage('Errore di login, si prega di riprovare');
			}
			
		}
		$(document).ready(function() {
			/*
			window.onbeforeunload = function() {		
				return "Vuoi veramente uscire?";	
			}
			*/
			$.mobile.defaultPageTransition = "none"
    		$.mobile.defaultDialogTransition = 'none';
    		$.mobile.useFastClick = true; 

      		$.mobile.loading("hide");

		});	
	</script>
</head>
<body>
	<div data-role="header" data-position="fixed" data-tap-toggle="false" data-theme="a">
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
			<label for="usernameL">Username:</label>
			<input type="text" name="usernameLA" id="usernameLA" value="" placeholder="Username"/>
			<label for="passwordL">Password:</label>
			<input type="password" name="passwordLA" id="passwordLA" value="" placeholder="Password"/>
		</div>
		<a href='#' onclick='adminLogin()' data-role='button' data-transition='none' data-icon='arrow-r' data-iconpos='right'>Login</a>
	</div>

</body>


<?php
//echo(md5('paelladipesce'.'olkkohfjshpoiu'));
}
?>