<?php

$db_host = "localhost";
$db_username = "fermunozroot";
$db_pass = "a8779402294F";
$db_name = "Nocturne";
$db_table= "LoginUsers";
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
if (isset ($_POST['submit'])) 
{
	$user = $_POST['username'];
	$pass = $_POST['password'];

	if(empty($user) || empty($pass))
	{	
		//echo "<html> \r\n Missing Information \r\n </html>";
	}
	else
	{
		$user = strip_tags($user);
		$user= $db->real_escape_string($user);
		$pass = strip_tags($pass);
		$pass = $db->real_escape_string($pass);
		$pass = md5($pass);
		$result = mysqli_query($db,"SELECT id, name FROM $db_table WHERE name='$user' AND pass='$pass'");
		$row_cont = mysqli_num_rows($result);

		if($row_cont == 1)
		{
			//echo "USUARIO EXISTENTE";
			while ($row = $result->fetch_object()) 
			{


				$_SESSION['id'] = $row->id;

			}
			//echo("<script>location.href = '../admin/pages/adminInicio.html';</script>");
			header('location: pages/adminInicio.php');
			exit();
		}
		else
		{
			//echo "USUARIO INCORRECTO";
		}
	}
}
else
{
	//echo "ISNOTSET POST SUBMIT";
}?>