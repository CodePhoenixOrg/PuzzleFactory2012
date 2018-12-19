<html><head><meta http-equiv="content-type" content="text/html; charset=UTF-8"></head><body><pre>
<?php 
	include("./openconn.php");
	$cnx=dbconnection("connect");
	if(isset($_GET["d"])) $d=$_GET["d"]; else $d="mysql";
	if(isset($_GET["q"])) $q=$_GET["q"];
	mysqli_select_db($d, $cnx) or die(mysqli_error());
 	$sql=urldecode($q);
	$result=mysqli_query($sql, $cnx) or die(mysqli_error());
	if($result) {
		$i=mysqli_num_fields($result);
		$k=0;

		// Get recordset field names
		$line="";
		if(isset($_GET["rc"])) {
			$p=strpos($sql, "limit");
			$sql2=$sql;
			if($p>0) $sql2=substr($sql,0,$p-1);
			$result2=mysqli_query($sql2);
			$line=mysqli_num_rows($result2);
		}
		
		echo $line . "\r\n";
		$line="";
		for($j=0; $j<$i; $j++) {
			$fieldname=mysqli_field_name($result, $j);
			if (strpos($fieldname, " ")==0)
				$line=$line . $fieldname . ",";
			else
				$line=$line . "\"" . $fieldname . "\"" . ",";
		}
		$line=substr($line, 0, strlen($line)-1);
		echo $line . "\r\n";

		// Get recordset field sizes
		$line="";
		for($j=0; $j<$i; $j++)
			$line=$line . mysqli_field_len($result, $j) . ",";
		$line=substr($line, 0, strlen($line)-1);
		echo $line . "\r\n";

		// Get recordset field types
		$line="";
		for($j=0; $j<$i; $j++)
			$line=$line . mysqli_field_type($result, $j) . ",";
		$line=substr($line, 0, strlen($line)-1);
		echo $line . "\r\n";

		// Get recordset data rows
		while($rows=mysqli_fetch_array($result)) {
			//echo $k . "=";
			$line="";
			for($j=0; $j<$i; $j++) {
				//$line=$line . "\"" . $rows[$j] . "\"" . ",";
				$line=$line . $rows[$j] . "|";
			}
			$line=substr($line, 0, strlen($line)-1);
			echo $line . "\r\n";
			$k++;
		}
		mysqli_free_result($result);
	}
?>
</pre></body></html>
