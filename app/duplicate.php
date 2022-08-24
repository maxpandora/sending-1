<?php
include 'database.php';
// INSERT INTO wapenlijst (`host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) SELECT `host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk` FROM `wapenlijst` WHERE id = 85;

$id = $_GET['id'];
$sql = "INSERT INTO wapenlijst (`host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) 
SELECT `host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk` FROM `wapenlijst` WHERE id = $id";
if ($conn->query($sql) === TRUE) {
    $home = header("location: ../index.php");

}
    ?>

