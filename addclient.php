<?php

require 'app/database.php';
    
$id = $_GET['id'];

// Retrieve the data from the "pakket" table
$sql = "SELECT id, host, ether, ip, gateway, netmask, dns, netwerk, email, data, finished, userId FROM pakket WHERE id = ?";

// Bind the id parameter to the query
$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "i", $id);

// Execute the query
mysqli_stmt_execute($stmt);

// Bind the result variables
mysqli_stmt_bind_result($stmt, $id, $host, $ether, $ip, $gateway, $netmask, $dns, $netwerk, $email, $data, $finished, $userId);

// Fetch the result
mysqli_stmt_fetch($stmt);

// Insert the data into the "screens" table
$sql = "INSERT INTO screens (name, ip, userId) VALUES ($host, $ip, $userId)";

// Bind the parameters to the query
$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "ssi", $host, $ip, $userId);

// Execute the query
mysqli_stmt_execute($stmt); 
?>