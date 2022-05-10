<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>verstuurde pakjes</title>
<link rel="stylesheet" href="stylesheet.css">

<body>
<div class="column">
<?php
    $servername='localhost';
    $username='root';
    $password='';
    $dbname = "sending";
    $conn=mysqli_connect($servername,$username,$password,"$dbname");
      if(!$conn){
          die('Could not Connect MySql Server:' .mysql_error());
        }
        





   $sql = "SELECT * FROM `pakket` WHERE 1";
   $result = $conn->query($sql);
   
   if ($result->num_rows > 0) {
     // output data of each row
     while($row = $result->fetch_assoc()) {
       echo "<b>id:</b>" . $row["id"]. " - <B>Name:</B> " . $row["host"].  "<B> IP:</B>" . $row["ip"]. "". "<B> gateway:</B> " . $row["gateway"]. "". "<B> netmask:</B> " . $row["netmask"]. "". "<B> DNS:</B>" . $row["dns"].  " <B>Datum</b> " . $row["date"].  "<BR>";
     }
   } else {
     echo "0 results";
   }
   $conn->close();
   ?>  
</div> 


            <div class="row">
                <div class="col-md-12">
                    <div class="page-header">
                        <h2>Invoeren player</h2>
                    </div>                        
                    <div class="form-group">
                    <form action="insert.php" method="post">
                            
                            <input type="text" name="host" class="form-control" placeholder="Hostname">         
                            <input type="text" name="ip" class="form-control"  placeholder="Ip adres">
                            <input type="text" name="gateway" class="form-control" placeholder="Gateway">                                                
                            <input type="text" name="netmask" class="form-control" placeholder="Netmask">                    
                            <input type="text" name="dns" class="form-control" placeholder="DNS Server">
                            <label></label  placeholder="DHCP OF STATIC">
                            <select name="netwerk">
                            <option type="text" name="netwerk" value="DHCP">DHCP</option>
                            <option type="text" name="netwerk" value="Static">Static</option>
                        </select>
                       
                        <input type="submit" class="btn btn-primary" name="submit" value="Submit">
                    </div>       
                </div>
            </div></div>
</body>
</html>



