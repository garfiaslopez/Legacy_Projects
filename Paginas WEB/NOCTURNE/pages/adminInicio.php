<?php session_start(); 
include("../php/CheckSession.php"); 
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
    <link href="../css/fullcalendar.css" rel="stylesheet" type="text/css" />
    <link href="../css/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' />
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
            			<li class="active"><a href="../pages/adminInicio.php"><i class="fa fa-calendar"></i><span>   Agenda</span></a></li>
            			<li><a href="../pages/adminPublicidad.php"><i class="fa fa-file-image-o"></i><span>  Publicidad</span></a></li>
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
				<h1 class="page-header" align="center">Agenda</h1>
				<section aling="center" class="content">
                    <div class="row">
                    	<div class="col-md-1">
                    		
                    	</div>
                        <div class="col-md-10">
                            <div class="box box-primary">                                
                                <div class="box-body no-padding">
                                    <!-- THE CALENDAR -->
                                    <div id="calendar" style="background-color:gray;"></div>
                                </div><!-- /.box-body -->
                            </div><!-- /. box -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->  
                </section><!-- /.content -->
		    </div>
	    </div>
    </div>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
  	<script src="../js/bootstrap.min.js"></script>
  	<script src="../js/offcanvas.js"></script>
  	<script src="../js/fullcalendar.min.js"></script>
  	<script src="../js/jquery-ui-1.10.3.min.js"></script>
  	<script src="../app.js"></script>

</body>

    <script type="text/javascript">
            /* initialize the external events
            -----------------------------------------------------------------*/
            
                $(document).ready(function() {

                var date = new Date();
                var d = date.getDate();
                var m = date.getMonth();
                var y = date.getFullYear();

                var calendar = $('#calendar').fullCalendar({
                    editable: true,
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    events: "../php/events.php",
                     eventRender: function(event, element, view) {
                        if (event.allDay === 'true') {
                            event.allDay = true;
                        } else {
                            event.allDay = false;
                        }

                    },
                    selectable: true,
                    selectHelper: true,

                    monthNames:['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                    monthNamesShort:['Ene.','Feb.','Mar','Abr.','May','Jun','Jul.','Ago','Sept.','Oct.','Nov.','Dic.'],
                    dayNames: ['Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado'],
                    dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'],
              
                    select: function(start, end, allDay) {

                        var title = prompt('Titulo de su evento:');
                        var description = prompt('Descripcion de su evento:');
                        var url = prompt('URL de su evento:');

                        if (title) {
                            var start = $.fullCalendar.formatDate(start, "yyyy-MM-dd HH:mm:ss");
                            var end = $.fullCalendar.formatDate(end, "yyyy-MM-dd HH:mm:ss");
                            
                            $.ajax({
                                url: '../php/add_events.php',
                                data: 'title='+title+'&start='+start+'&end='+end+'&description='+description+'&url='+url,
                                type: "POST",
                                success: function(json) {
                                    alert('Se ha agregado exitosamente.');
                                }
                            });
                            calendar.fullCalendar('renderEvent',
                                {
                                    title: title,
                                    description: description,
                                    start: start,
                                    end: end,
                                    allDay: allDay
                                },
                            true // make the event "stick"
                            );
                        }
                    calendar.fullCalendar('unselect');
                    },
               
                    editable: true,
                    
                    eventDrop: function(event, delta) {
                        var start = $.fullCalendar.formatDate(event.start, "yyyy-MM-dd HH:mm:ss");
                        var end = $.fullCalendar.formatDate(event.end, "yyyy-MM-dd HH:mm:ss");
                        $.ajax({
                            url: '../php/update_events.php',
                            data: 'title='+ event.title + '&description=' + event.description + '&url=' + event.url + '&start='+ start +'&end='+ end +'&id='+ event.id ,
                            type: "POST",
                            success: function(json) {
                                alert("Se ha actualizado exitosamente.");
                            }
                        });
                    },
                    
                    eventClick: function(event) {
                        var decision = confirm("¿Desea eliminar este evento?"); 
                        if (decision) {
                            $.ajax({
                                type: "POST",
                                url: "../php/delete_events.php",
                                data: "&id=" + event.id,
                                success: function(json) {
                                    alert("Se eliminado exitosamente.");
                                }
                            });
                        calendar.fullCalendar('removeEvents', event.id);
                        } else {
                        }
                    },

                    eventResize: function(event) {
                        var start = $.fullCalendar.formatDate(event.start, "yyyy-MM-dd HH:mm:ss");
                        var end = $.fullCalendar.formatDate(event.end, "yyyy-MM-dd HH:mm:ss");
                        $.ajax({
                            url: '../php/update_events.php',
                            data: 'title='+ event.title + '&description=' + event.description + '&url=' + event.url + '&start='+ start +'&end='+ end +'&id='+ event.id ,
                            type: "POST",
                            success: function(json) {
                                alert("Se ha actualizado exitosamente.");
                            }
                        });

                    }

                });

            });
    </script>

</html>