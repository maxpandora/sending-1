<?php
include 'database.php';

$id = $_GET['id'];
$sql = "INSERT INTO pakket (`host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) 
        SELECT `host`, `ether`, `ip`, `gateway`, `netmask`, `dns`, `netwerk` FROM `pakket` WHERE id = $id";

if ($conn->query($sql) === TRUE) {
    $home = header("location: ../index.php");
}
?>
