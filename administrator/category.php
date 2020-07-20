<?php
session_start();
include('../config.php');
$cid=$_SESSION['adminClientId'];
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SmartRestaurant</title>
	<link rel="stylesheet"  href="../style/jquery-ui-1.9.2.custom.min.css" />
	<link rel="stylesheet"  href="../style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet"  href="../style/my.css" />
	<script src="../js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/jquery.mobile-1.4.2.min.js"></script>
	
	<script src="../js/my.js"></script>
	<script type="text/javascript">
		

		function onSaveCategorySuccess(response){
			if(response.response == 'S_OK'){
				alert('record inserito');

			}
			else{
				alert('errore');
			}
		}
		// function saveCategory(){
		// 	var pName = $('#pName').val();
		// 	var pPrice = $('#pPrice').val();
		// 	var pPrintDescription;
		// 	var pStatus;
		// 	var pNote;
		// 	var pDescription;
		// 	var pLongDescription;
		// 	var pLongDescriptionEn;
		// 	//var pImgH;
		// 	//var pImgL;
		// 	//alert('SONO QUA!!!!!!');
		// 	if(pName=='' || pPrice == ''){
		// 		//mostra messaggio di dati obbligatori
		// 		alert('nome e prezzo obbligatori');
		// 	}
		// 	else{
		// 		pPrintDescription = $('#pPrint').val();
		// 		pStatus = $('#pStatus').val();
		// 		pNote = $('#pNote').val();
		// 		pDescription = $('#pDescription').val();
		// 		pLongDescription = $('#pLongDescription').val();
		// 		pLongDescriptionEn = $('#pLongDescriptionEn').val();
		// 		$.post('../lib.php', {operation: "insertProduct", pName: pName, pPrice: pPrice, pPrintDescription: pPrintDescription, pStatus: pStatus, pNote: pNote, pDescription: pDescription, pLongDescription: pLongDescription, pLongDescriptionEn: pLongDescriptionEn, pImgL: imageL, pImgH: imageH}, onSaveProductSuccess);
		// 	}
			
		// }

		function onUpdateCategorySuccess(response){
			if(response.response == 'S_OK'){
				alert('record aggiornato');
			}
			else{
				alert('errore');
			}
		}

		function updateCategory(id){
			
			var pName = $('#pName').val();
			var pPrice = $('#pPrice').val();
			var pPrintDescription;
			var pStatus;
			var pNote;
			var pDescription;
			var pLongDescription;
			var pLongDescriptionEn;
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
				$.post('../lib.php', {operation: "updateProduct", id: id, pName: pName, pPrice: pPrice, pPrintDescription: pPrintDescription, pStatus: pStatus, pNote: pNote, pDescription: pDescription, pLongDescription: pLongDescription, pLongDescriptionEn: pLongDescriptionEn, pImgL: imageL, pImgH: imageH}, onUpdateProductSuccess);
			}
			
		}
		$(document).ready(function(){

			$("#cTab").change(function () {
   			var $this = $(this),
        	val   = $this.val();
    		getCategoryByTab(val);
			});
			
		});

		function onGetCategoryByTabSuccess(response){
			if(response.response == 'S_OK'){
				//alert('record aggiornato');
				if(response.records != null){
					var tmp = '<option>Seleziona una categoria</option> <option value="0" >-- Radice --</option> '
					for(i=0; i< response.records.length; i++){
						
						//sarebbe bello costruire un'alberatura nella descrizione tipo radice-->nodo-->nodo guardare come per collapsible in index
						tmp+= '<option value="'+response.records[i].record.id+'" >'+response.records[i].record.name+'</option> '
					}
					$("#cParent").html(tmp);
					$("#cParent").selectmenu( "refresh", true );
				}
			}
			else{
				alert('errore nel caricamento delle categorie, si prega di riprovare');
			}
		}

		function getCategoryByTab(val){
			$.post('../lib.php', {operation: "getCategoryByTab", id: val}, onGetCategoryByTabSuccess);
		}

				
	</script>
