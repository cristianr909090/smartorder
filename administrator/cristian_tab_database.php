<?php
echo "-----";
// include('../config.php');
if (isset($_POST['tab_id'])) {
    // $query = "UPDATE tabs SET name=".$_POST['tab_name'].", visibility=".$_POST['tab_visibility'].", position=".$_POST['tab_position'].", tOrder=".$_POST['tab_tOrder'].", type=".$_POST['tab_type'].", data=".$_POST['tab_data']." WHERE id=".$_POST['tab_id'];
    $query = "UPDATE tabs SET position=5 WHERE id=5";
    $result = mysqli_query($db_con,$query) or die('Errant query:  '.$query);
    // echo $query;
    echo "asdf";
} else {
  
    echo "qwer";

}
?>