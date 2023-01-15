<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    
    <title>Bewerk</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>

    <?php 
    include_once 'navbar.php';
    include 'app/database.php';
    echo "<div class='form-div'>";


    $id = $_GET['id'];
    $getname = mysqli_query($conn, "SELECT name FROM product WHERE id= $id") ;


    $sql = "SELECT id,
                   name,
                   desc,
                   ip,
                   gateway,
                   netmask,
                   dns, 
                   netwerk,
                   date 
                   FROM product WHERE id='$id'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {


echo "<h5> Je kunt nu de gegevens van <U>" . $row["name"] ."</U> aanpassen. <BR>aangemaakt op: " . $row["date"]. "</h5>"; 
echo "<div class='form-group'> <form action='app/update.php?id=".$id."' method='post' class='form_1'>";
?>
        
        <input type="text" name="name"     class="form-control"  value="<?php echo $row["name"];?>"                     required>     
        <input type="text" name="desc"    class="form-control"  value="<?php echo $row["desc"];?>"      >    
        <input type="text" name="ip"       class="form-control"  value="<?php echo $row["ip"];?>"          >
        <input type="text" name="gateway"  class="form-control"  value="<?php echo $row["gateway"];?>"     >                                                
        <input type="text" name="netmask"  class="form-control"  value="<?php echo $row["netmask"];?>"     >                    
        <input type="text" name="dns"      class="form-control"  value="<?php echo $row["dns"];?>"         >
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
</th>
</form>

<?php }
} else {
    header('Location: index.php');
}
?>
</div>
</body>


</html>