<?php
$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'nsp';
$con;
       
$db = mysqli_connect($host,$user,$pass,$db);
$var = $db->query("SELECT * FROM nurse")or die($db->error);
$nurse = $var->fetch_all(MYSQLI_ASSOC);
$nurseId = [];
foreach ($nurse as $key => $value) {
    array_push($nurseId, $value['nurse_id']);
}
        print_r($nurseId);

        
        
$time = microtime(true) - $_SERVER["REQUEST_TIME_FLOAT"];
echo "Process Time: $time";
?>