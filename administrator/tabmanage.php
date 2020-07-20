<?php
//type_array is for type select
$type_array=["Pulsante (chiamata cameriere)",
                "Tab Semplice (Lista piana)",
                "Eventi",
                "Tab Carrello/WishList",
                "Tab Gerarchico (Lista ad albero)",
                "Ordini effettuati",
                "Link a sito esterno (solo menu a destra)",
                "IFrame link a sito esterno",
                "About (info servizismart)"];
$max_sequence=0;                
//first title row
$first_row='<div class="tab_row head_tab_row">
                        <div class="tab_row_col_1">'._Name.'</div>
                        <div class="tab_row_col_2">Visible</div>
                        <div class="tab_row_col_3">'._Position.'</div>
                        <div class="tab_row_col_4">'._Sequence.'</div>
                        <div class="tab_row_col_5">'._Type.'</div>
                        <div class="tab_row_col_6">'._Add_info.'</div>
                        <div class="tab_row_col_7">'._Edit.'</div>
                        <div class="tab_row_col_8">'._Delete.'</div>
                    </div>';



// $none_visible='<div class="none_visible tab_manage_block">
//                     <label>'.$None_visible_menu.'</label>'.$first_row;
$main_menu='<div class="main_menu tab_manage_block"><label>'._Main_menu.'</label>'.$first_row;
$right_menu='<div class="right_menu tab_manage_block"><label>'._Right_menu.'</label>'.$first_row;




//get data of clients from tabs wh
$queryC = "SELECT * FROM tabs where client_id=$cid order by visibility DESC, tOrder";
$result = mysqli_query($db_con,$queryC) or die('Errant query:  '.$queryC);
while ($record = mysqli_fetch_array($result)){
    // if($record['visibility']==0){
        // <div class="tab_row_col_2">'.$record['visibility'].'</div>
        // <div class="tab_row_col_3">'.$record['position'].'</div>
        // <div class="tab_row_col_5">'.$record['parent'].'</div>

        // $none_visible.='<div class="tab_row">
        //                     <div class="tab_row_col_1">'.$record['name'].'</div>
        //                     <div class="tab_row_col_2">'.$record['visibility'].'</div>
        //                     <div class="tab_row_col_3">'.$record['position'].'</div>
        //                     <div class="tab_row_col_4">'.$record['tOrder'].'</div>
        //                     <div class="tab_row_col_5">'.$record['data'].'</div>
        //                     <div class="tab_row_col_6"><i class="far fa-edit"></i></div>
        //                     <div class="tab_row_col_7" onclick="delete_row('.$record['id'].')"><i class="far fa-trash-alt"></i></div>
        //                 </div>';
    // }else 
    if($max_sequence<$record['tOrder'])$max_sequence=$record['tOrder'];
    $content='<div class="tab_row">
                <div class="tab_row_col_1">'.$record['name'].'</div>
                <div class="tab_row_col_2">'.(($record['visibility']==1)?'<i class="fas fa-check"></i>':'').'</div>
                <div class="tab_row_col_3">'.(($record['position']==0)?_Main_menu:_Right_menu).'</div>
                <div class="tab_row_col_4">'.$record['tOrder'].'</div>
                <div class="tab_row_col_5">'.$type_array[$record['type']].'</div>
                <div class="tab_row_col_6">'.$record['data'].'</div>
                <div class="tab_row_col_7" onclick="edit_row(this,'."'".$record['id']."'".','.
                                                                "'".$record['name']."'".','.
                                                                "'".$record['visibility']."'".','.
                                                                "'".$record['position']."'".','.
                                                                "'".$record['tOrder']."'".','.
                                                                "'".$record['type']."'".','.
                                                                "'".$record['data']."'".')">
                    <i class="far fa-edit"></i>
                </div>
                <div class="tab_row_col_8" onclick="delete_row('.$record['id'].')"><i class="far fa-trash-alt"></i></div>
            </div>';
    if($record['position']==0){
        $main_menu.=$content;

    }else{
        $right_menu.=$content;
    }
}

$last_row='<div class="tab_row last_row">
                <div class="tab_row_col_1" onclick="add_row(this)"><i class="fas fa-plus-circle"></i>'._Add.'</div>
                <div class="tab_row_col_2"></div>
                <div class="tab_row_col_3"></div>
                <div class="tab_row_col_4"></div>
                <div class="tab_row_col_5"></div>
                <div class="tab_row_col_6"></div>
                <div class="tab_row_col_7"></div>
            </div>';
?>
<form class="cristian_tab_manage" id="tabForm">
    <?php echo $main_menu.$last_row."</div>".$right_menu.$last_row."</div>"?>
    <p id="hidden_max_sequence"><?= $max_sequence?></p>

</form>