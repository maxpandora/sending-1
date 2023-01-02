<?php
include 'database.php';
if(isset($_POST['submit']))



{    
//mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $host =    mysqli_real_escape_string($conn, $_POST['host']);
     $ether =   mysqli_real_escape_string($conn, $_POST['ether']);
     $end = substr($ether, -12);
     $chunks = str_split($end, 2);
     $result = implode(':', $chunks);
     $ip =      mysqli_real_escape_string($conn, $_POST['ip']);
     $gateway = mysqli_real_escape_string($conn, $_POST['gateway']);
     $netmask = mysqli_real_escape_string($conn, $_POST['netmask']);
     $dns =     mysqli_real_escape_string($conn, $_POST['dns']);
     $netwerk = mysqli_real_escape_string($conn, $_POST['netwerk']);
     $userId = mysqli_real_escape_string($conn, $_POST['userId']);


     $sql = "INSERT INTO `pakket`(`host`, `ip`, `ether`, `gateway`, `netmask`, `dns`, `netwerk`, `userId` ) 
                          VALUES ('$host', '$ip', '$result','$gateway','$netmask','$dns','$netwerk', '$userId')";

     
}
if ($conn->query($sql) === TRUE) {
  $home = header("location: ../index.php");
  exit;
} else {
  print $userId;
  echo "<P>test</P>";
  }
  