<?php 	$f="openconn.php";	if (file_exists($f)) unlink($f);	$myfile=fopen($f,"w");		fwrite($myfile,"<?php \nfunction dbconnection(\$a=\"\") { \n	\$host=\"" . $h . "\";\n	\$user=\"" . $u . "\";\n	\$passwd=\"" . $p . "\";\n	if(\$a==\"connect\") {\n		\$myconn=mysql_pconnect(\$host, \$user, \$passwd);\n		if(\$myconn) {\n			echo \"succeeded\\n\";\n		}\n		else\n			echo \"failed\\n\";\n	}\n	else if(\$a==\"disconnect\") {\n		\$myconn=mysql_pconnect(\$host, \$user, \$passwd);\n		mysql_close(\$myconn);\n	}\n}\n?>\n		");	fclose($myfile);?>
