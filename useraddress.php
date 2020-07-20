<?php
session_start();
include('config.php');
if(isset($_SESSION['cid']) && isset($_SESSION['userLoginId'])){
	$cid = $_SESSION['cid'];
	$userid = $_SESSION['userLoginId'];
?>
<body>
	<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a">
		<a id="closeInsertAddress" onclick="getOrderSummaryContent();" data-rel="back" data-icon="delete">Chiudi</a>	
		<?php
		if(isset($_POST['id'])){
		?>
			<h1>Modifica indirizzo</h1>
		<?php
		}
		else{
		?>
			<h1>Inserisci Indirizzo</h1>
		<?php
		}
		?>
	</div>
	<div data-role="content" class="contentNAV">
			<div data-role="content">
				
				<label for="aName" class="ui-hidden-accessible">Nome*:</label>
				<input name="aName" id="aName" value="" type="text" placeholder="Nome*">
				
				<label for="aLastName" class="ui-hidden-accessible">Cognome*:</label>
				<input name="aLastName" id="aLastName" value="" type="text" placeholder="Cognome*">

				<label for="aAddress" class="ui-hidden-accessible">Indirizzo*:</label>
				<input name="aAddress" id="aAddress" value="" type="text" placeholder="Indirizzo*">

				<label for="aNumber" class="ui-hidden-accessible">Numero*:</label>
				<input name="aNumber" id="aNumber" value="" type="text" placeholder="Numero*">

				<label for="aDoorBell" class="ui-hidden-accessible">Citofono*:</label>
				<input name="aDoorBell" id="aDoorBell" value="" type="text" placeholder="Citofono*">

				<label for="aApartmentNumber" class="ui-hidden-accessible">Numero appartamento:</label>
				<input name="aApartmentNumber" id="aApartmentNumber" value="" type="text" placeholder="Numero appartamento">

				<label for="aFloor" class="ui-hidden-accessible">Piano:</label>
				<input name="aFloor" id="aFloor" value="" type="text" placeholder="Piano">

				<label for="aZipCode" class="ui-hidden-accessible">Codice postale:</label>
				<input name="aZipCode" id="aZipCode" value="" pattern="[0-9]*" type="number" placeholder="Codice postale*">

				<fieldset data-role="controlgroup" data-type="horizontal">
					<select name="aRegioni" id="aRegioni" data-inline="true">
						<?php
						$query = "SELECT idregione, nomeregione from regioni";
						$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
						while ($record = mysqli_fetch_array($result)){
							echo ('<option value="'.$record['idregione'].'">'.$record['nomeregione'].'</option>');
						}
        				?>
					</select>

					<select name="aProvince" id="aProvince" data-inline="true">
						<option value="57">Bologna</option>
						<option value="58">Ferrara</option>
						<option value="59">Forlì Cesena</option>
						<option value="60">Modena</option>
						<option value="61" selected >Parma</option>
						<option value="62">Piacenza</option>
						<option value="63">Ravenna</option>
						<option value="64">Reggio Emilia</option>
						<option value="65">Rimini</option>
					</select>

    				<select name="aComuni" id="aComuni" data-inline="true">
						<option value="57">prova</option>
						<option value="58">prova</option>
						<option value="59">prova</option>
						<option value="60">prova</option>
						<option value="61" selected >Collecchio</option>
						<option value="62">prova</option>
						<option value="63">prova</option>
						<option value="64">prova</option>
						<option value="65">prova</option>
					</select>
				</fieldset>
			
				
				<?php
				if(isset($_POST['id'])){
				?>
					<a href="#" data-role="button" data-theme="a" class="ui-btn-active" onclick = "updateUserAddress(<?php echo $_POST['id'] ?>)">Salva</a>
				<?php
				}
				else{
				?>
					<a href="#" data-role="button" data-theme="a" class="ui-btn-active" onclick = "insertUserAddress()">Inserisci</a>
				<?php
				}
				?>

		</div>
	</div>
	
</body>
<?php
}
else{
	header( 'Location: index.php' ) ;
	exit();
}
?>