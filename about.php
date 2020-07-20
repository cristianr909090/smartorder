<?php
session_start();
include('config.php');
$cid=$_SESSION['cid'];

$name="";
$phone="";
$address="";
$email="";
$skype="";
$facebook="";
$googleplus="";
$twitter="";
$latitude="";
$longitude="";
$distance_range=0;
$descripion="";

$query = "SELECT name, phone, address, email, skype, facebook, googleplus, twitter, latitude, longitude, distance_range, descripion FROM clients where id=$cid";
$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);

while ($record = mysqli_fetch_array($result)){
	$name=$record['name'];
	$phone=$record['phone'];
	$address=$record['address'];
	$email=$record['email'];
	$skype=$record['skype'];
	$facebook=$record['facebook'];
	$googleplus=$record['googleplus'];
	$twitter=$record['twitter'];
	$latitude=$record['latitude'];
	$longitude=$record['longitude'];
	$distance_range=$record['distance_range'];
	$descripion=$record['descripion'];
}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<title></title>
	<link rel="stylesheet" href="style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet" href="style/jRating.jquery.css" />
	<link rel="stylesheet" href="style/my.css" />
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery.mobile-1.4.2.min.js"></script>
	<script src="js/jquery.lazyload.js"></script>
	<script src="js/jRating.jquery.js"></script>
	<script src="http://maps.google.com/maps/api/js?sensor=true"></script> <!--attenzione versione offline -->
	<script src="js/gmaps.js"></script>
	<script src="js/my.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
      		$(".rating2").jRating({
	  			isDisabled : true
			});
		});
	</script>
</head>
<body>
	<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a">
		<a id="closeButton" data-rel="back" data-icon="delete">Chiudi</a>	
		<h1>Informazioni</h1>
	</div>
	<div class="contentMY">
		<div data-role="collapsible" data-theme="b"  data-content-theme="c" id="info" data-collapsed="false">
			<h3>Info</h3>
        	<div >
        		<?php
        		echo "<h3>".$name."</h3>";
        		echo "<a href='tel:".$phone."'>".$phone."</a>";
        		echo "<a href='mailto:".$email."'>".$email."</a>";
        		echo "<p>".$address."</p>";
        		echo "<p>".$descripion."</p>";
        		?>
        	</div>
    	</div>
    	<div data-role="collapsible" data-theme="b"  data-content-theme="c" id="recensioni" data-collapsed="true">
			<h3>Recensioni</h3>
        		<?php
        		$query = "SELECT u.username, r.rating, r.title, r.note, r.useful, date_format(r.time, '%d-%m-%Y') as time from rating r join users u on r.user_id=u.id where r.client_id=$cid order by r.time desc";
				$result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
				$list='<ul id="ratinglist" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Cerca...">';
				while ($record = mysqli_fetch_array($result)){
					$list.='<li><div class="rating2" data-average=" '.$record['rating'].'"></div><h4>'.$record["title"].'</h4><p>'.$record['time'].'</p><p>'.$record["note"].'</p><div><a data-role="button" data-inline="true" data-mini="true">Utile</a><a onclick="alert(\'pippo\')" data-role="button" data-inline="true" data-mini="true">Non è utile</a></div></li>';
					/*
					echo "<div class='rating2' data-average='".$record['rating']."'></div>"; //data-id='".$cid."'
					echo "<h4> ".$record['title']."</h4>";
					echo "<h6>da ".$record['username']." - ".$record['time']."</h6>";
					*/
				}
				$list.='</ul>';
				echo $list;
        		?>
    	</div>
    </div>
	
</body>
</html>
