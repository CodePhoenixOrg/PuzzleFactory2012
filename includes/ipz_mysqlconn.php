<?php
define("CONNECT", "connect");
define("DISCONNECT", "disconnect");

function connection($c, $d, $cs = null)
{
    $host="mysql";
    $user="root";
    $passwd="demo";
    $dbname=$d;

    try {
        if ($c == CONNECT) {
            $cs = new mysqli($host, $user, $passwd, $dbname);
            $cs->set_charset("utf8");
        } elseif ($c == DISCONNECT && $cs !== null) {
            $cs->close();
        }   
            
    }
    catch(\Exception $ex) {
        die("Connection failed");
    }
    return $cs;
}
