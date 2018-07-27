<?php session_start();
include("../php/CheckSession.php");
include("../php/Noticias.php");?>

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

    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="../js/jquery-ui-1.10.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/offcanvas.js"></script>
    <script type="text/javascript" src="../js/tinymce/tinymce.min.js"></script>



    <script>
      tinymce.init({
          selector: "textarea#elm1",
          theme: "modern",
          height: 300,
          plugins: [
               "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
               "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
               "save table contextmenu directionality emoticons template paste textcolor"
         ],
         content_css: "css/content.css",
         toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons", 
         style_formats: [
              {title: 'Bold text', inline: 'b'},
              {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
              {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
              {title: 'Example 1', inline: 'span', classes: 'example1'},
              {title: 'Example 2', inline: 'span', classes: 'example2'},
              {title: 'Table styles'},
              {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
          ]
       }); 
      </script>




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
                  <li><a href="../pages/adminPublicidad.php"><i class="fa fa-file-image-o"></i><span>  Publicidad</span></a></li>
                  <li><a href="../pages/adminBanners.php"><i class="fa fa-bookmark-o"></i><span>  Banners</span></a></li>
                  <li><a href="../pages/adminEventos.php"><i class="fa fa-image"></i><span>  Eventos</span></a></li>
                  <li><a href="../pages/adminGaleria.php"><i class="fa fa-book"></i><span>  Galeria</span></a></li>
                  <li class="active"><a href="../pages/adminNoticias.php"><i class="fa fa-file-text-o"></i><span>  Noticias</span></a></li>
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
              


              <h1 class="page-header" align="center"><?php if (isset($_POST['editar'])) { echo $row->titulo;}else{echo "Nueva Noticia"; }?></h1>

              <form id="subir" name="subir" method="POST"  enctype="multipart/form-data">
                
                <img id="anadir" src=<?php if (isset($_POST['editar'])) { echo '"'.$row->foto.'"';}else{echo "../img/upload_foto.png"; }?> class="img-responsive" alt="Responsive image">
                <p></p>
                <input id="imagen" name="imagen" type="file" onchange="readURL(this);" value= <?php if (isset($_POST['editar'])) { echo '"' . $row->foto .'"';}else{echo ""; }?> />  
                <p></p>
                <input id="evento" name="titulo" type="titulo" class="form-control" value= <?php if (isset($_POST['editar'])) { echo '"' . $row->titulo .'"';}else{echo '""';} ?>  required autofocus>
                <p></p>
                <textarea id="elm1" name="descripcion"><?php if (isset($_POST['editar'])) { echo $row->cuerpo;}else{echo " "; }?></textarea>
                <p></p>

                <div class="row">
                  <div class="col-xs-6">
                  </div>
                  <div class="col-xs-6">
                    <div align="right">


                      <button name=<?php if (isset($_POST['editar'])) { echo "guardar";}else{echo "submit"; }?> type=<?php if (isset($_POST['editar'])) { echo "guardar";}else{echo "submit"; }?> class="btn btn-primary btn-md" value=<?php if (isset($_POST['editar'])) { echo $row->id; }else{echo "submit"; }?>>Guardar Evento</button>
                    

                     </div>
                  </div>
                </div>
                <p></p>
              </form>



              <h2 class="sub-header">Mis Noticias:</h2>

              <form method="POST" enctype="multipart/form-data">

                <div class="table-responsive">
                  <table class="table table-striped">
                      <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Fecha</th>
                            <th>Accion</th>
                        </tr>
                      </thead>
                      <tbody>
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
                        $query = $db->query("SELECT * FROM $db_table");

                        while ($row = $query->fetch_object()) {

                      ?>

                          <tr>
                              <td><?php echo $row->titulo; ?></td>
                              <td><?php echo date('d-M-Y', strtotime($row->fecha)); ?></td>
                              <td>
                                <p>
                                  <button name="editar" type="editar" class="btn btn-xs btn-primary" value= <?php echo "\"" . $row->id ."\"" ;?>  >Editar</button>
                                  <button name="eliminar" type="eliminar" class="btn btn-xs btn-danger" value= <?php echo "\"" . $row->id ."\"" ;?>  >Eliminar</button>
                                </p>
                              </td>
                          </tr>

                      <?php
                        }
                      ?>

                      </tbody>
                  </table>
                </form>
              </div>

              



            </div>
          </div>
        </div>
			</div>
		</div>
	</div>

</body>
</html>