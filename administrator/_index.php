<?php
session_start(); 

$_SESSION['order_id']=-1;
include('../config.php');
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SmartRestaurant</title>
	<link rel="stylesheet"  href="../style/jquery-ui-1.9.2.custom.min.css" />
	<link rel="stylesheet"  href="../style/jquery.mobile-1.3.1.min.css" />
	<link rel="stylesheet"  href="../style/my.css" />
	
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/jquery.mobile-1.3.1.min.js"></script>
	<script src="../js/jquery.lazyload.js"></script>
	<script src="../js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="../js/my.js"></script>
	<script type="text/javascript">

		var sessione = '<?php echo session_id();?>';
		function showMessage(message){
			$("<div class='ui-loader ui-overlay-shadow ui-body-e ui-corner-all'><h3>"+message+"</h3></div>").css({ "display": "block", "position": "fixed", "opacity": 0.92, "left": 0, "top": "85%", "width": "100%", "text-align": "center" }).appendTo( $.mobile.pageContainer ).delay( 4500 ).fadeOut( 3000, function(){
					$(this).remove();
			});
		}
		
		function isAndroid(){
			//if (navigator.userAgent.toLowerCase().indexOf("android") != -1) return true;
			return false;
		}

		$(document).ready(function() {
			
			/*
			$(document).on("swipeleft", "div.ui-page", function(event){
				var nextpage = $(this).next('div[data-role="page"]');
				if (nextpage.length > 0) {
					//$.mobile.changePage(nextpage, "slide", false, true);
					if (isAndroid()) {
						$.mobile.changePage(nextpage, {transition: "none", reverse: false}, true, true);
					}
					else{
						$.mobile.changePage(nextpage, {transition: "slide", reverse: false}, true, true);
					}
					//alert ($.mobile.activePage.find("#divcart").attr("id")=="divcart");
					if ($.mobile.activePage.find("#divcart").attr("id")=="divcart") cartUpdate();
					event.stopImmediatePropagation();
				}
			});
			$(document).on("swiperight", "div.ui-page", function(event){
				var prevpage = $(this).prev('div[data-role="page"]');
				if (prevpage.length > 0) {
					if (isAndroid()) {
						$.mobile.changePage(prevpage, {transition: "none", reverse: true}, true, true);
					}
					else{
						$.mobile.changePage(prevpage, {transition: "slide", reverse: true}, true, true);
					}
					if ($.mobile.activePage.find("#divcart").attr("id")=="divcart") cartUpdate();
					event.stopImmediatePropagation()
				}
			});
			*/
	
 			//cartUpdate();
 			
 			//$("#table").html("<h3>Tavolo "" </h3>");
 			
 			if (isAndroid())
			{
   				$("a").attr("data-transition", "none");
			}
			//cartUpdate();
		});
		
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

		function loadProductList(ulid) {
			return function(response) { 
				
				if(response.records != null){
					i=0
					for(; i< response.records.length; i++){

						$("#"+ulid).append('<li><a href=\"product.php?id='+response.records[i].record.id+'\" data-transition=\"none\"><img src=\"../image/load.gif\" data-original=\"../'+response.records[i].record.image_path_low+'\" width="100" height="100" /><h2>'+response.records[i].record.name+'</h2><p>'+response.records[i].record.description+'</p><p>€'+response.records[i].record.price+'</p></a></li>');
					}
				}
				//lazy load
				$(function() {
         			$("img").lazyload({
        			  	//threshold : 20, //load image 200px before it is visible
        			  	//skip_invisible : false
        			    //effect : "fadeIn" //without better performance on old device
        			});
      			});
			}
			
		}

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
				$.post('../lib.php', {operation: "insertProduct", pName: pName, pPrice: pPrice, pPrintDescription: pPrintDescription, pStatus: pStatus, pNote: pNote, pDescription: pDescription, pLongDescription: pLongDescription, pLongDescriptionEn: pLongDescriptionEn, pImgL: imageL, pImgH: imageH}, onSaveProductSuccess);
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


	</script>
