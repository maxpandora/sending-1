<?php
include 'navbari.php';
unset($_SESSION["username"]);
header("location: /sending/index.php");
?>