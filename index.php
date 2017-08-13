<?php
	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db = 'nsp';
	$con;
        
        $db = mysqli_connect($host,$user,$pass,$db);
        $var = $db->query("SELECT * FROM nurse")or die($db->error);
        print_r($var->fetch_all(MYSQLI_ASSOC));

        
        
$time = microtime(true) - $_SERVER["REQUEST_TIME_FLOAT"];
echo "Process Time: $time";
?>