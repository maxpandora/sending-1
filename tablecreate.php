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
    
    $createusers = CREATE TABLE `test`.`users` ( `id` INT(255) NOT NULL AUTO_INCREMENT , `username` VARCHAR(50) NOT NULL , `password` VARCHAR(50) NOT NULL , `email` VARCHAR(50) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

if ($conn->query($createtable . $createusers) === TRUE) {
    header("location: /sending/index.php");
} else {
    echo "Error creating table: " . $conn->error;
  }
  
  $conn->close();
?>