</head>
<body>
<?php 
				$tabID="";
				$tabType="";
				$tab=$_POST['miaTAB'];
				$mod=$_POST['modalita'];
				$partTab=explode("|",$tab);
				$ordine=$_POST['ordine'];
				$idElemento=$_POST['idElemento'];
				if ($tab!="-1")
				{
				$tabID=$partTab[0];
				$tabType=$partTab[1];
				}
				// echo "Tab : ".$tab;
				//echo "IDCliente: ".$cid;
				//echo "Modalità : ".$mod;
				//echo "ORDINE: ".$ordine;
				//echo "IDELEMENTO".$idElemento;
				//echo "--> TAB_ID".$tabID ;
				//echo "--> TAB_VALUE".$tabType ;
?>

	<div data-role="page">
		
		<div data-role="header" data-id="headerPersistente">
			<a id="closeButtonIProduct" href="#dashboard" data-rel="back" data-icon="delete">Chiudi</a>	
			<?php
			if ( $mod=='modify'){
			?>
				<h1>Modifica categoria</h1>
			<?php
			}
			else{
			?>
				<h1>Inserisci categoria</h1>
			<?php
			}
			// echo "Tab : ".$tab."---".$tabID."---".$tabType;
			?>
		</div><!-- /header -->
		<div data-role="content" class="contentNAV">
			<div data-role="content">


				
<?php
if ( $mod=='modify')
{
?>							
				<?php 
				 		$query = "select id,name,visibility,saleable,expanded FROM categories where  id=$idElemento and cOrder=$ordine";
						$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				 		$result_set = array();
				 		while ($record = mysqli_fetch_array($result)){
				 			echo " <option value='".$record[0]."'>".$record[1]."</option>";
				 			$val1=$record[0];
				 			$val2=$record[1];
							$visibility=$record[2];
							$saleable=$record[3];
							$expanded=$record[4];
				 		}
				?>
				
				<label for="cName">Nome Categoria:</label>
				<input name="cName" id="cName" value="<?php echo $val2 ?>" type="text" placeholder="Nome della categoria">
				<input name="cElemModif" id="cElemModif" value="<?php echo $val1 ?>" type="hidden" >
				
				<label for="cTab1" class="select">Tab:</label>	
				<select name="cTab1" id="cTab1" data-native-menu="false">
				 
				<!--	<option>Seleziona un TAB </option> -->
					<?php 	
						$query = "SELECT id, name FROM tabs where  type in (1,4) and client_id=$cid and id=".$tabID." order by position, torder";
			
						////$query = "SELECT id, name FROM tabs where visibility =1 and type in (1,4) and client_id=$cid order by position, torder";
						$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
						$result_set = array();
						while ($record = mysqli_fetch_array($result)){
							echo " <option value='".$record[0]."'>".$record[1]."</option>";
						//	$mioVal1=$record[0] ;
						//	$mioVal2=$record[1] ;
						}
					?>
				</select>				
 
				<label for="cParent" class="select">Nome categoria padre:</label>
				<select name="cParent" id="cParent" data-native-menu="false">				
					<?php 
						//$query = "select id,name FROM categories where visibility=1 and  id=$idElemento and cOrder=$ordine";
						$query = "select id,name from categories where id = (select parent from categories where id=$idElemento)";
						$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
						$result_set = array();
						while ($record = mysqli_fetch_array($result)){
							echo " <option value='".$record[0]."'>".$record[1]."</option>";
							$val1=$record[0];
							$val2=$record[1];
						}
					?>				
				</select>
				
				<label for="cOrder">Ordine:</label>
					<?php 
						$query = "select  cOrder  FROM categories where  client_id=$cid and id=$idElemento and  client_id=$cid";
						$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
						$result_set = array();
						while ($record = mysqli_fetch_array($result)){
						$miaVar=$record[0];
						}
					?>	
				<input name="cOrder" pattern="[0-9]*" id="cOrder" value='<?php echo $miaVar ?>' type="number">
				
				

				<?php
				if ($saleable==1)
				{
				$sel0='';
				$sel1='selected';
				}
				else
				{
				$sel0='selected';
				$sel1='';
				}
				?>
				<label for="cSaleable">Prodotti vendibili:</label>
				<select name="cSaleable" id="cSaleable" data-role="slider">
				    <option value="0" <?php echo $sel0 ?> >Off</option>
				    <option value="1" <?php echo $sel1 ?> >On</option>
				</select>

		 		<?php
		 		if ($visibility==1)
		 		{
		 		$vis0='';
		 		$vis1='selected';
		 		}
		 		else
		  		{
		 		$vis0='selected';
		 		$vis1='';
		 		}
		 		?>
				<label for="cStatus">Visibilità:</label>
				<select name="cStatus" id="cStatus" data-role="slider">
				    <option value="0" <?php echo $vis0 ?>  >Off</option>
				    <option value="1" <?php echo $vis1 ?>  >On</option>
				</select>
				
				<?php
		 		if ($expanded==1)
		 		{
		 		$exp0='';
		 		$exp1='selected';
		 		}
		 		else
		  		{
		 		$exp0='selected';
		 		$exp1='';
		 		}
		 		?>
				
				<label for="cExpanded">Visualizzazione iniziale aperta:</label>
				<select name="cExpanded" id="cExpanded" data-role="slider">
				    <option value="0" <?php echo $exp0   ?> >Off</option>
				    <option value="1" <?php echo $exp1   ?> >On</option>
				</select>
				
<?php
}
?>	
				
