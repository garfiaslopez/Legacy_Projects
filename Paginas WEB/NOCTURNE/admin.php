<?php session_start();
include("php/login.php");?>
<html>
<head>
  <meta charset="UTF-8">
	<title>Nocturne Admin</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-theme.min.css"> 
  <link rel="stylesheet" type="text/css" href="css/signin.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<body> 

	<div id="bar" class="navbar navbar-color navbar-fixed-top" role="navigation">
    	<div class="container-fluid">
    		<div class="navbar-header">
    			<!--icono-->
          <div align="center" id="tex">
              <h4>Nocturne Admin</h4>
          </div>
      		</div>
      		<div class="navbar-collapse collapse">

            </div>	
  		</div>
  	</div>

    
  <div id="iniciar" class="container">
    <form method = "POST" class="form-signin" role="form">
      <h2 class="form-signin-heading" align="center">Bienvenido</h2>
      <input name="username" type="text" class="form-control" placeholder="Usuario" required autofocus>
      <input name="password" type="password" class="form-control" placeholder="Contraseña" required>
      <button name = "submit" class="btn btn-lg btn-primary btn-block" type="submit">Iniciar Sesion</button>
    </form>
  </div>

</body>
</html>