</head>
<body>
<div data-role="page" id="dashboard">
	<div data-role="panel" id="optionPanel" data-position="right" data-theme="a" data-display="push" >
    	<a href="#cart" onclick="cartUpdate()" data-role="button" data-transition="slidedown" data-icon="arrow-r" data-iconpos="right">Carrello</a>
	</div>
	<!--data-fullscreen="true"-->
	<div data-role="header" data-id="headerPersistente">
		<!--data-position="fixed"-->
		<h1>Amministrazione <?php echo $cliente ?></h1>
		<a href="#optionPanel" class="ui-btn-right" data-icon="bars" data-iconpos="notext">Option</a>	
	</div><!-- /header -->

	<div data-role="content" class="contentNAV">
		<div data-role="navbar" id="navbar">
			<ul>
				<li><a href="#dashboard" data-theme="b"  data-transition="slide">Dashboard</a></li>
				<li><a href="#catalog" data-transition="slide">Catalog</a></li>
				<li><a href="#system" data-transition="slide">System</a></li>
				<li><a href="#users" data-transition="slide">Users</a></li>
			</ul>
		</div>
		<div data-role="content">

			<iframe  id="iframe" name="iframe" frameborder="1" scrolling="yes"   src="../index.php?table=1000" height="1280" width="720"> </iframe>
		</div>
	</div><!-- /content -->

	<!--
	<div data-role="footer" data-position="fixed" data-id="footerPersistente">
		<h4>Footer</h4>
	</div><!-- /footer -->
</div><!-- /page -->

<div data-role="page" id="catalog">
	<div data-role="panel" id="optionPanel" data-position="right" data-theme="a" data-display="push" >
    	<a href="#cart" onclick="cartUpdate()" data-role="button" data-transition="slidedown" data-icon="arrow-r" data-iconpos="right">Carrello</a>
	</div>
	<div data-role="header" data-id="headerPersistente">
		<a href="#dashboard" data-rel="back" data-icon="arrow-l" data-iconpos="notext">indietro</a>
		<h1>Amministrazione <?php echo $cliente ?></h1>
		<a href="#optionPanel" data-icon="bars" data-iconpos="notext">carrello</a>	
	</div><!-- /header -->

	<div data-role="content" class="contentNAV">
		<div data-role="navbar">
			<ul>
				<li><a href="#dashboard" data-direction="reverse" data-transition="slide">Dashboard</a></li>
				<li><a href="#catalog" data-theme="b" data-transition="slide">Catalog</a></li>
				<li><a href="#system" data-transition="slide">System</a></li>
				<li><a href="#users" data-transition="slide">Users</a></li>
			</ul>
		</div>

		<div data-role="content">
			
			<div data-role="collapsible" data-theme="b"  data-content-theme="c" id="coTab" data-collapsed="false">
        		<h3>Tabs</h3>
        		<a href="#insertTab" data-transition="slidedown" >Inserisci tab</a>
				<br>
				<a href="#tabs" data-transition="slidedown" >Modifica tab</a>
    		</div>
    		<div data-role="collapsible" data-theme="b" data-content-theme="c" id="coCategories" data-collapsed="false">
        		<h3>Cadegorie</h3>
        		<a href="#category.php" data-transition="slidedown" >Inserisci categorie</a>
				<br>
				<!--
				<a href="#" data-transition="slidedown" >Modifica categorie</a>
    			-->
    		</div>
    		<div data-role="collapsible" data-theme="b" data-content-theme="c" id="coProducts" data-collapsed="false">
        		<h3>Prodotti</h3>
        		<a href="product.php" data-transition="slidedown" data-role="button">Inserisci prodotto</a>
				<br>
				<!--
				<a href="#cart" data-transition="slidedown" >Modifica prodotti</a>
				-->
				<ul id="pId" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">
  				<li data-role="list-divider" >Lista prodotti</li>
  				<script type="text/javascript">
  					var ulid =  'pId';
					$.post('../lib.php', {operation: "getProductList"}, loadProductList(ulid));
  				</script>

			</ul>
    		</div>
			

		</div>
	
	</div>
</div><!-- /page -->

