<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Wachtrij</title>
<link rel="stylesheet" href="stylesheet.css">
<?php require_once 'navbar.php';?>
<body>
  <div class="div-1">
  <h1>Wachtrij players</h1>
<?php

    $servername='localhost';
    $username='root';
    $password='';
    $dbname = "sending";
    $conn=mysqli_connect($servername,$username,$password,"$dbname");
      if(!$conn){
          die('Could not Connect MySql Server:' .mysql_error());
        }
        




   $sql = "SELECT * FROM `pakket` WHERE `afgerond` = 1";
   $result = $conn->query($sql);
   
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
            <th>Actie</th>
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
          echo "<td><a href=\"/sending/sending/delete.php?id=".$row['id']."\">Afgerond</a></td>";
             }
   } else {
     echo "Nog geen players in de wachtrij";
   }
   $conn->close();
   ?>  
</div>

            <div class="div-2">

                    <div class="form-div">
                        <h1>Voeg player Toe</h1>
                                     
                    <div class="form-group">
                    <form action="insert.php" method="post" class="form_1">
                            
                            <input type="text" name="host" class="form-control" placeholder="Hostname" required>         
                            <input type="text" name="ip" class="form-control"  placeholder="Ip adres" required>
                            <input type="text" name="gateway" class="form-control" placeholder="Gateway" required>                                                
                            <input type="text" name="netmask" class="form-control" placeholder="Netmask" required>                    
                            <input type="text" name="dns" class="form-control" placeholder="DNS Server" required>
                            <BR> <BR>
                            <label></label  placeholder="DHCP OF STATIC">
                            <select name="netwerk"> 
                            <option type="text" name="netwerk" value="DHCP">DHCP</option>
                            <option type="text" name="netwerk" value="Static">Static</option><a>     </a> <input type="submit" class="btn" name="submit" value="Submit"></form>
                        </select>
                        <BR>  <BR>
                        
                    </div>       
                    </div>    
            </div></div>
            </th></table>
</body>
</html>



