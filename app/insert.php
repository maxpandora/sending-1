<?php
include 'database.php';
if(isset($_POST['submit']))



{    
//mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $name =    mysqli_real_escape_string($conn, $_POST['name']);
     $description =   mysqli_real_escape_string($conn, $_POST['description']);
     $productype =      mysqli_real_escape_string($conn, $_POST['productype']);
     $gateway = mysqli_real_escape_string($conn, $_POST['gateway']);
     $netmask = mysqli_real_escape_string($conn, $_POST['netmask']);
     $dns =     mysqli_real_escape_string($conn, $_POST['dns']);
     $netwerk = mysqli_real_escape_string($conn, $_POST['netwerk']);


     $sql = "INSERT INTO `product`(`name`, `productype`, `description`, `gateway`, `netmask`, `dns`, `netwerk` ) 
                          VALUES ('$name', '$productype', '$description','$gateway','$netmask','$dns','$netwerk')";

     
}
if ($conn->query($sql) === TRUE) {
  $home = header("location: ../index.php");
  exit;
} else {
  print $userId;
  echo "<P>test</P>";
  }
  