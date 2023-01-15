<?php
    require "database.php";
    
    // Multiple table create
    $createtable = "CREATE TABLE product (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(30) NOT NULL,
    productype VARCHAR(30) NOT NULL,
    gateway VARCHAR(30) NOT NULL, 
    netmask VARCHAR(30) NOT NULL,
    dns VARCHAR(30) NOT NULL,
    netwerk VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    finished SMALLINT(1) NOT NULL, 
    username VARCHAR(255))";
   
   $createlogin = "CREATE TABLE login (
        id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(30) NOT NULL,
        password VARCHAR(30) NOT NULL,
        email VARCHAR(30) NOT NULL)";
    
// add the table you want to create to the array
$tables = [$createtable, $createlogin];

// To use the array 1 by one use the foreach function 
foreach($tables as $k => $sqlcreatetables){
    $query = @$conn->query($sqlcreatetables);

    if(!$query)
    // If not working give this error
       $errors[] = "Table $k : Creation failed ($conn->error)";
    else
    // if working send the user back to the homepage
       $errors[] = "Table $k : Creation done";
       header("location: /sending/index.php"); 
} 
  $conn->close();
?>