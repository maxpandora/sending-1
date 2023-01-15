<?php
include 'database.php';
if(isset($_POST['submit']))

{    
//insert into mysql 
$username = $_POST['username'];
$password = $_POST['password'];
$password = md5($password);

$email = $_POST['email'];
$usertype = $_POST['usertype'];

$stmt = $conn->prepare("INSERT INTO login (username, password, email, usertype) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $username, $password, $email, $usertype);
$stmt->execute();

$home = header("location: /sending/login.php");

}



?>

?>