<?php
include 'required.php';
if(isset($_POST['submit']))

{    
//mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $host = mysqli_real_escape_string($conn, $_POST['host']);
     $ip = mysqli_real_escape_string($conn, $_POST['ip']);
     $gateway = mysqli_real_escape_string($conn, $_POST['gateway']);
     $netmask = mysqli_real_escape_string($conn, $_POST['netmask']);
     $dns = mysqli_real_escape_string($conn, $_POST['dns']);
     $netwerk = mysqli_real_escape_string($conn, $_POST['netwerk']);

     $sql = "INSERT INTO `pakket`(`host`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) 
                          VALUES ('$host','$ip','$gateway','$netmask','$dns','$netwerk')";

     
}
if ($conn->query($sql) === TRUE) {
    $home;
    exit;
} else {
  }
  