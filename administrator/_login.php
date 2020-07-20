<?php include('../config.php'); ?>
<!DOCTYPE html>
<html>
<head>
 
    <title>Collegati per amministrare i menù del - <?php echo $ristorante ?></title>
 
    <!--Pannello di gestione creato da Mel Riccardo-->
    <link href="../Style/admin.css" rel="stylesheet" type="text/css" />
 
</head>
<body>
 
    <form id="login" action="verifica.php" method="post">
        <fieldset id="inputs">
            <input id="username" name="username" type="text" placeholder="Username" autofocus required>
            <input id="password" name="password" type="password" placeholder="Password" required>
        </fieldset>
        <fieldset id="actions">
            <input type="submit" id="submit" value="Collegati">
            <a href="../monitor.php" id="back">Ritorna al monitor</a>
        </fieldset>
    </form>
 
</body>
</html>