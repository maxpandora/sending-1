<?php
    require "database.php";
    
    $createtable = "CREATE TABLE pakket (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    host VARCHAR(30) NOT NULL,
    ip VARCHAR(30) NOT NULL,
    gateway VARCHAR(30) NOT NULL,
    netmask VARCHAR(30) NOT NULL,
    dns VARCHAR(30) NOT NULL,
    netwerk VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    afgerond SMALLINT(1) NOT NULL)";

if ($conn->query($createtable) === TRUE) {
    header("location: /sending/sending/index.php");
} else {
    echo "Error creating table: " . $conn->error;
  }
  
  $conn->close();
?>