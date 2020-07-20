<?php
session_start();
include('../config.php');
$page_title='';
if(isset($_GET['id']) && isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){

	$cid=$_SESSION['adminClientId']; //get this from session after login
	$id=$_GET['id'];
	$request_id=0;

	if(isset($_GET['type'])){
		if($_GET['type']==0)$page_title="Cameriere di chiamata";
		else if($_GET['type']==1)$page_title="Chiedi fattura";
		else $page_title="Dettaglio Ordine";
	}
	if(isset($_GET['requests_id']))$request_id=$_GET['requests_id'];
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Servizi Smart</title>
	<link rel="stylesheet"  href="../style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet"  href="../style/my.css" />
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../js/jquery.mobile-1.4.2.min.js"></script>
	<script src="../js/my.js"></script>
	<script type="text/javascript">
		function showMessage(message){
			$("<div class='ui-loader ui-overlay-shadow ui-body-b ui-corner-all'><h3>"+message+"</h3></div>").css({ "display": "block", "position": "fixed", "opacity": 0.92, "left": 0, "top": "15%", "width": "100%", "text-align": "center" }).appendTo( $.mobile.pageContainer ).delay( 4500 ).fadeOut( 3000, function(){
					$(this).remove();
			});
		}

		function escapeRequest(r_id){
			
			$.post('../lib.php', {operation: "escapeRequest", id: r_id , cid: <?php echo $cid; ?>}, onEscapeRequestSuccess);
			
		}
		function onEscapeRequestSuccess(response){
			if(response.returnCode=='0'){
				showMessage('Ordine evaso con successo');
				window.location.href = "index.php";
			}
			else{
				alert('Errore, si prega di riprovare');
			}
		}
	</script>

</head>
<body>
	<div data-role="page">
		
		<div data-role="header" data-id="headerPersistente">
			<a id="closeButtonOrder" href="#dashboard" data-rel="back" data-icon="delete">Chiudi</a>	

			<h1><?= $page_title?></h1>
			
		</div><!-- /header -->
		<div data-role="content" class="contentNAV">
			<div data-role="content">
				<?php
				if($_GET['type']==0 || $_GET['type']==1){
					$content2='';
					$content='<div class="rounded shadow light content inlineright">
									<h3>Handle Request</h3>
									<a href="#" onclick="escapeRequest('.$request_id.')" data-role="button" data-icon="check" data-inline="true" data-iconpos="notext">Evadi</a>
									<a href="#dashboard" data-role="button" data-rel="back" data-icon="delete" data-inline="true" data-iconpos="notext">Chiudi</a>
							</div>';
				}else{
					$query2 = "SELECT o.id as oid, m.id, m.name, COALESCE(m.description,'') as description, m.price, CONCAT(left(m.price, length(m.price)-2),',',right(m.price, 2)) as pricedes, m.image_path_low, o.order_id, o.number, o.note from menurows as m JOIN orderrows as o on m.id = o.row_id where m.client_id=$cid AND o.order_id = $id and o.client_id=$cid and o.client_visibility = 1 order by m.name";
					$result2 = mysqli_query($db_con,$query2) or die('Errant query:  '.$query2);
					$content2 ="";
					$content2='<ul id="ulorder" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">';
					$content2.='<li data-role="list-divider" >Ordine</li>';
					$tot=0;
					$subtot=0;
					while ($record2 = mysqli_fetch_array($result2)){
						$tot+=($record2["price"]*$record2["number"]);
						$subtot=($record2["price"]*$record2["number"]);
						$content2.='<li><img src="../'.$record2["image_path_low"].'" /><h2>'.$record2["name"].'</h2><p>Note: '.$record2["note"].'</p><p>€'.$record2["pricedes"].' x '.$record2["number"].'</p><p>Sub totale: '.substr_replace($subtot, ",", strlen($subtot)-2, 0).'</p></a></li>';

					}
					$content2.='</ul>';

					$query = "SELECT r.id, date_format(r.r_time,'%H:%i:%s %d-%m-%Y') as r_time, r.escapee, t.description, r.r_type, u.username, u.pre_phone_number, u.phone_number, u.image_path_low, u.email FROM requests r left join tables t on r.r_table=t.id left join users u on r.user_id=u.id where  r.order_id=$id and r.client_id=$cid";
					$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
					$content ='<div class="rounded shadow light content inlineright">';
					while($record = mysqli_fetch_array($result)){
						

						$content .='<div class= "rounded shadow light content inlineleft detail_image_2" id="detail_image_3"><img style="width:100px; height:100px;" src="../'.$record['image_path_low'].'" /></div>';
						$content .='<h3>Utente: '.$record['username'].'</h3>';
						$content .='<a href="tel:+'.$record['pre_phone_number'].$record['phone_number'].'" id="callTel">Chiama: +'.$record['pre_phone_number'].$record['phone_number'].'</a></br></br>';
						$content .='<a href="mailto:'.$record['email'].'" id="sendEmail">'.$record['email'].'</a>';
						$content .='<h3>Totale ordine: '.substr_replace($tot, ",", strlen($tot)-2, 0).'</h3>';
						$content .='<a href="#" onclick="escapeRequest('.$record['id'].')" data-role="button" data-icon="check" data-inline="true" data-iconpos="notext">Evadi</a>';
						
					}
					$content .='</div>';	
				}
					echo $content;
					echo $content2;
				
				?>

			</div>
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