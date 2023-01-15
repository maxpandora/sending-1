<!DOCTYPE html>
<html lang="nl">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <?php
include 'database.php';
if(isset($_POST['submit']))

{    

  // mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $id       = $_GET['id'];
     $name     = mysqli_real_escape_string($conn, $_POST['name']);
     $description    = mysqli_real_escape_string($conn, $_POST['description']);
     $productype       = mysqli_real_escape_string($conn, $_POST['productype']);
     $gateway  = mysqli_real_escape_string($conn, $_POST['gateway']);
     $netmask  = mysqli_real_escape_string($conn, $_POST['netmask']);
     $dns      = mysqli_real_escape_string($conn, $_POST['dns']);
     $netwerk  = mysqli_real_escape_string($conn, $_POST['netwerk']);
     $sql = "UPDATE `product` SET `name`     = '$name',
                                 `description`    = '$description',
                                 `productype`       = '$productype',
                                 `gateway`  = '$gateway',
                                 `netmask`  = '$netmask',
                                 `dns`      = '$dns',
                                 `netwerk`  = '$netwerk' WHERE `product`.`id` = $id;";
     
}
if ($conn->query($sql) === TRUE) {
  $home = header("location: /sending/index.php");
  exit;
} else {
  }
  ?>
</body>
</html>
