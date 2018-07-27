<?php session_start();
include("../php/CheckSession.php"); 
include("../php/Publicidad.php");
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


    <script type="text/javascript">

      function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#anadir')
                    .attr('src', e.target.result)
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    </script>

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
                  <li class="active"><a href="../pages/adminPublicidad.php"><i class="fa fa-file-image-o"></i><span>  Publicidad</span></a></li>
                  <li><a href="../pages/adminBanners.php"><i class="fa fa-bookmark-o"></i><span>  Banners</span></a></li>
                  <li><a href="../pages/adminEventos.php"><i class="fa fa-image"></i><span>  Eventos</span></a></li>
                  <li><a href="../pages/adminGaleria.php"><i class="fa fa-book"></i><span>  Galeria</span></a></li>
                  <li><a href="../pages/adminNoticias.php"><i class="fa fa-file-text-o"></i><span>  Noticias</span></a></li>
                  <li><a href="../pages/adminRevista.php"><i class="fa fa-file-pdf-o"></i><span>  Cargar Revista</span></a></li>
                  <li><a href="../pages/adminConfig.php"><i class="fa fa-cog"></i><span>  Configurar</span></a></li>
                  <li><a href="../php/CloseSession.php"><i class="fa fa-sign-out"></i><span>  Cerrar Sesión</span></a></li>



          			</ul>
          		</div>
			</div>
			<div class="col-md-9">
				<!--contenido-->

          		<div class="row placeholders" valing="middle">

            		<div class="col-md-5">
            			<h1 class="page-header" align="center">Cargar Publicidad</h1>

             			<form id="subir" name="subir" method="POST" enctype="multipart/form-data">
            					<h4 align="left">Ingresar Imagen:</h4>
            					<p></p>
                      <img id="anadir" src="../img/upload_foto.png" class="img-responsive" alt="Responsive image">
            					<p></p>
                      <input id="imagen" name="imagen" type="file" onchange="readURL(this);" />  
                      <p></p>
                      <input id="enlace" name="enlace" type="enlace" class="form-control" placeholder="URL ">
          						<p></p>
          						<button name="submit" type="cargar" class="btn btn-primary btn-md" value="Cargar">Cargar</button>
          						<p></p>
            			</form>
            		</div>


                <div class="col-md-2">
                  
                </div>
            		

                <div class="col-md-5">
              			<h1 class="page-header" align="center">Publicidad Reciente</h1>
              			
                    <form method="POST" enctype="multipart/form-data">
                      

                    <div class="container">
              				<div class="row">
              					<div class="col-md-3">
              						<h4>Marque lo que desea eliminar</h4>
              						<p></p>
              					</div>


              					<div class="col-md-3">
              						<button name="eliminar" type="eliminar" class="btn btn-primary btn-md" value="Eliminar">Eliminar</button>
              					</div>
              				</div>
              			</div>


                    <?php 
                      include("../php/GetPublicidad.php"); 

                      if ($query) 
                      {
                        while ($row = $query->fetch_object()) {
                      
                    ?>


              			<div class="container">



              				<div class="row">
              					<div class="col-md-1">
              						<label id="check" class="checkbox">

        								    <input type="checkbox" name="checkimag[]" value= "<?php echo $row->id; ?>">

    								      </label>
    							      </div>
    							     <div class="col-md-11">

    								  <img id="publicidad" src= "<?php echo $row->foto;?>" >

    							  </div>

                    <?php 
                      }
                    }
                    else
                    {

                    }

                    $db->close();

                    ?>
                    </form>


    						</div>
    					</div>
            		</div>
         		</div>	
			</div>
		</div>
	</div>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
  	<script src="../js/bootstrap.min.js"></script>
  	<script src="../js/offcanvas.js"></script>

</body>
</html>