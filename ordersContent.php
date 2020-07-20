<?php
session_start();
include('config.php');
?>

<ul id="orders" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">
<?php

if(isset($_SESSION['old_orders'])){
	$old_orders = $_SESSION['old_orders'];
}
else{
	$old_orders=array();
	$_SESSION['old_orders']=$old_orders;
}

$orderIds ="-1";
foreach ($old_orders as $value) {
   	$orderIds.=", ".$value;
}
$query = "SELECT o.id as oid, m.id, m.name, COALESCE(m.description,'') as description, m.price, m.image_path_low, o.id as cart_row_id, o.order_id, o.number from menurows as m JOIN orderrows as o on m.id = o.row_id where o.order_id in ($orderIds);";
$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
$ordId=-1;
$title = 0;
$elements='';
while ($record = mysqli_fetch_array($result)){
	if($record['order_id']!= $ordId){
		$title++;
		$ordId=$record['order_id'];
		$elements.='<li data-role="list-divider" >Ordine '.$title.'</li>';
	}
	$elements.='<li><img src="'.$record ['image_path_low'].'" /><h2>'.$record ['name'].'</h2><p>'.$record ['description'].'</p><p>€'.$record ['price'].'</p><span class="ui-li-count">'.$record ['number'].'</span></a></li>';
}
echo($elements);
if($title==0){
	echo ('<li data-role="list-divider" >Ordini</li> <li>Non ci sono ordini effettuati</li>');
}
?>
</ul>