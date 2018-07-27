<?php session_start();
include("../php/CheckSession.php"); ?>
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
                  <li class="active"><a href="../pages/adminEventos.php"><i class="fa fa-image"></i><span>  Eventos</span></a></li>
                  <li><a href="../pages/adminNoticias.php"><i class="fa fa-file-text-o"></i><span>  Noticias</span></a></li>
                  <li><a href="../pages/adminRevista.php"><i class="fa fa-file-pdf-o"></i><span>  Cargar Revista</span></a></li>
                  <li><a href="../pages/adminConfig.php"><i class="fa fa-cog"></i><span>  Configurar</span></a></li>
                  <li><a href="../php/CloseSession.php"><i class="fa fa-sign-out"></i><span>  Cerrar Sesión</span></a></li>



          </ul>
        </div>
			</div>
			<div class="col-md-9">
				<!--contenido-->          		
        <div align="center" class="container">
          <div class="row featurette">
            <div class="col-md-1">
              
            </div>
            <div class="col-md-9">
              <h1 id="" class="page-header" align="center">Titulo</h1>
              <form id="subir" name="subir" method="POST">
                <img id="anadir" src="../img/añadir.jpg">
                <p></p>
                <input id="imgsubir" name="publicidad" type="file"/>  
                <p></p>
                <input id="evento" name="titulo" type="titulo" class="form-control" placeholder="Titulo de la Noticia" required autofocus>
                <p></p>
                <textarea id="descripcion" name="descripcion" type="descripcion" class="form-control" rows="3" placeholder="Descripción" required
                autofocus></textarea>
                <p></p>
                <div class="row">
                  <div class="col-xs-4">
                    <div align="left">
                    	<button name="eliminar" type="eliminar" class="btn btn-danger btn-md" value="Eliminar">Eliminar Evento</button>
                    </div>
                  </div>
                  <div class="col-xs-4">
                    <div align="center">
                      <button name="activar" type="activar" class="btn btn-success btn-md" value="Activar">Activar Evento</button>
                     </div>
                  </div>
                  <div class="col-xs-4">
                    <div align="right">
                      <button name="guardar" type="guardar" class="btn btn-primary btn-md" value="Guardar">Guardar Evento</button>
                     </div>
                  </div>
                </div>
                <p></p>
              </form>
            </div>
          </div>
        </div>
			</div>
		</div>
	</div>

</body>
</html>