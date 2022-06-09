<?php
include 'required.php';
if(isset($_POST['submit']))

{    
//mysqli_REAL_ESCAPE is om SQL INJECTIONS TE ESCAPEN!
     $username = mysqli_real_escape_string($conn, $_POST['username']);
     $password = mysqli_real_escape_string($conn, $_POST['password']);
     $email = mysqli_real_escape_string($conn, $_POST['email']);

     $sql = "INSERT INTO `users`(`username`, `password`, `email`) 
                          VALUES ('$username','$password','$email')";

     
}
if ($conn->query($sql) === TRUE) {
    $home;
    exit;
} else {
  }
  