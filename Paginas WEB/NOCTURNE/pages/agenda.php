<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Nocturne</title>

<link rel="icon" type="image/png" href="../img/logo.png">
	<!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/index.css" rel="stylesheet">   
    <link href="../css/fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="../css/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' /> 

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>

    <!--backstretch-->
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.backstretch.js"></script> 

    <script src="../js/fullcalendar.min.js"></script>
  	<script src="../js/jquery-ui-1.10.3.min.js"></script>

	<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment.min.js"></script>
	<script src="../js/bootstrapmodal.min.js"></script>


	<script>

		$(document).ready(function() {
			
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month'
				},

				editable: false,
			    events: "../php/events.php",

				monthNames: ["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ], 
	            monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
	            dayNames: [ 'Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
	            dayNamesShort: ['Dom','Lun','Mar','Mie','Jue','Vie','Sab'],
	            
	            buttonText: {
	                today: 'hoy',
	                month: 'mes',
	                week: 'semana',
	                day: 'día'
	            },
	            eventRender: function (event, element) {
				    element.attr('href', 'javascript:void(0);');
		            element.click(function() {
		                //set the modal values and open
		                $('#modalTitle').html(event.title);
		                $('#modalBody').html(event.description);
		                $('#eventUrl').attr('href',event.url);
		                $('#fullCalModal').modal();
		            });
		        }
			});
			
		});

	</script>
    <!--CSS-->
    <link href="../css/carousel.css" rel="stylesheet">
    <link href="../css/bootstrapmodal.css" rel="stylesheet">

</head>
<body background="../img/fondo.png">

	<div id="banner">

		<img id="logo" src="../img/logo.png">				

	</div>								
	<script>
		$("#banner").backstretch([
			<?php
				include("../php/GetBanners.php");

				if ($query) 
                {
                    while ($row = $query->fetch_object())
                    {

                    echo "\"".$row->foto."\",";
                	}
                }

                $db->close();
            ?>		
			]
		,{duration: 2000, fade:3000
       	});
	</script>

	<div class="navbar navbar-inverse" role="navigation">
		<div class="container-fluid">	



			<div class="navbar-header">

				<buttom type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Nocturne|Oaxaca</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</buttom>

				<a id="title" class="navbar-brand" href="http://nocturneoax.com">Nocturne|Oaxaca</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
       				<li><a href="../index.php">Inicio   /</a></li>
       				<li><a href="../pages/eventos.php">Eventos   /</a></li> 
       				<li><a href="../pages/noticias.php">Noticias   /</a></li>
       				<li><a href="../pages/galeria.php">Galeria   /</a></li>
       				<li><a id="navbarColor" href="../pages/agenda.php">Agenda   /</a></li> 
       				<li><a href="../pages/revista.php">Revista   /</a></li> 
       				<li><a href="../pages/contacto.php">Contacto</a></li>       
     			</ul>
         	</div>	

	
		</div>
	</div>

	<div id="borde">
		<div class="row">
			<div class="col-md-9">

				<h2 style="color:white;"align="center">Fechas de Proximos Eventos</h2>

				<hr class="divider">


				<div id='calendar' style="background-color:transparent;"></div>



			</div>
			<div class="col-md-3">

				<!--PUBLICIDAD-->
				    <?php 

                      include("../php/GetPublicidad.php"); 
                      if ($query) 
                      {
                        while ($row = $query->fetch_object()) {
                    ?>

						<div class="publi col-md-12">
							<a href=<?php echo '"'.$row->link.'"';?> ><img class="image" src=<?php echo $row->foto?> ></a> 
						</div>

                    <?php 
                      	}
                    }
                    	else
                    	{

                    	}

                    	$db->close();
                    ?>

			</div>
		</div>


		<br>
		<div align="center">
			<img class= "image" src="../img/separador.png">
		</div>
		<br>  
		<a href="https://www.facebook.com/nocturneoaxaca"><img  class= "image" src="../img/f.png" style="margin-left: 20px; margin-bottom: 30px;"></a>
		<a href="https://twitter.com/nocturneoax"><img class= "image" src="../img/t.png" style="margin-left: 20px; margin-bottom: 30px;"></a>

		<footer>
        	<p class="pull-right"><a href="#">Ir Arriba</a></p>
        	<p>&copy; 2014 Berry Software, Inc. </p>
      	</footer>
	</div>
	<div id="fullCalModal" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
	                <h4 id="modalTitle" class="modal-title"></h4>
	            </div>
	            <div id="modalBody" class="modal-body"></div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
	                <button class="btn btn-primary"><a id="eventUrl" target="_blank">Link</a></button>
	            </div>
	        </div>
	    </div>
	</div>



</body>

</html>