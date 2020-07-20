<?php
session_start();
include('config.php');
if(isset($_SESSION['cid']) && isset($_SESSION['userLoginId'])){
	$cid = $_SESSION['cid'];
	$userid = $_SESSION['userLoginId'];
?>

			<a href="#purchase" onclick="current_delivery=-1;" data-role="button" data-rel="popup" data-position-to="window" data-transition="pop" data-theme="e" class="ui-btn-active">Ritira da noi</a>
			<!-- <a href="orderconfirm.php" onclick="current_delivery=-1;" data-role="button"  data-theme="a" class="ui-btn-active">Ritira da noi</a>
		-->
			<script>
		  		$(function() {
					$('#tPicker').timepicker();
		  		});
			</script>
			<input id="tPicker" type="text" class="time" />
			<ul id="addresseslist" data-role="listview" data-inset="true" data-filter="false" data-filter-placeholder="Cerca...">

		
    		<!--
    		</br><li data-role="list-divider" >oppure seleziona indirizzo di consegna</li>
    		-->
        	<?php
        	$query = "SELECT ua.id, ua.name, ua.last_name, ua.address, ua.address_number, ua.doorbell, ua.apartment_number, ua.floor, ua.zip_code, c.nomecomune FROM useraddresses ua left join comuni c on ua.district_id=c.idcomune where ua.user_id=$userid order by ua.time_stamp desc";
			$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			//$list='<li><h2>Presso il locale</h2><p>Indirizzo, numero</p><p>11111 Milano</p><div><a href="#purchase" data-role="button" data-inline="true" data-mini = "true" data-icon="check" data-rel="popup" data-position-to="window" data-transition="pop" data-theme="e">Ordina</a></div></li>';
			$list='';
			while ($record = mysqli_fetch_array($result)){
				
				//$list.='<li><h2>'.$record["name"].' '.$record["last_name"].'</h2><p>'.$record['address'].', '.$record['address_number'].'</p><p>'.$record['zip_code'].' '.$record['nomecomune'].'</p><div><a href="#purchase" onclick="current_delivery='.$record["id"].';" data-role="button" data-inline="true" data-mini = "true" data-icon="check" data-theme="a" class="ui-btn-active">Ordina</a><a data-role="button" data-inline="true" data-mini="true">Modifica</a><a onclick="alert(\'pippo\')" data-role="button" data-inline="true" data-mini="true">Elimina</a></div></li>';
				$list.='<li><h2>'.$record["name"].' '.$record["last_name"].'</h2><p>'.$record['address'].', '.$record['address_number'].'</p><p>'.$record['zip_code'].' '.$record['nomecomune'].'</p><div><a href="#purchase" onclick="current_delivery='.$record["id"].';" data-role="button" data-inline="true" data-mini = "true" data-icon="check" data-rel="popup" data-position-to="window" data-transition="pop" data-theme="e" class="ui-btn-active">Ordina</a><a data-role="button" data-inline="true" data-mini="true">Modifica</a><a onclick="alert(\'pippo\')" data-role="button" data-inline="true" data-mini="true">Elimina</a></div></li>';
			}
			//inserire il changepage in modifica indirizzo con il parametro id in post poi fare il controllo lato lib.php in modo da poter modificare solo i propri id
			//$.mobile.changePage( "category.php", {type: "post", data: "miaTAB="+mio_valore+"&modalita="+funz+"&idElemento="+id+"&ordine="+ordine });
			$list.='<li><a href="useraddress.php">Inserisci nuovo indirizzo</a></li>';
			$list.='</ul>';
			echo $list;
        	?>

		
    	</div>
    <div data-role="popup" data-history="false" data-dismissible="false" id="purchase" data-theme="a" data-shadow="true" data-overlay-theme="b" class="ui-content ui-overlay-shadow" style="max-width:340px; padding-bottom:2em;">
			<h3>Conferma Ordine</h3>
			<p>Pemendo sul pulsante conferma verrà confermato l'ordine e modalità di consegna</p>
			<a href="#" class="ui-btn-active" onclick="call(4, current_delivery, '');" data-role="button" data-rel="back" data-theme="a" data-icon="check" data-inline="true" data-mini="true">Conferma ordine</a>
			<a href="index.html" data-role="button" data-rel="back" data-inline="true" data-mini="true">Annulla</a>	
	</div>
<?php
}
?>
