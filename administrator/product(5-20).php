<?php
session_start();
include('../config.php');
if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){

	$cid=$_SESSION['adminClientId']; //get this from session after login
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SmartRestaurant</title>
	<link rel="stylesheet"  href="../style/jquery-ui-1.9.2.custom.min.css" />
	<link rel="stylesheet"  href="../style/jquery.mobile-1.4.0.min.css" />
	<link rel="stylesheet"  href="../style/my.css" />
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/jquery.mobile-1.4.0.min.js"></script>
	<script src="../js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="../js/my.js"></script>
	<script type="text/javascript">
		var imageL ='image/no_image_low.jpeg';
		var imageH ='image/no_image_high.jpeg';

		$(document).on('expand', '#col1', function (ui, e) {
    		alert(ui);
    		alert(e);
    		$('#col1').find('ul').append('<li><a href="#">ELEMENTO AGGIUNTO</a></li>');

    		$("#col1").listview('refresh');
		});

		function openLoadImage(){
    		 openShadowBox("crop.php", ($(window).height())*0.85, ($(window).width())*0.85, 'Carica immagine');
		}
		function openShadowBox(url, height, width, title){
		    width = parseInt(width)+60;
		    var horizontalPadding = 30;
		    var verticalPadding = 30;
		    $('<iframe id="cdt_shadowbox" src="' + url + '" frameBorder="0"/>').dialog({
		        title: (title) ? title : 'CDT Shadowbox',
		        autoOpen: true,
		        width: width,
		        height: height,
		        modal: true,
		        resizable: false,
		        autoResize: false,
		        closeOnEscape: true,
		        //position: 'top',
		        close: CloseDialog,
		        overlay: {
		            opacity: 0.7,
		            background: "black"
		        }
		    }).width(width - horizontalPadding).height(height - verticalPadding);
		    //$('html, body').scrollTop(0);  
		}
		function CloseDialog(){
			var fra = document.getElementById('cdt_shadowbox');
			// following will work on same domain (or subdomain with document.domain set) only
			var fraContent = fra.contentDocument || fra.contentWindow.document;
			imageL = fraContent.getElementById('imL').name;
			imageH = fraContent.getElementById('imH').name;
			if((imageL != "") && (imageH != "")){
				$('#preview').attr('src','../'+imageL);
				//alert(imageL);
				//alert(imageH);
			}
			$('#cdt_shadowbox').remove();
			
		}
		/*
		function onSaveProductSuccess(response){
			if(response.response == 'S_OK'){
				alert('record inserito');

			}
			else{
				alert('errore');
			}
		}
		function saveProduct(){
			var pName = $('#pName').val();
			var pPrice = $('#pPrice').val();
			var pPrintDescription;
			var pStatus;
			var pNote;
			var pDescription;
			var pLongDescription;
			var pLongDescriptionEn;
			var pQmin;
			var pQmax;
			var pQstep;
			//var pImgH;
			//var pImgL;
			if(pName=='' || pPrice == ''){
				//mostra messaggio di dati obbligatori
				alert('nome e prezzo obbligatori');
			}
			else{
				pPrintDescription = $('#pPrint').val();
				pStatus = $('#pStatus').val();
				pNote = $('#pNote').val();
				pDescription = $('#pDescription').val();
				pLongDescription = $('#pLongDescription').val();
				pLongDescriptionEn = $('#pLongDescriptionEn').val();
				pQmin = $('#pQmin').val();
				pQmax = $('#pQmax').val();
				pQstep = $('#pQstep').val();
				$.post('../lib.php', {operation: "insertProduct", cid: <?php echo $cid; ?> , pName: pName, pPrice: pPrice, pPrintDescription: pPrintDescription, pStatus: pStatus, pNote: pNote, pDescription: pDescription, pLongDescription: pLongDescription, pLongDescriptionEn: pLongDescriptionEn, pImgL: imageL, pImgH: imageH, qmin: pQmin, qmax: pQmax, qstep: pQstep}, onSaveProductSuccess);
			}
			
		}

		function onUpdateProductSuccess(response){
			if(response.response == 'S_OK'){
				alert('record aggiornato');
			}
			else{
				alert('errore');
			}
		}

		function updateProduct(id){
			
			var pName = $('#pName').val();
			var pPrice = $('#pPrice').val();
			var pPrintDescription;
			var pStatus;
			var pNote;
			var pDescription;
			var pLongDescription;
			var pLongDescriptionEn;
			var pQmin;
			var pQmax;
			var pQstep;

			//var pImgH;
			//var pImgL;
			if(pName=='' || pPrice == ''){
				//mostra messaggio di dati obbligatori
				alert('nome e prezzo obbligatori');
			}
			else{
				pPrintDescription = $('#pPrint').val();
				pStatus = $('#pStatus').val();
				pNote = $('#pNote').val();
				pDescription = $('#pDescription').val();
				pLongDescription = $('#pLongDescription').val();
				pLongDescriptionEn = $('#pLongDescriptionEn').val();
				pQmin = $('#pQmin').val();
				pQmax = $('#pQmax').val();
				pQstep = $('#pQstep').val();
				$.post('../lib.php', {operation: "updateProduct", id: id, cid: <?php echo $cid; ?> , pName: pName, pPrice: pPrice, pPrintDescription: pPrintDescription, pStatus: pStatus, pNote: pNote, pDescription: pDescription, pLongDescription: pLongDescription, pLongDescriptionEn: pLongDescriptionEn, pImgL: imageL, pImgH: imageH, qmin: pQmin, qmax: pQmax, qstep: pQstep}, onUpdateProductSuccess);
			}
			*/
			
		}
				
	</script>
