<?php

// Connect to the database
$db = mysqli_connect('localhost', 'root', '', 'sending');

// Check connection
if (mysqli_connect_errno()) {
  exit('Connect failed: '. mysqli_connect_error());
}
$id = $_GET['id'];

// Get the data from the pakket table
$sql = "SELECT * FROM pakket WHERE id = $id;
$stmt = mysqli_prepare($db, $sql);
mysqli_stmt_bind_param($stmt, "i", $id); // Bind $id as an integer
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$row = mysqli_fetch_assoc($result);

// Insert the data into the users table
$sql = "INSERT INTO screens (isDefault, name, col3) VALUES (?, ?, ?)";
$stmt = mysqli_prepare($db, $sql);
mysqli_stmt_bind_param($stmt, "isi", $row['col1'], $row['col2'], $row['col3']); // Bind values as appropriate data types
mysqli_stmt_execute($stmt);

// Close the connection
mysqli_close($db);

?>
