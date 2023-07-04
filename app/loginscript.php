<?php
include 'database.php';
session_start();

$username = $_POST['username'];
$password = md5($_POST['password']);

// To prevent SQL injection
$username = stripcslashes($username);
$username = mysqli_real_escape_string($conn, $username);

$sql = "SELECT * FROM login WHERE username = '$username' AND password = '$password'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
$count = mysqli_num_rows($result);

if ($count == 1) {
    $_SESSION['username'] = $username;
    header("location: ../index.php");
    exit(); // Important to exit after redirecting
} else {
    $loginfail = "Gebruikersnaam of wachtwoord onjuist";
    header("location: ../login.php?error=" . $loginfail);
    exit(); // Important to exit after redirecting
}