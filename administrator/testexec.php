<?php

  $disabled = explode(', ', ini_get('disable_functions'));
  if(!in_array('exec', $disabled)){
  	echo "abilitato";
  }
  else{
  	echo "non abilitato";
  }

?>