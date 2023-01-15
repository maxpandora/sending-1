<?php
include 'database.php';
if(isset($_POST['submit']))



{    
//mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $name =    mysqli_real_escape_string($conn, $_POST['name']);
     $desc =   mysqli_real_escape_string($conn, $_POST['desc']);
     $end = substr($desc, -12);
     $chunks = str_split($end, 2);
     $result = implode(':', $chunks);
     $ip =      mysqli_real_escape_string($conn, $_POST['ip']);
     $gateway = mysqli_real_escape_string($conn, $_POST['gateway']);
     $netmask = mysqli_real_escape_string($conn, $_POST['netmask']);
     $dns =     mysqli_real_escape_string($conn, $_POST['dns']);
     $netwerk = mysqli_real_escape_string($conn, $_POST['netwerk']);


     $sql = "INSERT INTO `product`(`name`, `ip`, `desc`, `gateway`, `netmask`, `dns`, `netwerk` ) 
                          VALUES ('$name', '$ip', '$result','$gateway','$netmask','$dns','$netwerk')";

     
}
if ($conn->query($sql) === TRUE) {
  $home = header("location: ../index.php");
  exit;
} else {
  print $userId;
  echo "<P>test</P>";
  }
  