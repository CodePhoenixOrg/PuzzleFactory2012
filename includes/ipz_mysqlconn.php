<?php
define("CONNECT", "connect");
define("DISCONNECT", "disconnect");

function connection($c="", $d="") { 
	$host="mysql";
	$user="root";
	$passwd="demo";
	$dbname=$d;

	$myconn=mysqli_connect($host, $user, $passwd) or die("Connection failed");
	if($c=="connect") 
		mysqli_select_db($myconn, $dbname);
	else if($c=="disconnect") 
		mysqli_close($myconn);
	
	return $myconn;
}
?>
