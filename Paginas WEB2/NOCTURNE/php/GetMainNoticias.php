<?php

$db_host = "localhost";
$db_username = "fermunozroot";
$db_pass = "a8779402294F";
$db_name = "Nocturne";
$db_table= "Noticias";

//DatabaseConnection:
$db = mysqli_connect($db_host,$db_username,$db_pass,$db_name);
// Check connection
if (mysqli_connect_errno())
{
	//echo "Failed to connect to MySQL: " . mysqli_connect_error();
}else
{
	//echo "<html> \r\n successfully connection \r\n </html>";
}

//Todas las filas de la tabla:
$filas = $db->query("SELECT * FROM $db_table");
//Numero de noticias por pagina:
$num_noticias = 5;
//Numero de paginas que se crearan:
$paginas = ceil($filas->num_rows/$num_noticias);

//Obtener el numero de la pagina actual:

if (isset($_GET['p']) && is_numeric($_GET['p']) && $_GET['p'] < 10000000000000000000) {

	if ($_GET['p'] > $paginas) {

		$pageActual = 1;	

	}else
	{
		$pageActual = $_GET['p'];
	}

}
else
{
	$pageActual = 1;
}

if ($pageActual <= 0) {
	$inicio = 0;
}
else{

	$inicio = $pageActual * $num_noticias - $num_noticias;
}

$atras = $pageActual - 1;
$adelante = $pageActual + 1;


//UPDATE:..!!!!  [WARNING];
//Botonces por pagina..... checar si son mas del limite hacer otra barra de menu de botones .... //





$query = $db->query("SELECT * FROM $db_table ORDER BY id DESC LIMIT $inicio, $num_noticias");



?>