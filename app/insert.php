<?php
include 'database.php';
if(isset($_POST['submit']))

{    
//mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $host = mysqli_real_escape_string($conn, $_POST['host']);
     $ether = mysqli_real_escape_string($conn, $_POST['ether']);
     $ip = mysqli_real_escape_string($conn, $_POST['ip']);
     $gateway = mysqli_real_escape_string($conn, $_POST['gateway']);
     $netmask = mysqli_real_escape_string($conn, $_POST['netmask']);
     $dns = mysqli_real_escape_string($conn, $_POST['dns']);
     $netwerk = mysqli_real_escape_string($conn, $_POST['netwerk']);

     $sql = "INSERT INTO `pakket`(`host`, `ip`, `ether`, `gateway`, `netmask`, `dns`, `netwerk`) 
                          VALUES ('$host','$ip', '$ether','$gateway','$netmask','$dns','$netwerk')";

     
}
if ($conn->query($sql) === TRUE) {
  $home = header("location: ../index.php");
  exit;
} else {
  }
  