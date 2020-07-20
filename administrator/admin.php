<?php
session_start();
include('../config.php');
//echo $_SESSION['adminLoginId'];
if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){

	$cid=$_SESSION['adminClientId']; //get this from session after login

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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Amministrazione</title>
	<link rel="stylesheet"  href="../style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet"  href="../style/my.css" />
	<link href="../style/fontawesome/css/all.css" rel="stylesheet">
	<?php
	//set hidden value for using in js
	echo "<script>
				var selected_lang='".$_SESSION['lang']."';
		</script>";
	?>
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/jquery.mobile-1.4.2.min.js"></script>
	<script src="../js/jquery.lazyload.js"></script>
	<link rel="stylesheet"  href="../style/cristian.css" />
	<script src="../js/cristian.js"></script>

	<script type="text/javascript">
		var imageL ='image/no_image_low.jpeg';
		var imageH ='image/no_image_high.jpeg';

		function showMessage(message){
			$("<div class='ui-loader ui-overlay-shadow ui-body-b ui-corner-all'><h3>"+message+"</h3></div>").css({ "display": "block", "position": "fixed", "opacity": 0.92, "left": 0, "top": "15%", "width": "100%", "text-align": "center" }).appendTo( $.mobile.pageContainer ).delay( 4500 ).fadeOut( 3000, function(){
					$(this).remove();
			});
		}

		var lazy_required=1;
		function getRequestStatistic(){
			$.mobile.loading("show");
			$.post('../lib.php', {operation: "getRequestStatistic", cid: "<?php echo $cid;?>"}, onGetRequestStatistic);
		}
		function onGetRequestStatistic(response){
			if(response.returnCode==0){
				if(response.records != null){
					$('#todayOrders').html(response.records[0].record.todayOrders);
					$('#todayCalls').html(response.records[0].record.todayCalls);
					$('#monthOrders').html(response.records[0].record.monthOrders);
					$('#monthCalls').html(response.records[0].record.monthCalls);
					$('#allOrders').html(response.records[0].record.allOrders);
					$('#allCalls').html(response.records[0].record.allCalls);
				}
			}
			else{
				alert('errore nella lettura dellle statistiche');
			}
			$.mobile.loading("hide");
		}
		function getProductsList(){
			location.reload();
			// $.mobile.loading("show");
			// $.post('productContent.php', onGetProductsList);
		}
		function onGetProductsList(response){
			$('#productList').html(response);
			$('#productList').trigger('create');
			$.mobile.loading("hide");
			if(lazy_required==1){
				$(function() {
        	  		$("img").lazyload({
        	  		});
      			});
      		}
			//$('#productList').trigger('refresh');
		}

		function onSaveProductSuccess(response){
			if(response.response == 'S_OK'){
				//alert('record inserito');
				showMessage('record inserito');
				$('#closeButtonIProduct').click();

			}
			else{
				showMessage('errore si prega di riprovare');
			}
		}

		function onSaveCategorySuccess(response){
			if(response.response == 'S_OK'){
				showMessage('Categoria inserita');
				$('#closeButtonIProduct').click();
				// Inserito Efix per gestire refresh Elenco categorie in caso di inserimento
				getCategoryByTab('Refresh');  
				
				console.log(response.returnCode);

			}
			else{
				showMessage('errore si prega di riprovare');
			}
		}
		
		function onSaveModifyCategorySuccess(response){
			if(response.response == 'S_OK'){
				showMessage('Modifica categoria effettuata');
				$('#closeButtonIProduct').click();
			}
			else{
				showMessage('errore si prega di riprovare');
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
		
		function saveCategory(funz){
			 
			var cName = $('#cName').val();
			var cTab1 = $('#cTab1').val();
			var cParent = $('#cParent').val();
			var cOrder = $('#cOrder').val();
			var cSaleable = $('#cSaleable').val();
			var cStatus = $('#cStatus').val();
			var cExpanded = $('#cExpanded').val();
			var cElemModif = $('#cElemModif').val();

			//alert('Name:' + cName);
			//alert('Tab:'+cTab1);
		 	//alert('Parent:'+cParent);
		 	//alert('cOrder:'+cOrder);
		    //alert('cSaleable:'+cSaleable);
		    //alert('cStatus'+cStatus);
		    //alert('cExpanded'+cExpanded);
		    //alert('<?php echo $cid; ?>');
			//alert('Elemento da modificare: '+cElemModif);
			//alert('PARENT:'+cParent);
	
		
			if(cName=='' || cTab1 == '' ){
				//mostra messaggio di dati obbligatori
				alert('nome e tab obbligatori');
			}
			else{
                //alert('richiamo lib.php');
				if(funz=='insert')
				{			
				$.post('../lib.php', {operation: "insertCategory", cid: <?php echo $cid; ?> , cName: cName, cTab1: cTab1, cParent: cParent, cOrder: cOrder, cSaleable: cSaleable, cStatus: cStatus, cExpanded: cExpanded}, onSaveCategorySuccess);
				}
				
				if(funz=='modify')
				{
				//	alert('QUA CHIAMO LA FUNZIONE DI MODIFICA!!!!');
				//	alert('ID :'+ cParent);
					
				
				$.post('../lib.php', {operation: "modifyCategory", cid: <?php echo $cid; ?> , cElemModif: cElemModif, cName: cName, cTab1: cTab1, cParent: cParent, cOrder: cOrder, cSaleable: cSaleable, cStatus: cStatus, cExpanded: cExpanded}, onSaveModifyCategorySuccess);
				}
				
				
			}
			
		
		
		}

		function onUpdateProductSuccess(response){
			if(response.response == 'S_OK'){
				//alert('record aggiornato');
				showMessage('record aggiornato');
				$('#closeButtonIProduct').click();
			}
			else{
				showMessage('errore si prega di riprovare');
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
				$.post('../lib.php', {operation: "updateProduct", id: id , cid: <?php echo $cid; ?> , pName: pName, pPrice: pPrice, pPrintDescription: pPrintDescription, pStatus: pStatus, pNote: pNote, pDescription: pDescription, pLongDescription: pLongDescription, pLongDescriptionEn: pLongDescriptionEn, pImgL: imageL, pImgH: imageH, qmin: pQmin, qmax: pQmax, qstep: pQstep}, onUpdateProductSuccess);
			}
			
		}
		function adminLogout(){
			$.mobile.loading("show");
			$.post('../lib.php', {operation: "adminLogout"}, onAdminLogoutSuccess);
			
		}
		function onAdminLogoutSuccess(response){
			if(response.returnCode=='0'){
				window.location.href = "index.php";
			}
			else{
				showMessage('Errore, si prega di riprovare');
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

    		getRequestStatistic();
    		//getProductsList();

    		if(lazy_required==1){
				$(function() {
        	  		$("img").lazyload({
        	  		});
      			});
      		}
      		$.mobile.loading("hide");

      		$("#cTab").change(function () {
   				var $this = $(this),
        		val   = $this.val();
        		slitval=val.split("|");
    			getCategoryByTab(slitval[0]);
    			//alert(slitval[0]);
    			if(slitval[1]==4){//tree list
    				$('#addCategory').removeClass('ui-disabled');
    				$('#refreshCategory').removeClass('ui-disabled');
    			}
    			else{
    				$('#addCategory').addClass('ui-disabled');
    				$('#refreshCategory').addClass('ui-disabled');
    			}
			});
			

	// AGGIUNTO DA EFIX PER GESTIONE PRODOTTI X CATEGORIA
		$("#cCateg").change(function () {
		 var $this = $(this),
         val   = $this.val();
         slitval=val.split("|");
		 
		 var cCateg = $('#cCateg').val();	
		 splitval=cCateg.split("|");
    	//  alert('Valore1-' + splitval[0]);
		//  alert('Valore2-' + splitval[1]);
		  categoria=splitval[0];
		 // cid=splitval[1];
		  
		//	alert('OK sono qua chiamo productCategoryContent.php ');
			$.mobile.loading("show");
			$.post('productCategoryContent.php', {operation: "getProdCateg",  categoria: categoria, cid: <?php echo $cid; ?> }, onGetProductsCategoryList);
			});
			

		});

		function onGetCategoryByTabSuccess(response){
		 
			if(response.response == 'S_OK'){
				//alert('record aggiornato');		
				if(response.records != null){
					var tmp = '';
					var lastCadId = -1;
					var lastLevel = -1;
					var i=0;
					var a=0;
					var modify='modify';
					//var b=0;
					for(; i< response.records.length; i++){
						if (lastCadId != response.records[i].record.id) {
							lastCatId = response.records[i].record.id;
							if(a>0 && response.records[i].record.level == lastLevel){
								tmp+='</div>';
							}
							else if(a>0 && response.records[i].record.level < lastLevel){
								var hop = lastLevel - response.records[i].record.level;
								hop++;
								for (b=0; b < hop; b++) { 
									tmp+='</div>';
								}
								b-=hop;
							}
						}
						tmp+= '<div id="cat'+response.records[i].record.idC+'" data-role="collapsible" data-mini="false" ><h4>'+response.records[i].record.cName+'</h4>';
						lastLevel=response.records[i].record.level;
						a++;
						tmp+= '<label for="tfn'+response.records[i].record.idC+'"><?=_Position?></label><input type="number" data-clear-btn="false" name="tfn'+response.records[i].record.idC+'" id="tfn'+response.records[i].record.idC+'" value="'+response.records[i].record.cOrder+'"><a href="#" data-role="button" data-icon="check" data-inline="true" data-iconpos="notext">Ordina</a>';
						tmp+= '<a href="#" data-role="button" data-icon="plus" data-inline="true" data-iconpos="notext">Inserisci</a>';
						//tmp+= '<a href="#" data-role="button" data-icon="edit" data-inline="true" data-iconpos="notext">Modifica</a>';
						tmp+= '<a href="#" onclick="gestCategorie(\''+modify+'\','+response.records[i].record.idC+','+response.records[i].record.cOrder+');'+' " data-role="button" data-icon="edit" data-inline="true" data-iconpos="notext">Modifica</a>';
						tmp+= '<a href="#" onclick="deleteCategory('+response.records[i].record.idC+')" data-role="button" data-icon="delete" data-inline="true" data-iconpos="notext">Delete</a>';
						// tmp+= '<a href="#" data-role="button" data-icon="arrow-u" data-inline="true" data-iconpos="notext">Sposta su</a>';
						// tmp+= '<a href="#" data-role="button" data-icon="arrow-d" data-inline="true" data-iconpos="notext">Sposta giù</a>';
                        //alert(response.records[i].record.idC + "--"+response.records[i].record.cOrder);
						//alert('<a href="#" onclick="gestCategorie(\''+modify+'\','+response.records[i].record.idC+','+response.records[i].record.cOrder+');'+' " data-role="button" data-icon="edit" data-inline="true" data-iconpos="notext">Modifica</a>');
						
						 
					}
				//	alert(response.records[i].record.cName);
				//	tmp+='</div>';
				//	tmp+= '<?php $XCV=12334 ; echo $XCV; ?>';

				}
				$('#categoryList').html(tmp);
				$('#categoryList').trigger('create');
			}
			else{
				alert('errore nel caricamento delle categorie, si prega di riprovare');
			}
			$.mobile.loading("hide");
			
			
		}
		function getCategoryByTab(val){
		//Inserito Efix 25/02/2014 x gestire  refresh in Tab/Categorie
        if (val=='Refresh') {
		   val   = $("#cTab").val();
           slitval=val.split("|");
		   val =slitval[0];
        }
			$.mobile.loading("show");
			$.post('../lib.php', {operation: "getCategoryByTab", id: val, cid: <?php echo $cid; ?> }, onGetCategoryByTabSuccess);
		}
		
		
		/*
		function goCategoryPage(mode){
			var page = "category.php?mode="+mode+"&id="+$("#cTab").val();
			$.mobile.changePage(page);
		}
		*/
		function openLoadImage(){
   		 openShadowBox("crop.php", ($(window).height())*0.85, ($(window).width())*0.85, 'Carica immagine');
		}
		function openShadowBox(url, height, width, title){
		    width = parseInt(width)+60;
		    var horizontalPadding = 30;
		    var verticalPadding = 30;
		    $("#popupIframe").html('<iframe id="cropframe" src="'+url+'" width="'+width+'" height="'+height+'" seamless></iframe>');
		    //$.mobile.changePage('#message',{transition: 'pop', role: 'dialog'});
		    //data-rel="popup" data-position-to="window"
		}
		function closePopup(iL, iH){
			imageL = iL;//fraContent.getElementById('imL').name;
			imageH = iH;//fraContent.getElementById('imH').name;
			if((imageL != "") && (imageH != "")){
				$('#preview').attr('src','../'+imageL);
				//alert(imageL);
				//alert(imageH);
			}

			$('#popupIframe').popup('close');
			$('#popupIframe').popup('close');// sembra un problema con l'iframe
			//$('#closeButtonIProduct').click();// sembra un problema con l'iframe
			
		}
		function prova(imageL, imageH){
			alert(imageL);
			alert(imageH);
		}

	
	 	function gestCategorie(funz,id,ordine){
        //Recupero valori
            var Opzione = document.getElementById("cTab");
        //alert(funz);                                                  
			var mio_valore = Opzione.options[Opzione.selectedIndex].value;
			var mio_testo = Opzione.options[Opzione.selectedIndex].text;
                                                              
		//Visualizzo valori recuperati
			//alert("Valore Option: "+mio_valore+"\nTesto Option: "+mio_testo);
                                                              
			var link ='test.html?miaTab='+mio_valore;
                                                              
        // document.location.href=link
		//$.mobile.changePage( "prova2.html", { transition: "slideup", changeHash: false });
		console.log(mio_valore);
			if(mio_valore!=-1){
				$.mobile.changePage( "category.php", {type: "post", data: "miaTAB="+mio_valore+"&modalita="+funz+"&idElemento="+id+"&ordine="+ordine });
				return false;
			}else alert("Prima seleziona la scheda!");
	}
 
	// AGGIUNTO DA ME PER GESTIONE PRODOTTI X CATEGORIA
	// Inserito Efix 20/12/2013	
	function associaCategoriaProdotto(prodotto,categ){
			
			var cName = $('#cName').val();
			var cTab1 = $('#cTab1').val();
			var cParent = $('#cParent').val();
			var cOrder = $('#cOrder').val();
			var cSaleable = $('#cSaleable').val();
			var cStatus = $('#cStatus').val();
			var cExpanded = $('#cExpanded').val();
			var cElemModif = $('#cElemModif').val();
		    
			//alert(document.getElementById("productCategList").id);
			//alert('FUNZ : '+ funz);
			//alert('Elemento : ' + 'elem'+prodotto);
			elemento='#elem'+prodotto;
			//alert('Iconaaaa : '+$(elemento).data('icon'));

			// 	alert('ClientID :' + utente);
			// 	alert('categoria: '+categ);
			// 	alert('Cod prodotto: '+prodotto);	
			//	alert('Funzione: '+funz);
			//	alert(document.getElementById(prodotto).checked); //con questo recupero il valore true false di checked dell'elemento selezionato
			//	funz=document.getElementById(prodotto).checked;
		     
				
				var cProd=prodotto;
				var cCategoria=categ;

 			//	if(funz==0)
				if ($(elemento).data('icon')=='delete')
				{			
				var cFunz='I';
			// 	alert('INSERISCO ELEMENTO');
					$.post('../lib.php', {operation: "insertProductCategories", cid: <?php echo $cid; ?> , cFunz: cFunz, cProd: cProd, cCategoria: cCategoria}, onSaveInserimProdCategoriaSuccess);
				}
				
			//	if(funz==1)
			 	if ($(elemento).data('icon')=='check')
				{
				var cFunz='D';
			 //		alert('CANCELLO ELEMENTO');
					$.post('../lib.php', {operation: "insertProductCategories", cid: <?php echo $cid; ?> , cFunz: cFunz, cProd: cProd, cCategoria: cCategoria}, onSaveCancellazProdCategoriaSuccess);
				}
			return '';
		}

	    // AGGIUNTO DA EFIX PER GESTIONE PRODOTTI X CATEGORIA
		function onGetProductsCategoryList(response){
		 	$('#productCategList').html(response);
		 	$('#productCategList').trigger('create');
		 	$.mobile.loading("hide");
		 	if(lazy_required==1){
		 		$(function() {
         	  		$("img").lazyload({
         	  		});
      	 		});
      	 	}
	 
		}
		

		// Inserita Efix 30/12/2013
		function onSaveInserimProdCategoriaSuccess(response){
		    elemento='#elem'+response.idElemento;
	        //   alert(elemento);
	
	 		if(response.response == 'S_OK'){
		        	  if ($(elemento).data('icon')=='check'){
							$(elemento).data('icon', 'delete');  
							$(elemento +" .ui-icon").addClass("ui-icon-delete").removeClass("ui-icon-check"); 
						}
						else
						{
							$(elemento).data('icon', 'check');  
							$(elemento + " .ui-icon").addClass("ui-icon-check").removeClass("ui-icon-delete"); 	
						} 
				showMessage('Prodotto associato alla categoria ' );
				$('#closeButtonIProduct').click();

			}
			else{
				showMessage('errore si prega di riprovare');
			}
		}
		
		
		function onSaveCancellazProdCategoriaSuccess(response){
		    elemento='#elem'+response.idElemento;
			//  alert(elemento);
			if(response.response == 'S_OK'){		    
						if ($(elemento).data('icon')=='delete'){
							$(elemento).data('icon', 'check');  
							$(elemento +" .ui-icon").addClass("ui-icon-check").removeClass("ui-icon-delete"); 
						}
						else
						{
							$(elemento).data('icon', 'delete');  
							$(elemento + " .ui-icon").addClass("ui-icon-delete").removeClass("ui-icon-check"); 	
						} 
							showMessage('Prodotto eliminato dalla categoria ' );
							$('#closeButtonIProduct').click();
			}
			else{
				showMessage('errore si prega di riprovare');
			}
		}
		
	
	</script>

</head>
<body> 
<?php

	echo "<div style='display:none' id='hidden_cid'>".$cid."</div>";
?>

<div data-role="page" id="dashboard">
	<!--data-fullscreen="true" -->
	<div data-role="header" data-position="fixed" data-tap-toggle="false" data-theme="a">
		<h1>Admin: <?= _Summary?></h1>
		<a href="#" onclick="adminLogout()" class="ui-btn-right" data-icon="delete">Logout</a>
		<?php if(_LANGUAGE_SHOW){?>
		<select name="lang" id="lang" onchange="lang_changed(this)" >
			<option value="en">English</option>
			<option value="it" <?php if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")echo "selected";?>>Italiano</option>
		</select>
		<?php } ?>
	</div><!-- /header -->

	<div data-role="navbar">
		<ul>
			<li><a href="#dashboard" data-theme="a" data-direction="reverse"><?= _Summary?></a></li>
			<li><a href="#tabcat" data-direction="reverse"><?= _Management?></a></li>
		</ul>
	</div>

	<div data-role="content">	

   		<div class="ui-grid-a">
			<div class="ui-block-a">
				<div class="ui-bar ui-bar-a">
					<div data-role="header" data-theme="a">
						<h4><?= _Requests?> online</h4>
					</div><!-- /header -->
					<iframe src="monitor.php" frameborder="0" style="height:300px;width:100%" height="300px" width="100%"></iframe>
				</div>
			</div>
			<!-- <div class="ui-block-a">
				<div class="ui-bar ui-bar-a">
					<div data-role="header" data-theme="a">
						<h4><?=_Quick_links?></h4>
					</div>
					<div data-role="content">
						<a href="#" data-transition="slide" data-role="button" data-icon="arrow-r" data-iconpos="right"><?= _Add." "._element?> </a>
						<a href="#" data-transition="slide" data-role="button" data-icon="arrow-r" data-iconpos="right"><?= _Add." "._Category?> </a>
					</div>
				</div> 
			</div> -->
			<div class="ui-block-b">
				<div class="ui-bar ui-bar-a">
					<div data-role="header" data-theme="a">
						<h4><?= _Order_History?></h4>
					</div>
					<div class="order-history-container">
						<?= _select_requests_type?>
					</div>
				</div>
			</div>
			<div class="ui-block-c">
				<div class="ui-bar ui-bar-a">
					<div data-role="header" data-theme="a">
						<h4><?= _Summary." "._Requests?></h4>
						<a href="#" onclick="getRequestStatistic()" data-role="button" class="ui-btn-right" data-icon="refresh" data-iconpos="notext">Refresh</a>
					</div>
					<div data-role="content">
						<!-- Richiete oggi: <a href="#">274</a> 
						<br>
						Richiete da inizio mese: <a href="#">10895</a> 
						-->
						<table data-role="table" id="tableSummary" data-mode="reflow" class="ui-responsive table-stroke" with="100%">
      						<thead>
      						  <tr>
      						    <th data-priority="1"><?= _Requests?></th>
      						    <th data-priority="2"><?=_Order_qty?></th>
      						    <th data-priority="2"><?=_Call_qty?></th>
      						  </tr>
      						</thead>
      						<tbody>
      						  <tr onclick="order_show(1)" id="requests_tr_1">
      						    <th><?= _Today?></th>
      						    <td id="todayOrders">--</td>
      						    <td id="todayCalls">--</td>
      						  </tr>
      						  <tr onclick="order_show(2)" id="requests_tr_2">
      						    <th><?= _Last_30_days?></th>
      						    <td id="monthOrders">--</td>
      						    <td id="monthCalls">--</td>
      						  </tr>
      						  <tr onclick="order_show(3)" id="requests_tr_3">
      						    <th><?= _From_the_beginning?></th>
      						    <td id="allOrders">--</td>
      						    <td id="allCalls">--</td>
      						  </tr>
    					  </tbody>
    					</table>
					</div>
				</div> 

			</div>
  		</div>
	</div><!-- /content -->

</div><!-- /page -->
<div data-role="page" id="tabcat">
	<!--data-fullscreen="true" -->
	<div data-role="header" data-position="fixed" data-tap-toggle="false" data-theme="a">
		<h1>Admin: <?= _Summary?></h1>
		<a href="#" onclick="adminLogout()" class="ui-btn-right" data-icon="delete">Logout</a>	
		<?php if(_LANGUAGE_SHOW){?>
		<select name="lang" id="lang" onchange="lang_changed(this)" >
			<option value="en">English</option>
			<option value="it" <?php if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")echo "selected";?>>Italiano</option>
		</select>
		<?php } ?>
	</div><!-- /header -->

	<div data-role="navbar">
		<ul>
			<li><a href="#dashboard" data-direction="reverse"><?= _Summary?></a></li>
			<li><a href="#tabcat" class="test1" data-theme="a" data-direction="reverse"><?= _Management?></a></li>
		</ul>
	</div>
	<div data-role="content">
		<div data-role="navbar">
			<ul>
				<li><a href="#tabmanagement" ><?= _Tab_Management?></a></li>
				<li><a class="child_selected_tab" href="#tabcat" data-theme="a"><?= _Category?></a></li>
				<li><a href="#products" ><?= _Products?></a></li>
			</ul>
		</div>
		
		<br>
		<select name="cTab" id="cTab" data-native-menu="false" data-theme="a" >
			<option value='-1' ><?= _Select_a_tab?> </option>
			<?php 
				$query = "SELECT id, name, type FROM tabs where visibility =1 and type in (1,4) and client_id=$cid order by type, position, torder";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				$result_set = array();
				$lastType=-1;
				while ($record = mysqli_fetch_array($result)){
					if($record[2]!=$lastType){
						$lastType=$record[2];
						$description=_Tree_list;
						if($record[2]==1) $description =_Flat_list;
						echo "<optgroup label='".$description."'>";
					} 
					echo " <option value='".$record[0]."|".$record[2]."'>".$record[1]."</option>";
				}
			?>
		</select>

		<div data-role="header" data-theme="a">
				<h4><?= _List." "._Category?></h4>
				<a href="#" onclick="goCategoryPage('insert')" id="addCategory" data-role="button" class="ui-btn-left ui-disabled" data-icon="plus"><?= _Add?></a>
				<a href="#" id="refreshCategory" onclick="getCategoryByTab('Refresh')" data-role="button" class="ui-btn-right ui-disabled" data-icon="refresh">Refresh</a>
				<a href="#" onclick="gestCategorie('new','','');" data-role="button" class="ui-btn-left" data-icon="plus"><?= _Add?></a> 
		</div>
		</FORM>
		
		<div id="categoryList" data-role="content">
			
		</div>
		<!--
		<ul id="prodList" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">
  			<li data-role="list-divider" >Lista prodotti</li>
  		
  			<li ><a href="product.php?id=1" data-transition="none"><img src="../image/load.gif" class="ui-disabled" data-original="../userimage/1_low.jpeg" width="100" height="100" /><h2 class="ui-disabled">Prova Nome</h2><p class="ui-disabled">descrizione alla grande</p><p class="ui-disabled">€10.00</p></a>
  				<a id="delete" data-icon="delete" data-transition="none" data-rel="dialog" onclick="disableProduct(1)" title="Disabilita" data-theme="e" style="border-top-width: 0px; border-bottom-width: 0px;"></a>
  				<span class="row_buttons_right"><a onclick="pushNumber(1)\" data-role="button" data-icon="plus" data-iconpos="notext">Aggiungi</a><a onclick="pullNumber('')" data-role="button" data-icon="minus" data-iconpos="notext">Togli</a></span></li>
  			</li>

		</ul>
		-->
	</div>

</div><!-- /page -->

<div data-role="page" id="tabmanagement">
	<!--data-fullscreen="true" -->
	<div data-role="header">
		<h1>Admin: <?= _Summary?></h1>
		<a href="#" onclick="adminLogout()" class="ui-btn-right" data-icon="delete">Logout</a>
		<?php if(_LANGUAGE_SHOW){?>
		<select name="lang" id="lang" onchange="lang_changed(this)" >
			<option value="en">English</option>
			<option value="it" <?php if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")echo "selected";?>>Italiano</option>
		</select>
		<?php } ?>
	</div><!-- /header -->

	<div data-role="navbar">
		<ul>
			<li><a href="#dashboard" data-direction="reverse"><?= _Summary?></a></li>
			<li><a href="#tabcat" class="test1" data-theme="a" data-direction="reverse"><?= _Management?></a></li>
		</ul>
	</div>
	<div data-role="content">
		<div data-role="navbar">
			<ul>
				<li><a class="child_selected_tab" href="#tabmanagement" ><?= _Management?></a></li>
				<li><a href="#tabcat" data-theme="a"><?= _Category?></a></li>
				<li><a href="#products" ><?= _Products?></a></li>
			</ul>
		</div>
		<?php
		include('tabmanage.php');
		?>
	</div>

</div><!-- /page -->
<div data-role="page" id="products">
	<!--data-fullscreen="true" -->
	<div data-role="header">
		<h1>Admin: <?= _Summary?></h1>
		<a href="#" onclick="adminLogout()" class="ui-btn-right" data-icon="delete">Logout</a>
		<?php if(_LANGUAGE_SHOW){?>
		<select name="lang" id="lang" onchange="lang_changed(this)" >
			<option value="en">English</option>
			<option value="it" <?php if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")echo "selected";?>>Italiano</option>
		</select>
		<?php } ?>
	</div><!-- /header -->

	<div data-role="navbar">
		<ul>
			<li><a href="#dashboard" data-direction="reverse"><?= _Summary?></a></li>
			<li><a href="#tabcat" class="test1" data-theme="a" data-direction="reverse"><?= _Management?></a></li>
		</ul>
	</div>
	<div data-role="content">
		<div data-role="navbar">
			<ul>
				<li><a href="#tabmanagement" ><?= _Tab_Management?></a></li>
				<li><a href="#tabcat" data-theme="a"><?= _Category?></a></li>
				<li><a class="child_selected_tab" href="#products"><?= _Products?></a></li>
			</ul>
		</div>
		<div data-role="header" data-theme="a">
				<h4><?= _List?> <?= _Products?></h4>
				<a href="product.php" rel="external" data-role="button"  data-theme="a" class="ui-btn-left" data-icon="plus"><?= _Add?></a>
				<a href="#" onclick="getProductsList()" data-role="button"  data-theme="a" class="ui-btn-right" data-icon="refresh">Refresh</a>
		</div>
		<br>
		<div id="productList">
			<?php //echo $_SESSION['adminLoginId']."---".$_SESSION['adminClientId']."///".$_SESSION['adminClientId']==$_POST['cid'] && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
			?>
			<ul id="prodList" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">
  				<li data-role="list-divider" ><?= _List." "._Products?></li>
  				<?php
  				$query = "SELECT id, name, COALESCE(description,'') as description, price, CONCAT(left(price, length(price)-2),',',right(price, 2)) as pricedes, image_path_low, status from menurows where client_id=$cid order by name";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				while ($record = mysqli_fetch_array($result)){
					if($record['status']==1){
						echo('<li>
								<a href="product.php?id='.$record['id'].'" rel="external" data-transition="none" style="width: calc( 100% - 200px );">
									<img src="../image/load.gif" data-original="../'.$record['image_path_low'].'" width="100" height="100" />
									<h2>'.$record['name'].'</h2>
									<p>'.$record['description'].'</p>
									<p>€'.$record['pricedes'].'</p>
									
								</a>
								<a data-icon="forbidden" data-transition="none" data-rel="dialog" onclick="disableProduct('.$record['id'].')" title="Disabilita" data-theme="e" style="border-top-width: 1px; border-bottom-width: 1px; right: 40px;">
								</a>
								<button data-icon="delete" onclick="deleteProduct('.$record['id'].')" title="Delete" >
								</button>
								
							</li>');
					}
					else{
						echo('<li>
								<a href="product.php?id='.$record['id'].'" rel="external" data-transition="none" style="width: calc( 100% - 200px );">
										<img src="../image/load.gif" class="ui-disabled" data-original="../'.$record['image_path_low'].'" width="100" height="100" />
										<h2 class="ui-disabled">'.$record['name'].'</h2>
										<p class="ui-disabled">'.$record['description'].'</p>
										<p class="ui-disabled">€'.$record['pricedes'].'</p>
								</a>
								<a data-icon="eye" data-transition="none" data-rel="dialog" onclick="enableProduct('.$record['id'].')" title="Abilita" style="border-top-width: 1px; border-bottom-width: 1px; right: 40px;"></a>
								<button data-icon="delete" onclick="deleteProduct('.$record['id'].')" title="Delete" >
								</button>
							</li>');
					}	
				}
  			?>
			</ul>

		</div>

	</div>

</div><!-- /page -->
<div data-role="page" id="catprod">
	<!--data-fullscreen="true" -->
	<div data-role="header" data-position="fixed" data-tap-toggle="false" data-theme="a">
		<h1>Admin: <?= _Summary?></h1>
		<a href="#" onclick="adminLogout()" class="ui-btn-right" data-icon="delete">Logout</a>
		<?php if(_LANGUAGE_SHOW){?>
		<select name="lang" id="lang" onchange="lang_changed(this)" >
			<option value="en">English</option>
			<option value="it" <?php if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")echo "selected";?>>Italiano</option>
		</select>
		<?php } ?>
	</div><!-- /header -->

	<div data-role="navbar">
		<ul>
			<li><a href="#dashboard" data-direction="reverse"><?= _Summary?></a></li>
			<li><a href="#tabcat" data-theme="a" data-direction="reverse"><?= _Management?></a></li>
		</ul>
	</div>
	<div data-role="content">
		<div data-role="navbar">
			<ul>
				<li><a href="#tabmanagement" ><?= _Tab_Management?></a></li>
				<li><a href="#tabcat" data-theme="a"><?= _Category?></a></li>
				<li><a href="#products" ><?= _Products?></a></li>
			</ul>
		</div>
		prova cat/prod
		
		<select name="cCateg" id="cCateg"  data-native-menu="false" data-theme="d" >
			<option value='-1'  " ><?= _Category?> </option>
			<?php 
			// onclick="getProdottiFiltrati();"
				$query = "SELECT A.id, A.name, A.parent , B.name  , B.id FROM categories A  JOIN tabs B ON A.tabId=B.Id AND A.visibility=1 and B.visibility=1 and A.client_id=$cid and B.client_id=$cid and B.name <>''order by B.Id,A.name";

				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				$result_set = array();
				$lastType=-1;
				while ($record = mysqli_fetch_array($result)){
					if($record[2]!=$lastType){
						$lastType=$record[2];
						$description="lista ad albero";
						$id=$record[1];
						//echo "<optgroup label='".$description.'-'.$description."'>";
						if($record[2]==1) $description ="lista piana";
					 	echo "<optgroup label='".$description."'>";
						
					} 
					echo " <option value='".$record[0]."|".$record[2]."'>".$record[3].'>'.$record[1]. "</option>";
				}
			?>
		</select>	
		
		

		
		
		
		
		
		 <div id="productCategList">

		</div>
		
		
		
		
	</div>

</div><!-- /page -->

<div data-role="dialog" id="sure" data-title="Are you sure?">
  <div data-role="content">
    <h3 class="sure-1">???</h3>
    <p class="sure-2">???</p>
    <a href="#" class="sure-do" data-role="button" data-theme="b" data-rel="back">Yes</a>
    <a href="#" data-role="button" data-theme="c" data-rel="back">Annulla</a>
  </div>
</div>


</body>
</html>
<?php
}
else{
	header( 'Location: index.php' ) ;
	exit();
}
?>