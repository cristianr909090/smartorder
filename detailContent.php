<?php
session_start();
include('config.php');

//load language file
if(isset($_GET['lang']) && $_GET['lang']=='it'){
	$_SESSION['lang']="it";
   	require_once('lang/it.php');
}
else{
	if(isset($_SESSION['lang']) && $_SESSION['lang']=="it")require_once('lang/it.php');
	else{
		$_SESSION['lang']="en";
		require_once('lang/en.php');
	}
}

			
			$result;
			if(isset($_POST['id']) && isset($_POST['cid']) && isset($_POST['eo'])){
				$enable_order=$_POST['eo'];
				$id=$_POST['id'];
				$cid= $_POST['cid'];
				$query = "SELECT name, price, COALESCE(long_description,'') as long_description, COALESCE(long_description_en,'') as long_description_en, image_path_high, note, qty_min, qty_max, qty_step FROM menurows where id=$id AND client_id=$cid";
					$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			}
			else if(isset($_POST['oid']) && isset($_POST['session'])){
				$oid=$_POST['oid'];
				$session=$_POST['session'];
				$query = "SELECT m.name, m.price, COALESCE(m.long_description,'') as long_description, COALESCE(m.long_description_en,'') as long_description_en, m.image_path_high, m.note, orr.note as notetext, orr.number, m.qty_min, m.qty_max, m.qty_step FROM menurows as m join orderrows as orr on m.id = orr.row_id join orders as o on orr.order_id = o.id where orr.id= $oid and o.session = '$session'";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
			}
			$content='';
			while ($record = mysqli_fetch_array($result)){
				$content.='<div id="name2"><h3 class="no_margin">'.$record['name'].'</h3></div>';
				if(isset($_POST['id']) && isset($_POST['cid']) && isset($_POST['eo'])){
					if($enable_order==1){
						if(isset($_POST['s']) && $_POST['s']!= 1){
							$content.='<a type="submit" class="ui-disabled" onclick="addDetail('.$id.', \''.session_id().'\')" data-role="button">'._Add_to_cart.'</a>';
						}
						else{
							$content.='<a type="submit" onclick="addDetail('.$id.', \''.session_id().'\')" data-role="button">'._Add_to_cart.'</a>';
						}
							
					}
					else{
						$content.='<a type="submit" onclick="addDetail('.$id.', \''.session_id().'\')" data-role="button">'._Add_to_list.'</a> ';
					}
				}
				else if(isset($_POST['oid']) && isset($_POST['session'])){
					$content.='<a type="submit" onclick="updateDetail('.$oid.')" data-role="button">'._Add.'</a>';
				}
				if(isset($_POST['s']) && $_POST['s']!= 1){
					//$content.='<input class="ui-disabled" type="number" min="1" max="20" name="number" id="number" value="1"  data-inline="true" onfocus="this.value =""/>';
					$content.='<select class="ui-disabled" name="number" id="number">';
						for($i=$record['qty_min']; $i<=$record['qty_max']; $i+=$record['qty_step']){
							$content.=" <option value='".$i."'>".$i."</option>";
						} 
					$content.='</select>';

					if($record['note']==1){
						$content.='<div class="ui-disabled" id="detailNote"> <label for="pNote">Note:</label><textarea cols="40" rows="8" name="pNote" id="pNote" value=""></textarea></div>';
					}
					$content.='<script type="text/javascript"> showMessage(\'Prodotto non ordinabile direttamente, per ordinare questo prodotto chiamare il cameriere\'); </script>';
					
				}
				else{
					if(isset($_POST['oid']) && isset($_POST['session'])){
						//$content.='<input type="number" min="1" max="20" name="number" id="number" value="'.$record['number'].'"  data-inline="true" onfocus="this.value =\'\'"/>';
						$content.='<select name="number" id="number">';
						for($i=$record['qty_min']; $i<=$record['qty_max']; $i+=$record['qty_step']){
							if($record['number']==$i) $content.=" <option selected value='".$i."'>".$i."</option>";
							else $content.=" <option value='".$i."'>".$i."</option>";
						} 
						$content.='</select>';
					}
					else{
						//$content.='<input type="number" min="1" max="20" name="number" id="number" value="1"  data-inline="true" onfocus="this.value =\'\'"/>';

						$content.='<select name="number" id="number">';
						for($i=$record['qty_min']; $i<=$record['qty_max']; $i+=$record['qty_step']){
							$content.=" <option value='".$i."'>".$i."</option>";
						} 
						$content.='</select>';

					}
					if($record['note']==1){
						if(isset($_POST['oid']) && isset($_POST['session'])){
							$content.='<div id="detailNote"> <label for="pNote">Note:</label><textarea cols="40" rows="8" name="pNote" id="pNote">'.$record['notetext'].'</textarea></div>';
						}
						else{
							$content.='<div id="detailNote"> <label for="pNote">Note:</label><textarea cols="40" rows="8" name="pNote" id="pNote" value=""></textarea></div>';
						}
					}
				}
				//$content.='<div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100%; height:auto;" src="'.$record['image_path_high'].'" id="image_3" /></div>';
				$content.='<div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100%; height:auto;" src="image/load.gif" id="image_3" /></div>';
				$content.='<script type="text/javascript"> function updateImage(){ $("#image_3").attr("src", "'.$record['image_path_high'].'"); }</script>';
				$content.='<br><div class="rounded shadow light content inlineright" id="content">';
				$content.='<h3 class="no_margin">€'.substr_replace($record['price'], ",", strlen($record['price'])-2, 0).'</h3>';
				if($record['long_description']!=''){
					$content.='<img src="image/it.png"> '.$record['long_description'].'<br>';
				}
				if($record['long_description_en']!=''){
					$content.='<img src="image/en.png"> '.$record['long_description_en'];
				}
				$content.='</div>';
				
			}
			echo $content;
?>
