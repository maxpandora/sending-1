<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    
    <title>bewerk</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <?php 
    include_once 'navbari.php';
    include 'database.php';
    $id = $_GET['id'];

    $gethost = mysqli_query(string ,"SELECT `host` FROM `pakket` WHERE `id`= $id, LIMIT=1");
    echo $gethost;

     ?>


                 
<div class="form-group">
<form action="insert.php" method="post" class="form_1">
        
        <input type="text" name="host"     class="form-control"  value="<?php echo $gethost;?>"    required>         
        <input type="text" name="ip"       class="form-control"  placeholder="Ip adres"    required>
        <input type="text" name="gateway"  class="form-control"  placeholder="Gateway"     required>                                                
        <input type="text" name="netmask"  class="form-control"  placeholder="Netmask"     required>                    
        <input type="text" name="dns"      class="form-control"  placeholder="DNS Server"  required>
        <BR> <BR>
        <label></label  placeholder="DHCP OF STATIC">
        <select name="netwerk"> 
        <option type="text" name="netwerk" value="DHCP">DHCP</option>
        <option type="text" name="netwerk" value="Static">Static</option><a>     </a> <input type="submit" class="btn" name="submit" value="Submit"></form>
    </select>
    <BR>  <BR>

</div></div>
</th></form>
</body>
</html>