<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../style/jquery.mobile-1.4.2.min.css" />
		<link rel="stylesheet" href="../style/jquery.Jcrop.min.css" type="text/css" />
		<script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../js/jquery.Jcrop.min.js"></script>
		<script src="../js/jquery.mobile-1.4.2.min.js"></script>
		<script type="text/javascript">

			$(function(){

				$('#cropbox').Jcrop({
					aspectRatio: 1,
					onChange: showPreview,
					onSelect: showPreview,
					onSelect: updateCoords
				});

			});

			function updateCoords(c)
			{
				$('#x').val(c.x);
				$('#y').val(c.y);
				$('#w').val(c.w);
				$('#h').val(c.h);
			};

			function checkCoords()
			{
				$('#resyzeH').val($('#imageDiv img').height());
				$('#resyzeW').val($('#imageDiv img').width());
				if (parseInt($('#w').val())) return true;
				alert("Seleziona prima un'area da tagliare");
				return false;
			};
			
			function showPreview(coords)
			{
				if (parseInt(coords.w) > 0)
				{
					var rx = 100 / coords.w;
					var ry = 100 / coords.h;
					//500 E 370 DA CAMBIARE CON GRANDEZZA IMG DI IMPUT
					
					jQuery('#preview').css({
						//width: Math.round(rx * 500) + 'px',
						//height: Math.round(ry * 370) + 'px',
						width: Math.round(rx * $('#imageDiv img').width()) + 'px',
						height: Math.round(ry * $('#imageDiv img').height()) + 'px',
						marginLeft: '-' + Math.round(rx * coords.x) + 'px',
						marginTop: '-' + Math.round(ry * coords.y) + 'px'
					});
				}
			}

			$(document).ready(function() {
				 $('#image').change(function() { $('#target').submit(); });
			});
		</script>

	
<?php
session_start();
ini_set('upload_max_filesize','10');
$uploaddir = 'tmp/';
$mypath = 'userimage/upload/';
$destinationdir = '../'.$mypath;//'image/';
$uploadfile = 'non_disponibile.jpg';//$uploaddir . basename($_FILES['image']['name']);
$thumb_w=100;
$thumb_h=100;
$thumb2_w=600;
$thumb2_h=600;
$imageL="";
$imageH="";
$cid=$_SESSION['adminClientId'];

//UTILIZZARE LA NUOVA VERSIONE RILASCITA A FEBBRAIO 2013 con drag and drop
//CORREGGERE ORIGINAL SIZE perchè la x e la y vengono prese in base alla immagine ridimensionata

if(isset($_POST['MAX_FILE_SIZE'])){
	$uploadfile = $uploaddir.$cid."_"."temp"; //. basename($_FILES['image']['name']);
	if (move_uploaded_file($_FILES['image']['tmp_name'], $uploadfile)) {
		//echo "File is valid, and was successfully uploaded.\n";
		//print_r($_FILES) . "\n";
	} 
	else {
		//echo "Upload failed";
		?>
			<script type="text/javascript">
				alert('errore in fase di caricamento');
			</script>
		<?php
	}
	
}

