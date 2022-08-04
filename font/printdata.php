<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>test</title>
</head>
<body>
<?php
include'database.php';
    session_start();
    $con = mysqli_connect("localhost","root","","phptutorials");
    
    if(isset($_POST['stud_delete_multiple_btn']))
    {
        $all_id = $_POST['stud_delete_id'];
        $extract_id = implode(',' , $all_id);
        // echo $extract_id;
    
        $query = "DELETE FROM student WHERE id IN($extract_id) ";
        $query_run = mysqli_query($con, $query);
    
        if($query_run)
        {
            $_SESSION['status'] = "Multiple Data Deleted Successfully";
            header("Location: index.php");
        }
        else
        {
            $_SESSION['status'] = "Multiple Data Not Deleted";
            header("Location: index.php");
        }
    }
  print ="test";
?>
</body>
</html>
