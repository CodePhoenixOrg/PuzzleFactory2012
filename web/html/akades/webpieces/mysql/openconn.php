<?php 
function dbconnection($a="") {
	$host="localhost";
	$user="akades";
	$passwd="25643152";
		if($a=="connect") {
		$myconn=mysqli_connect($host, $user, $passwd) or die(mysqli_error());
			if($myconn) {
				echo "succeeded\n";
			} else {
				echo "failed\n";
			}
		} else if($a=="disconnect") {
			$myconn=mysqli_connect($host, $user, $passwd) or die(mysqli_error());
			mysqli_close($myconn);
		}
		return $myconn;
	}
?>