else if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
	$uploadfile =$_POST['uploadfile'];
	// Original image's details
	//$original = dirname(__FILE__) . DIRECTORY_SEPARATOR . 'tmp' . DIRECTORY_SEPARATOR . $filename;
	$targ_w=$_POST['w'];
	$targ_h=$_POST['h'];
	
	
	$jpeg_quality = 90;
	$original = $uploadfile;//'flowers.jpg';
	list($originalWidth, $originalHeight, $originalType) = getimagesize($original);
 
	// Original image's resource
	$types = array(1 => 'gif', 'jpeg', 'png');
	

	//RIDIMENSIONO L'IMMAGINE SECONDO LE DIMENSIONI CHE ERANO SULLA PAGINA
	$source = call_user_func('imagecreatefrom' . $types[$originalType], $original);//imagecreatefromjpeg($original);
	if (function_exists('imagecreatetruecolor') && ($thumb = imagecreatetruecolor($_POST['resyzeW'], $_POST['resyzeH'])))
	{
		imagecopyresampled($thumb, $source, 0, 0, 0, 0, $_POST['resyzeW'], $_POST['resyzeH'], $originalWidth, $originalHeight);
	}
	else
	{
		$thumb = imagecreate($_POST['resyzeW'], $_POST['resyzeH']);
		imagecopyresized($thumb, $source, 0, 0, 0, 0, $_POST['resyzeW'], $_POST['resyzeH'], $originalWidth, $originalHeight);
	}
	/*
	$thumb = imagecreatetruecolor($_POST['resyzeW'], $_POST['resyzeH']);
	$source = imagecreatefromjpeg($original);
	//$source = call_user_func('imagecreatefrom' . $types[$originalType], $original);
	imagecopyresized($thumb, $source, 0, 0, 0, 0, $_POST['resyzeW'], $_POST['resyzeH'], $originalWidth, $originalHeight);
	*/
	// Salvo l'immagine ridimensionata
	imagejpeg($thumb, $original, $jpeg_quality);

	//FINE RIDIMENSIONAMENTO

	$image = call_user_func('imagecreatefrom' . $types[$originalType], $original);
 	
	// Crop image
	/*
	if (function_exists('imagecreatetruecolor') && ($temp = imagecreatetruecolor($targ_w, $targ_h)))
	{
		imagecopyresampled($temp, $image, 0, 0, $_POST['x'], $_POST['y'], $targ_w, $targ_h, $originalWidth, $originalHeight);
	}
	else
	{
		$temp = imagecreate($targ_h, $targ_h);
		imagecopyresized($temp, $image, 0, 0, $_POST['x'], $_POST['y'], $targ_h, $targ_h, $originalWidth, $originalHeight);
	}
	
	*/
	
	if (function_exists('imagecreatetruecolor') && ($temp = imagecreatetruecolor($thumb_w, $thumb_h)) && ($temp2 = imagecreatetruecolor($thumb2_w, $thumb2_h)))
	{
		imagecopyresampled($temp, $image, 0, 0, $_POST['x'], $_POST['y'], $thumb_w, $thumb_h,  $targ_h, $targ_h);
		imagecopyresampled($temp2, $image, 0, 0, $_POST['x'], $_POST['y'], $thumb2_w, $thumb2_h,  $targ_h, $targ_h);
	}
	else
	{
		$temp = imagecreate($thumb_w, $thumb_h);
		$temp2 = imagecreate($thumb2_w, $thumb2_h);
		imagecopyresized($temp, $image, 0, 0, $_POST['x'], $_POST['y'], $thumb_w, $thumb_h, $targ_h, $targ_h);
		imagecopyresized($temp2, $image, 0, 0, $_POST['x'], $_POST['y'], $thumb2_w, $thumb2_h, $targ_h, $targ_h);
	}
	
	//move_uploaded_file($original, dirname(__FILE__) . DIRECTORY_SEPARATOR . 'image' . DIRECTORY_SEPARATOR . 'thumb_' . $original)
	//$delete = unlink($original);
	
	$date_time = date('YmdHis');
	
	//imagejpeg($temp,dirname(__FILE__) . DIRECTORY_SEPARATOR . 'image' . DIRECTORY_SEPARATOR . $date_time .'_thumb_' . 'low.'. $types[$originalType],$jpeg_quality);
	//imagejpeg($temp2,dirname(__FILE__) . DIRECTORY_SEPARATOR . 'image' . DIRECTORY_SEPARATOR . $date_time .'_thumb_' . 'high.'. $types[$originalType],$jpeg_quality);
	
	// Queste due righe erano quelle precedenti prima intervento Efix 20131106
	//imagejpeg($temp,$destinationdir. $date_time . '_low.'. $types[$originalType],$jpeg_quality);
	//imagejpeg($temp2,$destinationdir . $date_time  . '_high.'. $types[$originalType],$jpeg_quality);
	
	imagejpeg($temp,$destinationdir.$cid."_" .$date_time . '_low.'. $types[$originalType],$jpeg_quality);
	imagejpeg($temp2,$destinationdir.$cid."_" . $date_time  . '_high.'. $types[$originalType],$jpeg_quality);

	// Queste due righe erano quelle precedenti prima intervento Efix 20131106
	//$imageL = ($mypath.$date_time . "_low.". $types[$originalType]);
	//$imageH = ($mypath.$date_time . "_high.". $types[$originalType]);

	$imageL = ($mypath.$cid."_" .$date_time . "_low.". $types[$originalType]);
	$imageH = ($mypath.$cid."_" .$date_time . "_high.". $types[$originalType]);
	
	?>
	<script type="text/javascript">
		$(document).ready(function() {
			var imageL = document.getElementById('imL').name;
			var imageH = document.getElementById('imH').name;
			//alert('pippo');
			//window.parent.prova(imageL, imageH);
			window.parent.closePopup(imageL, imageH);
			
			//window.parent.jQuery('#popupIframe').popup( "close" );
			
		});
	</script>
	<?php
	//echo (date('YmdHis'));
	
	//DECOMMENTARE LE RIGHE SOTTO 
	//unlink($original); //delete file
	//header("location: google.it");
	//exit();
	
	/*
	if (copy($temp,dirname(__FILE__) . DIRECTORY_SEPARATOR . 'image' . DIRECTORY_SEPARATOR . 'thumb_' . $original)) {
		unlink($original);
	}
	
	header("location: google.it");
	exit();
	
	/*
	$targ_w = $targ_h = 150;
	$jpeg_quality = 90;
	
	
	$src = 'flowers.jpg';
	$img_r = imagecreatefromjpeg($src);
	$dst_r = ImageCreateTrueColor( $targ_w, $targ_h );

	imagecopyresampled($dst_r,$img_r,0,0,$_POST['x'],$_POST['y'],
	$targ_w,$targ_h,$_POST['w'],$_POST['h']);
	
	
	header('Content-type: image/jpeg');
	imagejpeg($dst_r,null,$jpeg_quality);

	
	exit;
	*/
	
}

