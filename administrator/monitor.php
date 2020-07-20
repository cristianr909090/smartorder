<?php 
session_start();
include('../config.php');
if(isset($_SESSION['adminLoginId']) && isset($_SESSION['adminClientId']) && isset($_SESSION['adminLoginActvated']) && $_SESSION['adminLoginActvated']==1){
	$cid=$_SESSION['adminClientId']; //get this from session after login
?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<!--
	<meta http-equiv="refresh" content="<?php echo $refresh_monitor ?>" />
	-->
	<title>SmartRestaurant Monitor</title>
	<style type="text/css">
		.block{
			min-width:50px;
			min-height:30px;
			
			margin:2px;
			float:left;
		}

		.block {
			outline: none;
			cursor: pointer;
			text-align: center;
			text-decoration: none;
			font: bold 16px Arial, Helvetica, sans-serif;
			color: #fff;
			padding: 5px 10px;
			border: solid 1px #0076a3;
			background: #0095cd;
			background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5));
			background: -webkit-linear-gradient(top,  #00adee,  #0078a5);
			background: -moz-linear-gradient(top,  #00adee,  #0078a5);
			background: -ms-linear-gradient(top,  #00adee,  #0078a5);
			background: -o-linear-gradient(top,  #00adee,  #0078a5);
			background: linear-gradient(top,  #00adee,  #0078a5);
			-moz-border-radius: 8px;
			-webkit-border-radius: 8px;
			border-radius: 8px;
			-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
			-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
			box-shadow: 0 1px 3px rgba(0,0,0,0.5);
		}
		.block:hover {
			background: #0095cd;
			background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee));
			background: -webkit-linear-gradient(top,  #0078a5,  #00adee);
			background: -moz-linear-gradient(top,  #0078a5,  #00adee);
			background: -ms-linear-gradient(top,  #0078a5,  #00adee);
			background: -o-linear-gradient(top,  #0078a5,  #00adee);
			background: linear-gradient(top,  #0078a5,  #00adee);
		}
		.block:active {
			position: relative;
			top: 1px;
		}
		.description {
			text-align: center;
			text-decoration: none;
			font: bold 10px Arial, Helvetica, sans-serif;
			color: #fff;
		
		}
	</style>
	<link rel="stylesheet" href="../style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet" href="../style/monitor.css" />
	<style>
		/* App custom styles */
	</style>
	<script src="../js/jquery-1.9.1.min.js">
	</script>
	<script src="../js/jquery.mobile-1.4.2.min.js">
	</script>
	<script src="../js/monitor.js">
	</script>
</head>
<body onload="lpStart()">

	<script type="text/javascript">
		var isfirst=true;
		var lastid=-1;
		var cid = <?php echo $cid; ?>;
		$(document).ready(function() {
			
			$("button").click(function(){
			$(".list").append("<div class='block'>157</div>")
		});

			$(".block").click(function(){
				alert('remove');
			$(this).remove();
		});


		/*$(".block").live("mouseover", function(){

			$(".block").click(function(){
			$(this).remove();
		});
		
		});
		*/ 

		});

	</script>

	<!-- <button>Aggiungi</button> -->
	<!--
	<div data-theme="b" data-role="header">
		<h3>
			SmartRestaurant MONITOR
		</h3>
	</div>
	<div data-theme="d" data-role="header">
		<h1>
			<?php //echo $ristorante ?> 
		</h1>
	</div>
	-->
		<div class="list" >
	<!--
	<div class='block' style="color: #FFFF00">
		22
	</div>
	<div class='block' style="color: #FF0000">
		44
	</div>
	<div class='block'>
		64
	</div>
	-->
<script type="text/javascript">
//funzioni push

var lpOnComplete = function(response) {

	if(response.records != null){
		/*
		for(i=0; i<response.records.length; i++){
		$(".list").append("<div class='block'>"+response.records[i].record.description+"</div>");
			$('.list > div:last-child').delay( <?php echo $period_milli_block; ?> ).fadeOut( 1000, function(){
					$(this).remove(); 
				});
			//alert(response.records[i].record.id);
			//else aprire chat
			lastid=response.records[i].record.id;
		}
		*/
		for(i=0; i<response.records.length; i++){
			if(response.records[i].record.description!=null){
				var block_background='';
				var order_type='';
				var temp_type=response.records[i].record.r_type;
				switch(temp_type){
					case '0':
						order_type='Call Waiter';
						block_background='green';
						break;
					case '1':
						order_type='Ask bill';
						block_background='#f767fb';
						break;
					default:
						order_type='Order';
						break;
				}
				$(".list").append("<a style='display:block' href='orderdetails.php?id="+response.records[i].record.order_id+"&type="+temp_type+"&requests_id="+response.records[i].record.id+"' target='_parent'>"+
										"<div class='block' style='"+(block_background!=''?("background:"+block_background):"")+"'>"+
											response.records[i].record.description+ 
											"<p class= 'description'>" +  order_type+ "</p>"+
											"<p class= 'description'>" +  response.records[i].record.r_time+"</p>"+
										"</div>"+
									"</a>");
			}
			else{
				$(".list").append("<a style='display:block' href='orderdetails.php?id="+response.records[i].record.order_id+"&type="+temp_type+"' target='_parent'>"+
										"<div class='block'>"+
											response.records[i].record.username+ 
											"<p class= 'description'>" +  response.records[i].record.phone_number+ "</p>"+
											"<p class= 'description'>" +  order_type+ "</p>"+
											"<p class= 'description'>" +response.records[i].record.r_time+"</p>"+
										"</div>"+
									"</a>");
			}
			lastid=response.records[i].record.id;
		}
	}
	lpStart();
};
 
var lpStart = function() {
	//$.post('updates.php', lpOnComplete, 'json');
	
	if(isfirst==false ){
			if(lastid > -1){
				$.post('updates.php', {lastid: lastid, cid: cid}, lpOnComplete, 'json');
			}
			else{
				$.post('updates.php', {first: 'true', cid: cid}, lpOnComplete, 'json');
			}
	}
	else{
			$.post('updates.php', {first: isfirst, cid: cid}, lpOnComplete, 'json');
			isfirst=false;
	}
};
</script>
</body>
</html>
<?php
}
else{
	echo "ERRORE DI SESSIONE";
	exit();
}
?>