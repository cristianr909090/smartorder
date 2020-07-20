<?php
session_start();
// if(!isset($_SESSION['userLoginId']) || $_SESSION['userLoginId']==0){
// 	header("Location: login.php");
//     exit;
// }

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

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<title>ServiziSmart</title>
	<link rel="stylesheet" href="style/jquery.mobile-1.4.2.min.css" />
	<link rel="stylesheet" href="style/jRating.jquery.css" />
	<link rel="stylesheet"  href="style/ui-progress-bar.css" />
	<link rel="stylesheet" href="style/my.css" />
	<link rel="stylesheet" href="style/jquery.timepicker.css" />
	<link rel="stylesheet"  href="style/cristian.css" />
	<script src="js/cristian.js"></script>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery.mobile-1.4.2.min.js"></script>
	<script src="js/jquery.lazyload.js"></script>
	<script src="js/jRating.jquery.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/my.js"></script>
	<script src="js/smartorder.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
<div data-role="page" id="modalselecttable">
		<div data-role="header" data-id="headerPersistente" data-position="fixed" data-tap-toggle="false" data-theme="a"> 
			<a href="index.php" data-rel="back" data-icon="delete" id="closeSummary" ><?=_Close?></a>
			<h1>Consegna</h1>
		</div>
		<div data-role="content">
			<div id="selecttableDiv">
				<?php
                if(isset($_SESSION['cid'])){
                    $cid=$_SESSION['cid'];
                
                    $temp_string='';
                    if(!isset($_GET['t'])){
                        $queryC = "SELECT id, extnumber, description from tables where client_id=$cid";
                        $result = mysqli_query($db_con,$queryC) or die('Errant query:  '.$queryC);
                        
                        while ($record = mysqli_fetch_array($result)){
                            $temp_string.="<a rel='external' data-role='button' data-icon='forward' data-iconpos='right' class='row' href='index.php?cid=$cid&t=".$record['extnumber']."'>".
                                                $record['description'].
                                            "</a>";
                        }
                        echo $temp_string;
                    }else{
                        echo "You already selected the table number.";
                    }
                }else{
                    
                }
                ?>
			</div>
		</div>
</div>
</body>
</html>