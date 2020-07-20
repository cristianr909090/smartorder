<?php
session_start();
include('../config.php');
if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){

	$cid=$_SESSION['adminClientId']; //get this from session after login

	//load language file
	if(isset($_GET['lang']) && $_GET['lang']=='it'){
		$_SESSION['lang']="it";
		require_once('../lang/it.php');
	}else{
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
	<title>SmartRestaurant</title>
	<link rel="stylesheet"  href="../style/jquery.mobile-1.4.2.min.css" />

	<script src="../userimg/jquery.min.js"></script>  
	<script src="../userimg/bootstrap.min.js"></script>
	<script src="../userimg/croppie.js"></script>
	<link rel="stylesheet" href="../userimg/bootstrap.min.css" />
	<link rel="stylesheet" href="../userimg/croppie.css" />
	
	<link rel="stylesheet"  href="../style/cristian.css" />
	<script src="../js/cristian.js"></script>
	<!-- <script src="https://kit.fontawesome.com/bbe855f23e.js" crossorigin="anonymous"></script> -->

	<script src="../js/jquery.mobile-1.4.2.min.js"></script>
	<script src="../js/my.js"></script>
	<script type="text/javascript">
		var imageL ='image/no_image_low.jpeg';
		var imageH ='image/no_image_high.jpeg';
		var pCategory=9999;

		$(document).on('expand', '#col1', function (ui, e) {
    		alert(ui);
    		alert(e);
    		$('#col1').find('ul').append('<li><a href="#">ELEMENTO AGGIUNTO</a></li>');

    		$("#col1").listview('refresh');
		});
		
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
			var pSequence=1;
			//var pImgH;
			//var pImgL;
			if(pName=='' || pPrice == '' || pCategory == 9999){
				//mostra messaggio di dati obbligatori
				alert('Nome, prezzo e categoria obbligatori');
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
				pSequence = $('#pSequence').val();
				$.post('../lib.php', {operation: "insertProduct", cid: <?php echo $cid; ?> , pName: pName, pPrice: pPrice, pPrintDescription: pPrintDescription, pStatus: pStatus, pNote: pNote, pCategory: pCategory, pSequence: pSequence, pDescription: pDescription, pLongDescription: pLongDescription, pLongDescriptionEn: pLongDescriptionEn, pImgL: imageL, pImgH: imageH, qmin: pQmin, qmax: pQmax, qstep: pQstep}, onSaveProductSuccess);
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
			var pSequence=1;

			//var pImgH;
			//var pImgL;
			if(pName=='' || pPrice == '' || pCategory == 9999){
				//mostra messaggio di dati obbligatori
				alert('Nome, prezzo e categoria obbligatori');
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
				pSequence = $('#pSequence').val();
				$.post('../lib.php', {operation: "updateProduct", id: id, cid: <?php echo $cid; ?> , pName: pName, pPrice: pPrice, pPrintDescription: pPrintDescription, pStatus: pStatus, pNote: pNote, pCategory: pCategory, pSequence: pSequence, pDescription: pDescription, pLongDescription: pLongDescription, pLongDescriptionEn: pLongDescriptionEn, pImgL: imageL, pImgH: imageH, qmin: pQmin, qmax: pQmax, qstep: pQstep}, onUpdateProductSuccess);
			}
			
			
		}
		function showMessage(message){
			$("<div class='ui-loader ui-overlay-shadow ui-body-b ui-corner-all'><h3>"+message+"</h3></div>").css({ "display": "block", "position": "fixed", "opacity": 0.92, "left": 0, "top": "15%", "width": "100%", "text-align": "center" }).appendTo( $.mobile.pageContainer ).delay( 4500 ).fadeOut( 3000, function(){
					$(this).remove();
			});
		}

		function filterFunction() {
			var input, filter, ul, li, a, i;
			input = document.getElementById("pCategory");
			filter = input.value.toUpperCase();
			div = document.getElementById("myDropdown");
			a = div.getElementsByTagName("a");
			for (i = 0; i < a.length; i++) {
				txtValue = a[i].textContent || a[i].innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
				a[i].style.display = "";
				} else {
				a[i].style.display = "none";
				}
			}
		}

		function setcategory(e){
			$('#myDropdown').css('display','none');
			$('.ui-input-search input').val(e.innerHTML);
			pCategory=e.getAttribute("category_index");
			console.log("index: "+pCategory);
		}
				
	</script>
</head>
<body>
	<div data-role="page" class="cristian_page">
		
		<div data-role="header">
			<a id="closeButtonIProduct" data-rel="back" data-icon="delete">Chiudi</a>
			<?php
			if(isset($_GET['id'])){
			?>
				<h1><?=_Change_product?></h1>
			<?php
			}
			else{
			?>
				<h1><?=_Insert_product?></h1>
			<?php
			}
			?>
		</div><!-- /header -->

		<div data-role="main" class="ui-content">
			<div>
				<div class="cristian_row">
					<label for="pName"><?= _Product_name ?>:</label>
					<input name="pName" id="pName" value="" type="text" placeholder="Nome del prodotto">
				</div>
				<div class="cristian_row">
					<label for="pPrint"><?= _Product_print_name?>:</label>
					<input name="pPrint" id="pPrint" value="" type="text" placeholder="Descrizione per stampante">
				</div>
				<div class="cristian_row">
					<label for="pPrice"><?=_Price?> €:</label>
					<input name="pPrice" id="pPrice" value="" type="text" placeholder="es. 1150 per €11,50">
				</div>
				<div class="cristian_row">
					<label for="pStatus"><?=_Visibility?>:</label>
					<select name="pStatus" id="pStatus" data-role="slider">
						<option value="0">Off</option>
						<option value="1" selected>On</option>
					</select>
				</div>
				<div class="cristian_row">

					<label for="pNote"><?=_Enable_note?>:</label>
					<select name="pNote" id="pNote" data-role="slider">
						<option value="0">Off</option>
						<option value="1" selected>On</option>
					</select>
				</div>
				<!-- <div class="cristian_row">

					<label for="pCategory"><?=_Category?>:</label>
					<input type="text" id="pCategory" name="pCategory" onkeyup="filterFunction()">
					<div id="myDropdown" class="dropdown-content category_list">
						<a href="#about" onclick="setcategory(this)" category_index="1">About</a>
						<a href="#base" onclick="setcategory(this)"  category_index="6">Base</a>
						<a href="#blog" onclick="setcategory(this)" category_index="5">Blog</a>
						<a href="#contact" onclick="setcategory(this)" category_index="4">Contact</a>
						<a href="#custom" onclick="setcategory(this)" category_index="3">Custom</a>
						<a href="#support" onclick="setcategory(this)" category_index="2">Support</a>
					</div>
				</div> -->
				<div class="cristian_row">
					<label for="pCategory"><?=_Category?>:</label>
					<ul id="myDropdown" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">
						<li data-role="list-divider" >Category</li>
					</ul>
				
				</div>
				<div class="cristian_row">
					<label for="pSequence"><?=_Sequence?>:</label>
					<input name="pSequence" id="pSequence" value="1" type="number" placeholder="Sequence in primary">
				</div>
				<div class="cristian_row">

					<label for="pDescription"><?=_Short_description?>:</label>
					<textarea cols="40" rows="8" name="pDescription" id="pDescription"></textarea>
				</div>
				<div class="cristian_row">
					<label for="pLongDescription"><?=_Long_description?>:</label>
					<textarea cols="40" rows="8" name="pLongDescription" id="pLongDescription"></textarea>
				</div>
				<div class="cristian_row">
					<label for="pLongDescriptionEn"><?=_Long_english_description?>:</label>
					<textarea cols="40" rows="8" name="pLongDescriptionEn" id="pLongDescriptionEn"></textarea>
				</div>
				<div class="cristian_row">
					<label for="pQmin"><?=_Minimum_qty?>:</label>
					<input name="pQmin" id="pQmin" value="1" type="number" placeholder="">
				</div>
				<div class="cristian_row">
					<label for="pQmax"><?=_Maximum_qty?>:</label>
					<input name="pQmax" id="pQmax" value="20" type="number" placeholder="">
				</div>
				<div class="cristian_row">
					<label for="pQstep"><?=_Step_qty?>:</label>
					<input name="pQstep" id="pQstep" value="1" type="number" placeholder="">
				</div>
				<div class="cristian_row">
					<div id="product_img_preview">
						<div class="product_img_l">
							<img src="image/no_image_low.jpeg" id="preview" />
						</div>
						<div class="product_img_h">
							<img src="image/no_image_high.jpeg" id="previewH" />
						</div>
					</div>
					<div class="container img_crop_upload_div">
						<div class="panel panel-default">
							<div class="panel-body" align="center">
								<input type="file" name="upload_image" id="upload_image" />
								<br />
							</div>
						</div>
					</div>
				</div>
				<div class="cristian_row">
					<button onclick="document.getElementById('upload_image_div').style.display='block';"><?=_Change_image?></button>
					<div id="upload_image_div">
						<button id="change_img_select" onclick="document.getElementById('upload_image').click();">Upload</button>
						<button onclick="document.getElementById('imgDropdown').style.display='block';"><?= _Select_from_server?></button>
						<div id="imgDropdown" class="imgDropdown">
							<?php 
								foreach(glob(dirname(__FILE__) . '/../userimage/upload/*') as $filename){
									$filebasename = basename($filename);
									echo "<a value='" . $filebasename . "' class='server_img_select'>".
												"<img src='../userimage/upload/$filebasename' class='server_select_img'>".
												$filebasename.
										"</a>";
								}
							?>
						</div>
					</div>
				</div>
				
				

				<div id="uploadimageModal" class="modal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Upload & Crop Image</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-6 text-center">
										<div id="image_demo" style="width:350px; margin-top:30px"></div>
									</div>
									
								</div>
								<div class="row" style="text-align: center;">
									<button class="btn btn-success crop_image">Crop & Upload Image</button>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<script>  
				$(document).ready(function(){

					$('#pCategory').on('click', function(){
						$('.category_list').css('display','block');
					});
					$('#pCategory').on('keypress', function(){
						pCategory=9999;
					});
					
					var boundary_length=500;
					if($(window).width()<600)boundary_length=200;
					$image_crop = $('#image_demo').croppie({
						enableExif: true,
						viewport: {
							width:boundary_length/2,
							height:boundary_length/2,
							type:'square' //circle
						},
						boundary:{
							width:boundary_length,
							height:boundary_length
						}
						
					});

					//select from local
					$('#upload_image').on('change', function(){
						var reader = new FileReader();
						reader.onload = function (event) {
							$image_crop.croppie('bind', {
								url: event.target.result
							}).then(function(){
								console.log('jQuery bind complete');
							});
						}
						reader.readAsDataURL(this.files[0]);
						$('#uploadimageModal').modal('show');
					});
					//when click category select
					$('.ui-input-search input').on('click', function(){
						$('#myDropdown').css('display','block');
					});
					//select from server
					$('.server_img_select').on('click', function(){
						var tempurl=$(this).attr('value');
						$('#imgDropdown').css("display","none");

							$image_crop.croppie('bind', {
								url: "../userimage/upload/"+tempurl
							}).then(function(){
								console.log('jQuery bind complete');
							});
						$('#uploadimageModal').modal('show');
					});

					$('.crop_image').click(function(event){
						$image_crop.croppie('result', {
							type: 'canvas',
							size: 'viewport',
							size: {
								width: 100,
								height: 100
							}
						}).then(function(response){
							$.ajax({
								url:"../userimg/upload.php",
								type: "POST",
								data:{"image": response, "img_type": "low"},
								success:function(data)
								{
									imageL = "userimg/"+data;
									$('#preview').attr('src',"../"+imageL);
								}
							});
						})
						$image_crop.croppie('result', {
							type: 'canvas',
							size: 'viewport',
							size: {
								width: 600,
								height: 600
							}
						}).then(function(response){
							$.ajax({
								url:"../userimg/upload.php",
								type: "POST",
								data:{"image": response, "img_type": "high"},
								success:function(data)
								{
									imageH = "userimg/"+data;
									$('#previewH').attr('src',"../"+imageH);
								}
							});
						})
					});

				});  
				</script>
					

				<?php
				if(isset($_GET['id'])){
				?>
					<Button class="update_or_save" onclick = "updateProduct(<?php echo $_GET['id'] ?>)"><?=_Save?></button>
				<?php
				}
				else{
				?>
					<Button class="update_or_save" onclick = "saveProduct()">Inserisci</button>
				<?php
				}
				?>
					<script type="text/javascript">
						//get category_array for setting category text from id
						var category_array=new Array();
						function loadCategory(response){
							var temp_category_list='';
							if(response.records != null){
								i=0// da modificare leggendo solo il primo elemento se esiste
								for(; i< response.records.length; i++){
									temp_category_list+='<li ><a onclick="setcategory(this)"  class="ui-btn ui-btn-icon-right ui-icon-carat-r" category_index="'+response.records[i].record.id+'">'
															+response.records[i].record.name+
														'</a></li>';
									category_array[response.records[i].record.id]=response.records[i].record.name;
								}
								$('#myDropdown').append(temp_category_list);
								
								
							}
						}
						$.post('../lib.php', {operation: "getCategory", cid: <?php echo $cid; ?>}, loadCategory);
						
						<?php
						if(isset($_GET['id'])){//------------------------------------------------------------------
						?>
						function loadProduct(response){
							console.log(category_array);
							if(response.records != null){
								i=0// da modificare leggendo solo il primo elemento se esiste
								for(; i< response.records.length; i++){
									
									$('#pName').val(response.records[i].record.name);
									$('#pPrint').val(response.records[i].record.printdescription);
									$('#pPrice').val(response.records[i].record.price);
									$('#pStatus').val(response.records[i].record.status).slider("refresh");
									$('#pNote').val(response.records[i].record.note).slider("refresh");

									//get category text from id with category_array
									$('.ui-input-search input').val(category_array[response.category_id]);
									pCategory=response.category_id;

									$('#pSequence').val(response.sequence);
									$('#pQmin').val(response.records[i].record.qty_min);
									$('#pQmax').val(response.records[i].record.qty_max);
									$('#pQstep').val(response.records[i].record.qty_step);
									$('#pDescription').val(response.records[i].record.description);
									$('#pLongDescription').val(response.records[i].record.long_description);
									$('#pLongDescriptionEn').val(response.records[i].record.long_description_en);
									$('#preview').attr('src', '../'+response.records[i].record.image_path_low);
									$('#previewH').attr('src', '../'+response.records[i].record.image_path_high);
									imageL = response.records[i].record.image_path_low;
									imageH = response.records[i].record.image_path_high;

								}
								
							}
						}
						setTimeout(function(){
							$.post('../lib.php', {operation: "getProduct", id: <?php echo $_GET['id'] ?>, cid: <?php echo $cid; ?>}, loadProduct);
						}, 500);
						<?php
							}//-------------------------------------------------------------------------------------
						?>
					</script>	
			

			</div>
		</div>
	</div>

<!-- for crop image -->
<!-- <script src="lang/croppie.js"></script>
<script src="lang/demo.js"></script> -->
</body>
<?php
}
else{
	header( 'Location: index.php' ) ;
	exit();
}
?>