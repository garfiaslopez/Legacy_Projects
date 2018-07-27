<?php session_start();
include("../php/CheckSession.php"); 
include("../php/Usuarios.php");
?>


<html>
<head>
	<meta charset="UTF-8">
	<title>Nocturne Admin</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/offcanvas.css">
    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/AdminLTE.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div id="bar" class="navbar navbar-color navbar-fixed-top" role="navigation">
    	<div class="container-fluid">
        	<div class="navbar-header">
          		<a id="titulo" class="navbar-brand">Nocturne Admin	
                </a>
                <p id="togle" class="pull-right visible-xs">
           			<button id="fondo" type="button" class="btn btn-color btn-sm" data-toggle="offcanvas"><i class="fa fa-bars"></i></button>
         		</p>		
          	</div>
        </div>
    </div>
	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-left">
			<div class="col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">
				<div id="barra" class="container">
					<ul class="nav nav-sidebar">

              <li><a href="../pages/adminInicio.php"><i class="fa fa-calendar"></i><span>   Agenda</span></a></li>
              <li><a href="../pages/adminPublicidad.php"><i class="fa fa-file-image-o"></i><span>  Publicidad</span></a></li>
              <li><a href="../pages/adminBanners.php"><i class="fa fa-bookmark-o"></i><span>  Banners</span></a></li>
              <li><a href="../pages/adminEventos.php"><i class="fa fa-image"></i><span>  Eventos</span></a></li>
              <li><a href="../pages/adminGaleria.php"><i class="fa fa-book"></i><span>  Galeria</span></a></li>
              <li><a href="../pages/adminNoticias.php"><i class="fa fa-file-text-o"></i><span>  Noticias</span></a></li>
              <li><a href="../pages/adminRevista.php"><i class="fa fa-file-pdf-o"></i><span>  Cargar Revista</span></a></li>
              <li class="active"><a href="../pages/adminConfig.php"><i class="fa fa-cog"></i><span>  Configurar</span></a></li>
              <li><a href="../php/CloseSession.php"><i class="fa fa-sign-out"></i><span>  Cerrar Sesión</span></a></li>
      		</ul>
        </div>
			</div>



      <div class="col-md-9">
        <!--contenido-->              
            <div align="center" class="container">
              <div class="row featurette">
                  <div class="col-md-4">
                    <h1 class="page-header" align="center">Cambiar contraseña</h1>
                    

                    <form id="subir" name="subir" method="POST" enctype="multipart/form-data">

                      <input id="contravieja" name="contravieja" type="contravieja" class="form-control" placeholder="Vieja Contraseña" required autofocus>
                      <p></p>
                      <input id="newpass" name="newpass" type="newpass" class="form-control" placeholder="Nueva Contraseña" required autofocus>
                      <p></p>
                      <input id="repeat" name="repeat" type="repeat" class="form-control" placeholder="Repetir Contraseña" required autofocus>
                      <p></p>
                      <div align="right">
                        <button name="cambiar" type="cambiar" class="btn btn-primary btn-md" value="Cambiar">Cambiar</button>
                      </div>
                      <p></p>
                    </form>


                </div>


                <div class="col-md-2">
                  
                </div>
                <div class="col-md-4">
                    <h1 class="page-header" align="center">Nuevo Usuario</h1>
                    

                    <form id="subir" name="subir" method="POST" enctype="multipart/form-data">

                      <input id="nuevouser" name="nuevouser" type="nuevouser" class="form-control" placeholder="Nuevo Usuario" required autofocus>
                      <p></p>
                      <input id="contranueva" name="contranueva" type="contranueva" class="form-control" placeholder="Nueva Contraseña" required autofocus>
                      <p></p>
                      <input id="repetir" name="repetir" type="repetir" class="form-control" placeholder="Repetir Contraseña" required autofocus>
                      <p></p>
                      <div align="right">
                        <button name="nuevo" type="nuevo" class="btn btn-primary btn-md" value="nuevo">Agregar</button>
                      </div>
                      <p></p>
                    </form>

                    
                </div>
              </div>
          </div>
        <form id="eliminar" name="eliminar" method="POST" enctype="multipart/form-data">

          <h2 style="text-align: center;" class="sub-header">Mis usuarios: </h2>
            <div class="table-responsive">
              <table class="table table-striped">
                  <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Password</th>
                        <th>Accion</th>
                    </tr>
                  </thead>
                  <tbody>

                    <?php
                    include("../php/GetUsers.php");

                    if ($query) 
                    {
                      while ($row = $query->fetch_object()) {
                        
                    ?>
                      <tr>
                          <td><?php echo $row->name; ?></td>
                          <td><?php echo $row->pass; ?></td>
                          <td><p><button name="eliminar" type="eliminar" class="btn btn-xs btn-danger" value= <?php echo "\"" . $row->id ."\"" ;?>  >Eliminar</button></p></td>
                      </tr>

                  <?php
                      }
                    }
                  ?>


                  </tbody>
              </table>
          </div>
        </form>
    </div>
  </div>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
  	<script src="../js/bootstrap.min.js"></script>
  	<script src="../js/offcanvas.js"></script>
</body>
</html>