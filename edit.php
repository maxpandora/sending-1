<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    
    <title>Bewerk</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
    <?php 
    include_once 'navbari.php';
    include 'database.php';
    



    $id = $_GET['id'];
    $gethost = mysqli_query($conn, "SELECT host FROM pakket WHERE id= $id") ;


    $sql = "SELECT id,
                   host,
                   ip,
                   gateway,
                   netmask,
                   dns, 
                   netwerk,
                   date 
                   FROM pakket WHERE id='$id'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {


echo "<h2> Je kunt nu de gegevens van <U>" . $row["host"] ."</U> aanpassen. <BR>aangemaakt op: " . $row["date"]. "</h2>"; 
echo "<div class='form-group'> <form action='update.php?id=".$id."' method='post' class='form_1'>";
?>
        
        <input type="text" name="host"     class="form-control"  value="<?php echo $row["host"];?>"                     required>         
        <input type="text" name="ip"       class="form-control"  value="<?php echo $row["ip"];?>"        minlength="7"  required>
        <input type="text" name="gateway"  class="form-control"  value="<?php echo $row["gateway"];?>"   minlength="7"  required>                                                
        <input type="text" name="netmask"  class="form-control"  value="<?php echo $row["netmask"];?>"   minlength="7"  required>                    
        <input type="text" name="dns"      class="form-control"  value="<?php echo $row["dns"];?>"       minlength="7"  required>
        <BR> <BR>
        <label></label  placeholder="DHCP OF STATIC">
        <select name="netwerk"> 
        <option type="text" name="netwerk" value="<?php echo $row["netwerk"];?>" >DHCP</option>
        <option type="text" name="netwerk" value="DHCP">DHCP</option>
        <option type="text" name="netwerk" value="Static">Static</option><a>     
            
        </a> <input type="submit" class="btn" name="submit" value="Submit"></form>
    </select>
    <BR>  <BR>

</div></div>
</th></form>
</body>
<?php }
} else {
    header('Location: index.php');
}
?>

</html>