<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finished</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <?php 
    require_once 'navbar.php';
    ?>
    <div id="wrapper">
      <div class="div-1">
  <h1>Finished</h1>
<?php
// Connect to database 
    include 'app/database.php';
        


// MYSQL query
   $sql2 = "SELECT * FROM `pakket` WHERE `finished` = 1";
   $result = $conn->query($sql2);
   
   if ($result->num_rows > 0) {
     // If data is set on finished = 1 show these rows
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
          echo "<td><a href=\"/sending/app/queue.php?id=".$row['id']."\">queue</a>";
          {
            if(isset($_SESSION['username'])) {
              echo "<td><a href=\"/sending/app/erase.php?id=".$row['id']."\"> <button>X</button></a>";
            } 
              }
        }
   } else {
     echo "Nog geen players finished";
   }
   $conn->close();
   ?>  
</div></div>
</body>
</html>