<?php
include('../config.php');

backup_tables($db_host, $username, $password, $db_name);


/* backup the db OR just a table */
function backup_tables($host,$user,$pass,$name,$tables = '*')
{

  $link  = mysqli_connect($host, $user, $pass, $name);
  //$link = mysqli_connect($host,$user,$pass);
  //mysqli_select_db($name,$link);
  
  //get all of the tables
  if($tables == '*')
  {
    $tables = array();
    $result = mysqli_query($link,'SHOW TABLES');
    while($row = mysqli_fetch_row($result))
    {
      $tables[] = $row[0];
    }
  }
  else
  {
    $tables = is_array($tables) ? $tables : explode(',',$tables);
  }
  
  $return='';
  //cycle through
  foreach($tables as $table)
  {
    $result = mysqli_query($link,'SELECT * FROM '.$table);
    $num_fields = mysqli_num_fields($result);
    
    
    $return.= 'DROP TABLE IF EXISTS '.$table.';';
    $row2 = mysqli_fetch_row(mysqli_query($link,'SHOW CREATE TABLE '.$table));
    $return.= "\n\n".$row2[1].";\n\n";
    
    for ($i = 0; $i < $num_fields; $i++) 
    {
      while($row = mysqli_fetch_row($result))
      {
        $return.= 'INSERT INTO '.$table.' VALUES(';
        for($j=0; $j<$num_fields; $j++) 
        {
          
          if (isset($row[$j])) { 
            $type = mysqli_fetch_field_direct($result, $j);
            //blob for mediumtext e long text
            if($type=="string" || $type=="blob" || $type=="timestamp" || $type=="date" || $type=="time") $return.= '"'.$row[$j].'"' ;
            //int
            else $return.= $row[$j];
          } 
          else { 
            $return.= 'NULL'; 
          }

          $row[$j] = addslashes($row[$j]);
          //$row[$j] = ereg_replace("\n","\\n",$row[$j]);
          $row[$j] = preg_replace("/\n/","\\n",$row[$j]);
          //if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
          
          //aggiunta per gestire gli int e il null



          

          if ($j<($num_fields-1)) { $return.= ','; }
        }
        $return.= ");\n";
      }
    }
    $return.="\n\n\n";
  }
  
  //save file
  //$handle = fopen('db-backup-'.time().'-'.(md5(implode(',',$tables))).'.sql','w+');
  $handle = fopen('tmp/db-backup.sql','w+');
  fwrite($handle,$return);
  fclose($handle);

}
?>