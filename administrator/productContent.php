<?php
session_start();
include('../config.php');
if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
	$cid=$_SESSION['adminClientId']; //get this from session after login
//$cid=1001; //get from session
?>
<ul id="prodList" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">
  	<li data-role="list-divider" >Lista prodotti</li>
  	<?php
  		$query = "SELECT id, name, COALESCE(description,'') as description, price, CONCAT(left(price, length(price)-2),',',right(price, 2)) as pricedes, image_path_low, status from menurows where client_id=$cid order by name";
		$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
		while ($record = mysqli_fetch_array($result)){
			if($record['status']==1){
				echo('<li><a href="product.php?id='.$record['id'].'" data-transition="none"><img src="../image/load.gif" data-original="../'.$record['image_path_low'].'" width="100" height="100" /><h2>'.$record['name'].'</h2><p>'.$record['description'].'</p><p>€'.$record['pricedes'].'</p></a><a data-icon="delete" data-transition="none" data-rel="dialog" onclick="disableProduct('.$record['id'].')" title="Disabilita" data-theme="e" style="border-top-width: 0px; border-bottom-width: 0px;"></a></li>');
			}
			else{
				echo('<li><a href="product.php?id='.$record['id'].'" data-transition="none"><img src="../image/load.gif" class="ui-disabled" data-original="../'.$record['image_path_low'].'" width="100" height="100" /><h2 class="ui-disabled">'.$record['name'].'</h2><p class="ui-disabled">'.$record['description'].'</p><p class="ui-disabled">€'.$record['pricedes'].'</p></a><a data-icon="check" data-transition="none" data-rel="dialog" onclick="enableProduct('.$record['id'].')" title="Abilita" data-theme="b" style="border-top-width: 0px; border-bottom-width: 0px;"></a></li>');
			}
			
		}
  	?>

</ul>
<?php
}
else{
	header( 'Location: index.php' ) ;
	exit();
}
?>