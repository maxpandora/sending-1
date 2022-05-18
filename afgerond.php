<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Afgerond</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <?php 
    require_once 'navbara.php';
    ?>
      <div class="div-1">
  <h1>Afgerond</h1>
<?php

    $servername='localhost';
    $username='root';
    $password='';
    $dbname = "sending";
    $conn=mysqli_connect($servername,$username,$password,"$dbname");
      if(!$conn){
          die('Could not Connect MySql Server:' .mysql_error());
        }
        



   $sql2 = "SELECT * FROM `pakket` WHERE `afgerond` = 1";
   $result = $conn->query($sql2);
   
   if ($result->num_rows > 0) {
     // output data of each row
      echo "
            <table class='table2'><tr>
            <th>Id</th>
            <th>Name</th>
            <th>Ip</th>
            <th>Gateway</th>
            <th>Netmask</th>
            <th>Dns</th>
            <th>DHCP/STATIC</th>
            <th>Datum</th>
            <th>Wachttrij</th>
            </tr>";

        while($row = $result->fetch_assoc()) {
          echo "<tr><td>" . $row["id"]. "</td>";
          echo "<td>" . $row["host"] . "</td>";
          echo "<td>". $row["ip"]. "</td>";
          echo "<td>" . $row["gateway"]. "</td>";
          echo "<td>". $row["netmask"]. "</td>";
          echo "<td>". $row["dns"]. "</td>";
          echo "<td>". $row["netwerk"]. "</td>";
          echo "<td>". $row["date"]. "</td>";     
          echo "<td><a href=\"/sending/sending/wachtrij.php?id=".$row['id']."\">Wachtrij</a>";
        }
   } else {
     echo "Nog geen players afgerond";
   }
   $conn->close();
   ?>  
</div>
</body>
</html>