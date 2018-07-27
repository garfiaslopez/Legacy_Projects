<!DOCTYPE html>
<?php
	include("../php/Galeria.php");
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
	<link href="../css/dropzone.css" type="text/css" rel="stylesheet" />
	<link href="../css/basic.css" type="text/css" rel="stylesheet" />

	<script src="../js/dropzone.min.js"></script>

	<script type="text/javascript">

		Dropzone.options.myAwesomeDropzone = { // The camelized version of the ID of the form element

		  // The configuration we've talked about above
		  autoProcessQueue: false,
		  uploadMultiple: true,
		  parallelUploads: 100,
		  maxFiles: 100,

		  // The setting up of the dropzone
		  init: function() {

		    var myDropzone = this;

		    var submitButton = document.querySelector("#submit-all")

		    submitButton.addEventListener("click", function(e) {
		      e.preventDefault();
		      e.stopPropagation();
		      myDropzone.processQueue(); // Tell Dropzone to process all queued files.
		    });

		    // Listen to the sendingmultiple event. In this case, it's the sendingmultiple event instead
		    // of the sending event because uploadMultiple is set to true.
		    this.on("sendingmultiple", function() {
		      // Gets triggered when the form is actually being sent.
		      // Hide the success button or the complete form.
		    });
		    this.on("successmultiple", function(files, response) {
		      // Gets triggered when the files have successfully been sent.
		      // Redirect user or notify of success.
		    });
		    this.on("errormultiple", function(files, response) {
		      // Gets triggered when there was an error sending the files.
		      // Maybe show form again, and notify user of error
		    });


		    this.on("addedfile", function(file) {

		        // Create the remove button
		        var removeButton = Dropzone.createElement("<button>Remove file</button>");


		        // Capture the Dropzone instance as closure.
		        var _this = this;

		        // Listen to the click event
		        removeButton.addEventListener("click", function(e) {
		          // Make sure the button click doesn't submit the form:
		          e.preventDefault();
		          e.stopPropagation();

		          // Remove the file preview.
		          _this.removeFile(file);
		          // If you want to the delete the file on the server as well,
		          // you can do the AJAX request here.
		        });

		        // Add the button to the file preview element.
		        file.previewElement.appendChild(removeButton);
     		 });
		  }
		}
	</script>


	<script>

		function ChangeEvent(value){
		    document.getElementById("InputEvent").value = value;
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
      				<li class="active"><a href="../pages/adminGaleria.php"><i class="fa fa-book"></i><span>  Galeria</span></a></li>
      				<li><a href="../pages/adminNoticias.php"><i class="fa fa-file-text-o"></i><span>  Noticias</span></a></li>
      				<li><a href="../pages/adminRevista.php"><i class="fa fa-file-pdf-o"></i><span>  Cargar Revista</span></a></li>
        			<li><a href="../pages/adminConfig.php"><i class="fa fa-cog"></i><span>  Configurar</span></a></li>
                  	<li><a href="../php/CloseSession.php"><i class="fa fa-sign-out"></i><span>  Cerrar Sesión</span></a></li>
          		</ul>
        	</div> 
		</div>


		<div class="col-md-9">
			<!--contenido-->          		
     	   	<h2 style="text-align:center;" class="sub-header">Eventos: [Sin Galeria]</h2>
          	<div class="table-responsive">
            	<table class="table table-striped">
	              	<thead>
	                	<tr>
	                  		<th>Seleccionar</th>
	                  		<th>Titulo</th>
	                  		<th>FechaEvento</th>

	                	</tr>
	              	</thead>
	              	<tbody>



                    <?php include("../php/GetEventos.php");

						//$today = date("Y-m-d");

                        while ($row = $query->fetch_object()) {

//	                        $expire = $row->fechaEvento; //from db
//
//							$today_time = strtotime($today);
//							$expire_time = strtotime($expire);

							if ($row->hasAlbum == 0) {



                    ?>
			                	<tr>
			                		<td>
			                			<label>
		        							<?php echo '<input type="radio" name="select" value="' . $row->id . '" onclick="ChangeEvent(this.value)">'; ?>
		    							</label>
			                		</td>
			                  		<td><?php echo $row->titulo; ?></td>
			                  		<td><?php echo date('d-M-Y', strtotime($row->fechaEvento)); ?></td>
			                	</tr>

		            <?php
		                	}
		                }
		            ?>





	                </tbody>
	            </table>
	        </div>


	        <div>

				<form action="../php/Galeria.php" id="my-awesome-dropzone" class="dropzone">

					<input id="InputEvent" type="hidden" name="Eventoid" value="0" />

					<div class="dropzone-previews"></div> <!-- this is were the previews should be shown. -->

				</form>

	        </div>

    		<div style="padding-top: 15px;" class="row" align="center">
	  			<button  id="submit-all" class="btn btn-primary btn-md" name = "submit" type="submit">Subir Album</button>
			</div>



			<hr class="featurette-divider"></hr>
	        <div>


	 	   		<h2 style="text-align:center;" class="sub-header">Galerias Existentes:</h2>

		 	   	 <form method="POST" enctype="multipart/form-data">
	                <div class="table-responsive">
	                  <table class="table table-striped">
	                      <thead>
	                        <tr>
	                            <th>Titulo</th>
	                            <th>Fecha Evento</th>
	                            <th>Accion</th>
	                        </tr>
	                      </thead>
	                      <tbody>

		                    <?php include("../php/GetEventos.php");

		                        while ($row = $query->fetch_object()) {

									if ($row->hasAlbum == 1) {
		                    ?>

	                          <tr>
	                              <td><?php echo $row->titulo; ?></td>
	                              <td><?php echo date('d-M-Y', strtotime($row->fechaEvento)); ?></td>

	                              <td>
	                                <p>


                            		<a id="ver" class="btn btn-xs btn-primary" href=<?php echo '"'. 'http://nocturneoax.com/pages/AdminEditarGaleria.php?id=' . $row->id . '"';?> role="button">Editar</a>


	                                  <button name="eliminarTodo" type="eliminarTodo" class="btn btn-xs btn-danger" value= <?php echo "\"" . $row->id ."\"" ;?>  >Eliminar</button>

	                                </p>
	                              </td>

	                          </tr>

	                      <?php
	                      	}
	                       }
	                      ?>

	                      </tbody>
	                  </table>
	                </div>
	                  <div class="row">
	                    <div class="col-xs-6">
	                    </div>
	                    <div class="col-xs-6">
	                      <div align="right">
	                        <button name="saveCarrousel" type="guardar" class="btn btn-primary btn-md" value="Guardar">Guardar</button>
	                      </div>
	                    </div>
	                  </div>
	              </form>


		        </div>




		</div>
	</div>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
  	<script src="../js/bootstrap.min.js"></script>
  	<script src="../js/offcanvas.js"></script>

</body>
</html>