// If not a POST request, display page below:

?>

</head>

	<body>
	<div data-role="page">
		<form action="crop.php" id="target" enctype="multipart/form-data" method="post" data-ajax="false" >
			<input name="image" id="image" data-inline="true" type="file" value="" />
			<!--<input type="submit" data-inline="true" value="Carica" /> -->
			<input type="hidden" data-inline="true" name="MAX_FILE_SIZE" value="1024000" />
		</form>

		<form>
			<input type="hidden" id="imL" name="<?php echo ($imageL); ?>" />
			<input type="hidden" id="imH" name="<?php echo ($imageH); ?>" />
		</form>
	
			<div id="outer">
			<!--
			<div class="jcExample">
			<div class="article">
			-->

			<div>
				<!--<h1>Jcrop - Crop Behavior</h1> -->
	
				<!-- This is the image we're attaching Jcrop to -->
				<!-- <img src="flowers.jpg" id="cropbox" /> -->

	
				<div id="imageDiv">
					<img style="width:100%; height:auto;" src="<?php echo($uploadfile);?>" id="cropbox" />
				</div>
				<!--
				<div style="width:100px;height:100px;overflow:hidden;">
					<img src="<?php echo($uploadfile);?>" id="preview" />
				</div>
				-->
	
				<!-- This is the form that our event handler fills -->
	
	
			</div>
			<form action="crop.php" method="post" onsubmit="return checkCoords();" data-ajax="false">
				<input type="hidden" id="x" name="x" />
				<input type="hidden" id="y" name="y" />
				<input type="hidden" id="w" name="w" />
				<input type="hidden" id="h" name="h" />
				<input type="hidden" name="uploadfile" value="<?php echo ($uploadfile); ?>" />
				<input type="hidden" id="resyzeH" name="resyzeH" value=''/>
				<input type="hidden" id="resyzeW" name="resyzeW" value=''/>
				<input type="submit" value="Salva immagine"/>
			</form>
			</div>
		</body>
	</div>
</html>
