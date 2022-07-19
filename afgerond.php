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
    require_once 'navbari.php';
    ?>
      <div class="div-1">
  <h1>Afgerond</h1>
<?php
// Connect to database 
require 'database.php';
        


// MYSQL query
   $sql2 = "SELECT * FROM `pakket` WHERE `afgerond` = 1";
   $result = $conn->query($sql2);
   
   if ($result->num_rows > 0) {
     // If data is set on afgerond = 1 show these rows
      echo "
            <table class='data-table'><tr>
            <th>Id</th>
            <th>Name</th>
            <th>Ether</th>
            <th>Ip</th>
            <th>Gateway</th>
            <th>Netmask</th>
            <th>Dns</th>
            <th>DHCP/STATIC</th>
            <th>Datum</th>
            <th>Wachttrij</th>"; 
            
            if(isset($_SESSION['username'])) {
              echo "<th>actie</th> </tr>";
            } 
    
           
//inside the table these data's need to be shown
        while($row = $result->fetch_assoc()) {
          echo "<tr><td>" . $row["id"]. "</td>";
          echo "<td>" . $row["host"] . "</td>";
          echo "<td>" . $row["ether"] . "</td>";
          echo "<td>". $row["ip"]. "</td>";
          echo "<td>" . $row["gateway"]. "</td>";
          echo "<td>". $row["netmask"]. "</td>";
          echo "<td>". $row["dns"]. "</td>";
          echo "<td>". $row["netwerk"]. "</td>";
          echo "<td>". $row["date"]. "</td>";     
          echo "<td><a href=\"/sending/wachtrij.php?id=".$row['id']."\">Wachtrij</a>";
          {
            if(isset($_SESSION['username'])) {
              echo "<td><a href=\"/sending/erase.php?id=".$row['id']."\"> <button>X</button></a>";
            } 
              }
        }
   } else {
     echo "Nog geen players afgerond";
   }
   $conn->close();
   ?>  
</div>
</body>
</html>