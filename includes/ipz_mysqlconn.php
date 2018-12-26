<?php
define("CONNECT", "connect");
define("DISCONNECT", "disconnect");

function connection($c, $d)
{
    $host="mysql";
    $user="root";
    $passwd="demo";
    $dbname=$d;

    $myconn=mysqli_connect($host, $user, $passwd) or die("Connection failed");
    if ($c == CONNECT) {
        mysqli_select_db($myconn, $dbname);
		mysqli_set_charset($myconn,"utf8");
    } elseif ($c == DISCONNECT) {
        mysqli_close($myconn);
    }
    return $myconn;
}
