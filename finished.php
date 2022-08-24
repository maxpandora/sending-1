<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deleted</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <?php 
    include 'navbar.php';
    ?>
    <div id="wrapper">
      <div class="div-1">
  <h1>Van wapenlijst af</h1>
<?php
// Connect to database 
    include 'app/database.php';
        


// MYSQL query
   $sql2 = "SELECT * FROM `wapenlijst` WHERE `finished` = 1";
   $result = $conn->query($sql2);
   
   if ($result->num_rows > 0) {
     // If data is set on Van wapenlijst af = 1 show these rows
      echo "
            <table class='data-table'><tr>
            <th>SteamID</th>       
            <th>Discord ID</th>         
            <th>Wapen</th>
            <th>Actie</th>
          "; 
            
            if(isset($_SESSION['username'])) {
              echo "<th>actie</th> </tr>";
            } 
    
           
//inside the table these data's need to be shown
        while($row = $result->fetch_assoc()) {
          echo "<tr>";
          echo "<td>" . $row["host"] . "</td>";
          echo "<td>" . $row["ether"] . "</td>";
          echo "<td>". $row["netwerk"]. "</td>";
          echo "<td><a href=\"/sending/app/queue.php?id=".$row['id']."\">Refund</a>";
          {
            if(isset($_SESSION['username'])) {
              echo "<td><a href=\"/sending/app/erase.php?id=".$row['id']."\"> <button>X</button></a>";
            } 
              }
        }
   } else {
     echo "Nog geen mensen van de wapenlijst af";
   }
   $conn->close();
   ?>  
</div></div>
</body>
</html>