</head>
<body>
	<div data-role="page">
		
		<div data-role="header" data-id="headerPersistente">
			<a id="closeButtonIProduct" href="#dashboard" data-rel="back" data-icon="delete">Chiudi</a>	
			<?php
			if(isset($_GET['id'])){
			?>
				<h1>Modifica prodotto</h1>
			<?php
			}
			else{
			?>
				<h1>Inserisci prodotto</h1>
			<?php
			}
			?>
		</div><!-- /header -->
		<div data-role="content" class="contentNAV">
			<div data-role="content">
				<label for="pName">Nome Prodotto:</label>
				<input name="pName" id="pName" value="" type="text" placeholder="Nome del prodotto">

				<label for="pPrint">Testo per stampa (se non specificato verrà utilizzato il nome):</label>
				<input name="pPrint" id="pPrint" value="" type="text" placeholder="Descrizione per stampante">

				<label for="pPrice">Prezzo €:</label>
				<input name="pPrice" id="pPrice" value="" type="text" placeholder="es. 1150 per €11,50">

				<label for="pStatus">Visibilità:</label>
				<select name="pStatus" id="pStatus" data-role="slider">
				    <option value="0">Off</option>
				    <option value="1" selected>On</option>
				</select>

				<label for="pNote">Abilita note:</label>
				<select name="pNote" id="pNote" data-role="slider">
				    <option value="0">Off</option>
				    <option value="1" selected>On</option>
				</select>

				<label for="pDescription">Descrizione breve:</label>
				<textarea cols="40" rows="8" name="pDescription" id="pDescription"></textarea>

				<label for="pLongDescription">Descrizione lunga:</label>
				<textarea cols="40" rows="8" name="pLongDescription" id="pLongDescription"></textarea>

				<label for="pLongDescriptionEn">Descrizione lunga in inglese:</label>
				<textarea cols="40" rows="8" name="pLongDescriptionEn" id="pLongDescriptionEn"></textarea>

				<label for="pQmin">Qtà minima:</label>
				<input name="pQmin" id="pQmin" value="1" type="number" placeholder="">

				<label for="pQmax">Qtà massima:</label>
				<input name="pQmax" id="pQmax" value="20" type="number" placeholder="">

				<label for="pQstep">Qtà step:</label>
				<input name="pQstep" id="pQstep" value="1" type="number" placeholder="">

				<!--immagine -->
				<a href="#popupIframe" onclick="openLoadImage()" data-rel="popup" data-position-to="window">Cambia immagine</a>

				<div style="width:100px;height:100px;overflow:hidden;">
					<img src="image/no_image_low.jpeg" id="preview" />
				</div>
				
				<div data-role="popup" id="popupIframe" data-overlay-theme="a" data-theme="a" data-corners="false" data-tolerance="15,15">
    				
				</div>
				

				<?php
				if(isset($_GET['id'])){
				?>
					<a href="#" data-role="button" onclick = "updateProduct(<?php echo $_GET['id'] ?>)">Salva</a>
				<?php
				}
				else{
				?>
					<a href="#" data-role="button" onclick = "saveProduct()">Inserisci</a>
				<?php
				}
				?>

				<?php
				if(isset($_GET['id'])){
				?>
					<script type="text/javascript">
						function loadProduct(response){
							if(response.records != null){
								i=0// da modificare leggendo solo il primo elemento se esiste
								for(; i< response.records.length; i++){
									
									$('#pName').val(response.records[i].record.name);
									$('#pPrint').val(response.records[i].record.printdescription);
									$('#pPrice').val(response.records[i].record.price);
									$('#pStatus').val(response.records[i].record.status);
									$('#pNote').val(response.records[i].record.note);

									$('#pQmin').val(response.records[i].record.qty_min);
									$('#pQmax').val(response.records[i].record.qty_max);
									$('#pQstep').val(response.records[i].record.qty_step);
									
									$('#pNote').slider('refresh');
									$('#pStatus').slider('refresh');

									$('#pDescription').val(response.records[i].record.description);
									$('#pLongDescription').val(response.records[i].record.long_description);
									$('#pLongDescriptionEn').val(response.records[i].record.long_description_en);
									$('#preview').attr('src', '../'+response.records[i].record.image_path_low);
									imageL = response.records[i].record.image_path_low;
									imageH = response.records[i].record.image_path_high;

								}
								
							}
						}
						$.post('../lib.php', {operation: "getProduct", id: <?php echo $_GET['id'] ?>, cid: <?php echo $cid; ?>}, loadProduct);
					</script>	
			<?php
			}
		?>

			</div>
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