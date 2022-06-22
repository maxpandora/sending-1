<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="stylesheet.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <?php require_once 'navbari.php';?>

</head>  <div class="div-2">
         <div class="form-div">
              <h1>Registreer</h1>
                           
          <div class="form-group">
          <form action="register.php" method="post" class="form_1">
                  
             <input type="text" name="username"    class="form-control"      placeholder="username"                    required>
            <input type="password" name="password"     class="form-control"      placeholder="password"  minlength="4"   required>
            <input type="email" name="email"     class="form-control"      placeholder="email"  minlength="7"   required>

            
         <input type="submit" class="btn" name="submit" value="Register"></form>
          </select>
          <?php 
            if(!$_GET){ 
            }else{
            if($taken = $_GET['message']){
                echo "<H3 class='error_not'>".$taken."</H3>";
            }}
  
          ?>
              <BR>  <BR>
              
          </div>       
          </div>    
  </div></div>
  </th></table>

</body>
</html>