<div data-role="page" id="system">
	<div data-role="panel" id="optionPanel" data-position="right" data-theme="a" data-display="push" >
    	<a href="#cart" onclick="cartUpdate()" data-role="button" data-transition="slidedown" data-icon="arrow-r" data-iconpos="right">Carrello</a>
	</div>
	<div data-role="header" data-id="headerPersistente">
		<a href="#dashboard" data-rel="back" data-icon="arrow-l" data-iconpos="notext">indietro</a>
		<h1>Amministrazione <?php echo $cliente ?></h1>
		<a href="#optionPanel" data-icon="bars" data-iconpos="notext">Option</a>	
	</div><!-- /header -->

	<div data-role="content" class="contentNAV">
		<div data-role="navbar">
		<ul>
			<li><a href="#dashboard" data-direction="reverse" data-transition="slide">Dashboard</a></li>
			<li><a href="#catalog" data-direction="reverse" data-transition="slide">Catalog</a></li>
			<li><a href="#system" data-theme="b" data-transition="slide">System</a></li>
			<li><a href="#users" data-transition="slide">Users</a></li>
		</ul>
		</div>

		
	</div>
	
</div><!-- /page -->

<div data-role="page" id="users">
	<div data-role="panel" id="optionPanel" data-position="right" data-theme="a" data-display="push" >
    	<a href="#cart" onclick="cartUpdate()" data-role="button" data-transition="slidedown" data-icon="arrow-r" data-iconpos="right">Carrello</a>
	</div>
	<div data-role="header" data-id="headerPersistente">
		<a href="#dashboard" data-rel="back" data-icon="arrow-l" data-iconpos="notext">indietro</a>
		<h1>Amministrazione <?php echo $cliente ?></h1>
		<a href="#optionPanel" data-icon="bars" data-iconpos="notext">Option</a>	
	</div><!-- /header -->

	<div data-role="content" class="contentNAV">
		<div data-role="navbar">
			<ul>
				<li><a href="#dashboard" data-direction="reverse" data-transition="slide">Dashboard</a></li>
				<li><a href="#catalog" data-direction="reverse" data-transition="slide">Catalog</a></li>
				<li><a href="#system" data-direction="reverse" data-transition="slide">System</a></li>
				<li><a href="#users" data-theme="b" data-transition="slide">Users</a></li>
			</ul>
		</div>

		<div data-role="content">	
			
		</div><!-- /content -->
	</div>
	<!--
	<div data-role="footer" data-position="fixed" data-id="footerPersistente">
		<h4>Footer</h4>
	</div><!-- /footer -->
</div><!-- /page -->

<div data-role="page" id="insertTab">
	<div data-role="header" data-id="headerPersistente">
		<a id="closeButtonItab" href="#dashboard" data-rel="back" data-icon="delete">Chiudi</a>	
		<h1>Inserisci tab</h1>
	</div><!-- /header -->

	<div data-role="content" class="contentNAV">
		
		
	</div>
</div>

<div data-role="page" id="insertCategories">
	<div data-role="header" data-id="headerPersistente">
		<a id="closeButtonICategories" href="#dashboard" data-rel="back" data-icon="delete">Chiudi</a>	
		<h1>Inserisci Categorie</h1>
	</div><!-- /header -->

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



<div data-role="dialog" data-theme="b" id="message"> 

		<div data-role="header"> 
			<h1>Messaggio</h1> 

		</div> 

		<div data-role="content"> 
			 Il cameriere sta arrivando...
			 <a href="#" id="messageCloseButton" data-role="button" data-rel="back">Chiudi</a>    
		</div> 
</div>
<div data-role="dialog" data-theme="e" id="errormessage"> 

		<div data-role="header"> 
			<h1>Messaggio</h1> 

		</div> 

		<div data-role="content"> 
			 Errore nella imprevisto, riprovare.
			 <a href="#" data-role="button" data-rel="back">Chiudi</a>    
		</div> 
</div>
<div data-role="dialog" data-theme="b" id="cofirmMessage"> 

		<div data-role="header"> 
			<h1>Eliminare?</h1>
		</div> 

		<div data-role="content"> 
			 <a href="#" data-role="button" data-rel="back">No</a>   
			 <a href=""></a>
		</div> 
</div>
</body>
</html>
</html>