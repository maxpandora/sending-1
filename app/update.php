<?php
include 'database.php';

$sql = ""; // Initialize $sql variable

if(isset($_POST['submit']))
{    
     $id       = $_GET['id'];
     $host     = mysqli_real_escape_string($conn, $_POST['host']);
     $ether    = mysqli_real_escape_string($conn, $_POST['ether']);
     $ip       = mysqli_real_escape_string($conn, $_POST['ip']);
     $gateway  = mysqli_real_escape_string($conn, $_POST['gateway']);
     $netmask  = mysqli_real_escape_string($conn, $_POST['netmask']);
     $dns      = mysqli_real_escape_string($conn, $_POST['dns']);
     $netwerk  = mysqli_real_escape_string($conn, $_POST['netwerk']);
     $sql = "UPDATE `pakket` SET `host`     = '$host',
                                 `ether`    = '$ether',
                                 `ip`       = '$ip',
                                 `gateway`  = '$gateway',
                                 `netmask`  = '$netmask',
                                 `dns`      = '$dns',
                                 `netwerk`  = '$netwerk' WHERE `pakket`.`id` = $id;";
}

if ($conn->query($sql) === TRUE) {
    header("Location: ../index.php");
    exit();
} else {
    // Handle error if necessary
}