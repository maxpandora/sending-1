<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>
<body>
<?php
    include 'navbari.php';
    include('database.php');  
    $username = $_POST['username'];  
    $password = $_POST['password'];  
      
        //to prevent from mysqli injection  
        $username = stripcslashes($username);  
        $password = stripcslashes($password);  
        $username = mysqli_real_escape_string($conn, $username);  
        $password = mysqli_real_escape_string($conn, $password);  
      
        $sql = "select * from users where username = '$username' and password = '$password'";  
        $result = mysqli_query($conn, $sql);  
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);  

        $count = mysqli_num_rows($result);  
          
        if($count == 1){  
            echo "<h1> <center> hey $username!<BR> Login successful </center></h1>";  
            $login = $_SESSION['username'] = $username;
            echo $login;
        }  
        else{  
            echo "<h1><ce Login failed. Invalid username or password.</h1>";  
        }     
?>  
</body>
</html>
