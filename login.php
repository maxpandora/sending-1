<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="stylesheet.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
    <?php require_once 'navbari.php';?>
</div>
</head>  
<div class="form-div">
            <form action="loginscript.php" method="post" class="login-form">
              <h1>Log-in</h1>
  
                  
        <input type="text" name="username"    class="form-control"      placeholder="username"                    required>
        <input type="password" name="password"     class="form-control"      placeholder="password"   required>
            
         <!-- <a href="forgotpassword">Wachtwoord vergeten?</a> -->
        <input type="submit" class="btn" name="submit" value="Login"></form>
        </select>
        <a href="createaccount.php">Geen account? <I>registreer hier</I></a>
            <BR><BR>
            <?php
            if(!$_GET){ 
            }else{
            if($taken = $_GET['message']){
                echo "<H3 class='success-msg'>".$taken."</H3>";
            }} ?>
 </div>       
    
</body>
</html>