<?php
session_start();
include('config.php');
if(isset($_SESSION['userLoginId'])){
	$userid=$_SESSION['userLoginId'];
?>

<body>
	<div data-role="page">
		
		<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a">
			<a id="closeButtonUserProfile" href="index.php" data-rel="back" data-icon="delete">Chiudi</a>	

			<h1>Profilo utente</h1>
			
		</div><!-- /header -->
		<div data-role="content" class="contentNAV">
			<div data-role="content">
				<?php
				
				$query = "select id, username, pre_phone_number, phone_number, image_path_low, activate_date from users where id=$userid";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				
				
				$record = mysqli_fetch_array($result);

				$content ="";
				$content ='<div class="rounded shadow light content inlineright">';
				$content .='<div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100px; height:100px;" src="'.$record['image_path_low'].'" /></div>';
				$content .='<h3>'.$record['username'].'</h3>';
				$content .='</div>';

				echo $content;
				?>
				<div data-role="collapsible" data-collapsed="false">
					<h3>Password e numero</h3>
						<h4>Cambia password:</h4>
						<input type="password" name="passwordP" id="passwordP" value="" placeholder="*Vecchia password"/>
						<input type="password" name="passwordP2" id="passwordPN1" value="" placeholder="*Nuova password"/>
						<input type="password" name="passwordP2" id="passwordPN2" value="" placeholder="*Re-inserisci nuova password"/>
						<a onclick="changePassword()" data-role="button" data-icon="forward" data-iconpos="right">Cambia password</a>
						<p class="center-wrapper">Sarà inviata una mail di riepilogo</p>
						<h4>Cambia numero:</h4>
						<input type="number" name="cellPreP" id="cellPreP" value="<?php echo $record['pre_phone_number']; ?>" placeholder="Prefisso internazionale senza + ne 00"/>
						<input type="number" name="cellP" id="cellP" value="<?php echo $record['phone_number']; ?>" placeholder="*Numero"/>
						<a onclick="changeNumber()" data-role="button" data-icon="forward" data-iconpos="right">Cambia numero</a>
						<p class="center-wrapper">Sarà inviato un SMS contenente un codice di conferma</p>
				</div>

			</div>
		</div>
	</div>
	
</body>
<?php
}
else{
	echo('sessione scaduta si prega di rieffettuare il login');
	exit();
}
?>