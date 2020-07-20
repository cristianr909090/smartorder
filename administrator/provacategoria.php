<?php
include('../config.php');
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SmartRestaurant</title>
	<link rel="stylesheet"  href="../style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet"  href="../style/my.css" />
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/jquery.mobile-1.4.2.min.js"></script>
	<script src="../js/my.js"></script>
	<script type="text/javascript">

		$(document).on('expand', '#col1', function (ui, e) {
    		alert(ui);
    		alert(e);
    		$('#col1').find('ul').append('<li><a href="#">ELEMENTO AGGIUNTO</a></li>');

    		$("#col1").listview('refresh');
		});
		
	</script>
</head>
<body>
	<div data-role="page" id="pippo">
		<div data-role="content" class="contentNAV">
			<div data-role="content">
				<label for="cName">Nome Categoria:</label>
				<input name="cName" id="cName" value="" type="text" placeholder="Nome della categoria">

				<label for="cTab" class="select">Tab:</label>
				<select name="cTab" id="cTab" data-native-menu="false">
				    <option>Seleziona una categoria</option>
				    <option value="1" selected>Menu</option>
				    <option value="2">Ordine</option>
				    <option value="3">Carta dei vini</option>

				</select>

				<label for="cParent" class="select">Categoria Padre:</label>
				<select name="cParent" id="cParent" data-native-menu="false">
				    <option>Seleziona una categoria</option>
				    <option value="1" selected>-- Radice --</option>
				    <option value="2">Primi</option>
				    <option value="3">Primi -- Primi di mare</option>
				    <option value="4">Pizze</option>
				    <option value="2">Primi</option>
				    <option value="3">Primi -- Primi di mare</option>
				    <option value="4">Pizze</option>
				    <option value="2">Primi</option>
				    <option value="3">Primi -- Primi di mare</option>
				    <option value="4">Pizze</option>
				</select>

				<label for="cOrder">Ordine:</label>
				<input name="cOrder" pattern="[0-9]*" id="cOrder" value="" type="number">

				<label for="cSaleable">Prodotti vendibili:</label>
				<select name="cSaleable" id="cSaleable" data-role="slider">
				    <option value="0">Off</option>
				    <option value="1" selected>On</option>
				</select>

				<label for="cStatus">Visibilità:</label>
				<select name="cStatus" id="cStatus" data-role="slider">
				    <option value="0">Off</option>
				    <option value="1" selected>On</option>
				</select>
				<!-- disabilitare se non tree list -->
				<label for="cExpanded">Visualizzazione iniziale aperta:</label>
				<select name="cExpanded" id="cExpanded" data-role="slider">
				    <option value="0">Off</option>
				    <option value="1" selected>On</option>
				</select>
			</div>
		</div>
	</div>
</body>