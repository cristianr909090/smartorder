<?php
session_start();
include('../config.php');
//echo('<ul id="prodList" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca..."> <li data-role="list-divider" >Lista prodotti</li>');

if($_POST['operation']=="getProdCateg"  && isset($_POST['cid']) && isset($_POST['categoria'])){

if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
	$cid=$_SESSION['adminClientId']; //get this from session after login
    $categoria = $_POST['categoria'];
?>
<br>
<!-- <ul id="prodCategoryList" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca..."> -->
<ul id="productCategList" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">

   	<li data-role="list-divider" >Lista prodotti per categoria</li>  
  	<?php
	    $query = "SELECT 
					id, 
					name, 
					COALESCE(description,'') as description, 
					price, 
					CONCAT(left(price, length(price)-2),',',right(price, 2)) as pricedes, 
					image_path_low, 
					status ,
					1 as Associato, 
					$cid as client_id, 
					$categoria as categoria   
				from menurows  
				where 
					client_id=$cid 
					and id in (Select idm from menurowcategories where client_id=$cid and idc=$categoria ) union select id, name, COALESCE(description,'') as description, price, CONCAT(left(price, length(price)-2),',',right(price, 2)) as pricedes, image_path_low, status ,0 as Associato, $cid as client_id, $categoria as categoria from menurows  where client_id=$cid 
					and id not in (Select idm from menurowcategories where client_id=$cid and idc=$categoria ) order by id";			
  		//$query = "SELECT id, name, COALESCE(description,'') as description, price, CONCAT(left(price, length(price)-2),',',right(price, 2)) as pricedes, image_path_low, status from menurows where client_id=$cid order by name";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		while ($record = mysqli_fetch_array($result)){
			if($record['Associato']==1){
				$chk1=1;
				//echo('<li><a href=""  data-transition="none"><img src="../image/load.gif" data-original="../'.$record['image_path_low'].'" width="100" height="100" /><h2>'.$record['name'].'</h2><p>'.$record['description'].'ASSOCIATO'.'</p><p>€'.$record['pricedes'].'</p></a><a id="elem'.$record['id'].'" data-icon="delete" data-transition="none" data-rel="dialog" onclick="associaCategoriaProdotto('.$record['id'].','.$categoria.','.$cid.','.$chk1.');" title="Disabilita" data-theme="e" style="border-top-width: 0px; border-bottom-width: 0px;"></a></li>');
				echo('<li><a href=""  data-transition="none"><img src="../image/load.gif"  data-original="../'.$record['image_path_low'].'" width="100" height="100" /><h2>'.$record['name'].'</h2><p>'.$record['description'].'ASSOCIATO'.'</p><p>€'.$record['pricedes'].'</p></a><a id="elem'.$record['id'].'" data-icon="check" data-transition="none" data-rel="dialog" onclick="associaCategoriaProdotto('.$record['id'].','.$categoria.');" title="Disabilita" data-theme="b" style="border-top-width: 0px; border-bottom-width: 0px;"></a></li>');
			}
			else{
				$chk1=0;
		 		//echo('<li><a href=""  data-transition="none"><img src="../image/load.gif" class="ui-disabled" data-original="../'.$record['image_path_low'].'" width="100" height="100" /><h2 class="ui-disabled">'.$record['name'].'</h2><p class="ui-disabled">'.$record['description'].'</p><p class="ui-disabled">€'.$record['pricedes'].'</p></a><a id="elem'.$record['id'].'" data-icon="check" data-transition="none" data-rel="dialog" onclick="associaCategoriaProdotto('.$record['id'].','.$categoria.','.$cid.','.$chk1.');" title="Abilita" data-theme="b" style="border-top-width: 0px; border-bottom-width: 0px;"></a></li>');
				echo('<li><a href=""  data-transition="none"><img src="../image/load.gif" class="ui-disabled" data-original="../'.$record['image_path_low'].'" width="100" height="100" /><h2 class="ui-disabled">'.$record['name'].'</h2><p class="ui-disabled">'.$record['description'].'</p><p class="ui-disabled">€'.$record['pricedes'].'</p></a><a id="elem'.$record['id'].'" data-icon="delete" data-transition="none" data-rel="dialog" onclick="associaCategoriaProdotto('.$record['id'].','.$categoria.');" title="Abilita" data-theme="b" style="border-top-width: 0px; border-bottom-width: 0px;"></a></li>');
			}
			
		}
//onclick ="associaCategoriaProdotto('.$record['id'].','.$categoria.','..$cid');"
  	?>

</ul>
<?php
}
else{
	header( 'Location: index.php' ) ;
	exit();
}
}
?>