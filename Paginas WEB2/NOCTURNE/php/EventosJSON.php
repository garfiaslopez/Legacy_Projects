<?php
mysql_pconnect("localhost", "fermunozroot", "a8779402294F") or die("Could not connect");
mysql_select_db("Nocturne") or die("Could not select database");


$rs = mysql_query("SELECT * FROM Eventos ORDER BY start ASC");
$arr = array();

while($obj = mysql_fetch_object($rs)) {
$arr[] = $obj;
}
echo json_encode($arr);
?>

