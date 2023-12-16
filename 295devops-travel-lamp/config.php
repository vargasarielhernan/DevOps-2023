<?php
$dbHost     = "db"; 
$dbUsername = "codeuser"; 
$dbPassword = "test"; 
$dbName     = "devopstravel"; 
$conn = new mysqli($dbHost, $dbUsername, $dbPassword, $dbName); 
if ($conn->connect_error) { 
    die("Connection failed: " . $conn->connect_error); 
}
?>
