<?php 
function dbconnection($a="") { 
	$host="http://phpmyadmin.free.fr";
	$user="akades";
	$passwd="25643152";
	if($a=="connect") {
		$myconn=mysqli_pconnect($host, $user, $passwd);
		if($myconn) {
			echo "succeeded\n";
		}
		else
			echo "failed\n";
	}
	else if($a=="disconnect") {
		$myconn=mysqli_pconnect($host, $user, $passwd);
		mysqli_close($myconn);
	}
}
?>
		
