<?php
include_once 'database.php';
if(isset($_POST['submit']))

{    

     $host = $_POST['host'];
     $ip = $_POST['ip'];
     $gateway = $_POST['gateway'];
     $netmask = $_POST['netmask'];
     $dns = $_POST['dns'];
     $netwerk = $_POST['netwerk'];

     $sql = "INSERT INTO `pakket`(`host`, `ip`, `gateway`, `netmask`, `dns`, `netwerk`) VALUES ('$host','$ip','$gateway','$netmask','$dns','$netwerk')";
     
}
if ($conn->query($sql) === TRUE) {
    print "$host is toegevoegd!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
  
?>