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

     $sql2 = "INSERT INTO `screens` (`id`, `isDefault`, `name`, `isLandscape`, `rotation`, `sizeX`, `sizeY`, `ip`, `sshUsername`, `sshPort`, `userId`, `sshPassword`, `sshMasterServerPort`, `rootPath`, `tokenId`, `screenshotFileId`, `sshRsaKeyPath`, `htmlOverlayId`, `isContentScalable`, `syncEnabled`)
      VALUES (NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '$userId', NULL, NULL, '', NULL, NULL, '', NULL, '0', '0')"; 
}
if ($conn->query($sql) === TRUE) {
  if ($conn->query($sql2) === TRUE) {
    $home = header("location: ../index.php");
    exit;
  } else {
    // handle error in inserting into screens table
  }
} else {
  // handle error in inserting into pakket table
}
