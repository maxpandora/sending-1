<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="stylesheet.css">

</head>
<body>
    <?php 
        include 'navbar.php';
        include 'app/database.php';
        $id = $_GET['id'];
        $sql = "SELECT * FROM pakket WHERE id='$id'";
        $result = $conn->query($sql);
?>

<?php
        while($row = $result->fetch_assoc()){
        echo   "<BR><B>id: " . $id . "<br> <BR> </b>";
        echo   "hostname: " .$row["host"];
        echo   "ip adress: " . $row["ip"] . "<br>";
        echo   "Mac-adress: " .$row['ether'] . "<br>";
        echo   "Gateway: " .$row['gateway'] . "<br>";
        echo   "Netmask: " .$row['netmask'] . "<br>";
        echo   "DNS: " .$row['dns'] . "<br>";
        echo   "Netwerk: " .$row['netwerk'] . "<br>";
        echo   "Datum aangemaakt: " .$row['date'] . "<br>";
    }
?>
<BR><BR>
<a href="finished.php" class="button"><i class='fa fa-fw fa-arrow-left'></i>Go back</a>
</body>
</html>