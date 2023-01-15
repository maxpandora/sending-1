<?php
include 'database.php';
// INSERT INTO product (`name`, `desc`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) SELECT `name`, `desc`, `ip`, `gateway`, `netmask`, `dns`, `netwerk` FROM `product` WHERE id = 85;

$id = $_GET['id'];
$sql = "INSERT INTO product (`name`, `desc`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) 
SELECT `name`, `desc`, `ip`, `gateway`, `netmask`, `dns`, `netwerk` FROM `product` WHERE id = $id";
if ($conn->query($sql) === TRUE) {
    $home = header("location: ../index.php");

}
    ?>

