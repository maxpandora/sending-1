<?php
include 'database.php';
// INSERT INTO pakket (`host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) SELECT `host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk` FROM `pakket` WHERE id = 85;

$id = $_GET['id'];
$sql = "INSERT INTO pakket (`host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) SELECT `host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk` FROM `pakket` WHERE id = $id";
if ($conn->query($sql) === TRUE) {
    $home = header("location: /sending/index.php");

}
    ?>