<?php
if ( $mod=='new')
{
?>
				<label for="cName">Nome Categoria:</label>
				<input name="cName" id="cName" value="" type="text" placeholder="Nome della categoria">
				<label for="cTab1" class="select">Tab:</label>
				<select name="cTab1" id="cTab1" data-native-menu="false">			 
				<!--	<option>Seleziona un TAB </option> -->
					<?php 	
						$query = "SELECT id, name FROM tabs where type in (1,4) and client_id=$cid and id=".$tabID." order by position, torder";	
						////$query = "SELECT id, name FROM tabs where visibility =1 and type in (1,4) and client_id=$cid order by position, torder";
						$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
						$result_set = array();
						while ($record = mysqli_fetch_array($result)){
							echo " <option value='".$record[0]."'>".$record[1]."</option>";
						//	$mioVal1=$record[0] ;
						//	$mioVal2=$record[1] ;
						}
					?>
				</select>				
				<!-- <label for="cTabLabel1" class="select">Tab: <?php echo $mioVal1."-".$mioVal2 ; ?></label> -->		
				<label for="cParent" class="select">Categoria Padre:</label>
				<select name="cParent" id="cParent" data-native-menu="false">
				    <option>Seleziona una categoria</option>
				    <option value="0" >-- Radice --</option> 				
					<?php 
						$query = "select id,name FROM categories where visibility=1 and client_id=$cid and tabId=$tabID";
						$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
						$result_set = array();
						while ($record = mysqli_fetch_array($result)){
							echo " <option value='".$record[0]."'>".$record[1]."</option>";
						}
					?>				
				</select>		 
				<label for="cOrder">Ordine:</label>
					<?php 
						$query = "select max(cOrder) FROM categories where visibility=1 and client_id=$cid and  client_id=$cid";
						$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
						$result_set = array();
						while ($record = mysqli_fetch_array($result)){
						$miaVar=$record[0]+1;
						}
					?>	
				
				<input name="cOrder" pattern="[0-9]*" id="cOrder" value='<?php echo $miaVar ?>' type="number">
				
				
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
				
				
<?php
}
?>
		

				
				<?php
				if(isset($_GET['id'])){
				?>
					<a href="#" data-role="button" onclick = "updateCategory(<?php echo $_GET['id'] ?>)">Salva</a>
				<?php
				}
				else{
				?>
				
				<?php
				if ($mod=='new')
				{
				?>	
					<a href="#" data-role="button" onclick = "saveCategory('insert')">Inserisci</a>
				<?php
				}
				?>
				
				<?php
				if ($mod=='modify')
				{
				?>	
					<a href="#" data-role="button" onclick = "saveCategory('modify')">Aggiorna</a>
				<?php
				}
				?>
				
				
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
						$.post('../lib.php', {operation: "getProduct", id: <?php echo $_GET['id'] ?>}, loadProduct);
					</script>	
			<?php
			}
		?>

			</div>
		</div>
	</div>
	
</body>