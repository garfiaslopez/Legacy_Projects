<?php session_start();
include("php/CheckSession.php"); 
include("../php/GetLeerNoticia.php");
include("../php/ModifyNoticia.php");

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
              <?php
                include("/php/GetLeerNoticia.php");
              ?>    

              <h1 class="page-header" align="center"> <?php echo $row->titulo;?> </h1>

              <form id="subir" name="subir" method="POST" enctype="multipart/form-data">
                <img id="anadir" src= <?php echo "\"" . $row->foto . "\"";  ?> >
                <p></p>
                <input id="imagen" name="imagen" type="file" onchange="readURL(this);" />  
                <p></p>
                <input id="evento" name="titulo" type="titulo" class="form-control" value="<?php echo $row->titulo;?>" >
                <p></p>
                <textarea id="elm1" name="descripcion"><?php echo $row->cuerpo;?> </textarea>
                <p></p>
                <div class="row">
                  <div class="col-xs-6">
                    <div align="left">
                        <button name="eliminar" type="eliminar" class="btn btn-danger btn-md" value="Eliminar">Eliminar Noticia</button>
                    </div>
                  </div>
                  <div class="col-xs-6">
                    <div align="right">
                      <button name="guardar" type="guardar" class="btn btn-primary btn-md" value="Guardar">Guardar Noticia</button>
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

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/offcanvas.js"></script>

</body>
</html>