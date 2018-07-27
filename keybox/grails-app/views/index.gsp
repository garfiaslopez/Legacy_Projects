<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main"/>
	<title>KeyBox</title>

	<g:javascript>

		$(document).ready(function() {

			$.ajax({url: '${createLink(controller: 'categoria', action: 'filtro')}', type: 'GET', success: function(result){
				$("#filtro").html(result);
			}});

			$.ajax({url: '${createLink(controller: 'categoria', action: 'resultado')}', type: 'GET', success: function(result){
				$("#resultadosFiltro").html(result);

				/* FAVORITE */
				$( ".actions i.fa-heart" ).click(function() {
					$( this ).toggleClass( "active" );
				});

			}});

			$('.mas').click(function(){

				$('a').removeClass('current');
				$(this).addClass('current');

				$.ajax({url: '${createLink(controller: 'categoria', action: 'agregar')}', type: 'GET', success: function(result){
					$("#agregar").html(result);
				}});

			});

			$('#perfil').click(function(){

				$('a').removeClass('current');
				$('.user').addClass('current');

				$.ajax({url: '${createLink(controller: 'empleado', action: 'perfil')}', type: 'GET', success: function(result){
					$("#agregar").html(result);
				}});

			});

			$('.user').click(function(){

				$('a').removeClass('current');
				$(this).addClass('current');

				$.ajax({url: '${createLink(controller: 'empleado', action: 'usuario')}', type: 'GET', success: function(result){
					$("#agregar").html(result);
				}});

			});

		});

	</g:javascript>

</head>

<body>
<div class="modal-shiftfix">
	<div class="navbar navbar-fixed-top scroll-hide">
		<div class="container-fluid top-bar">
			<div class="pull-right">
				<ul class="nav navbar-nav pull-right">
					<li class="dropdown notifications hidden-xs">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-heart-o"></i></a>
						<ul class="dropdown-menu">
							<!-- g:each rellenando la lista con los datos de tabla Favoritos -->
							<li><span><i class="fa fa-heart active"></i>Favoritos</span></li>
						</ul>
					</li>
					<li class="dropdown user hidden-xs"><a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<!-- Obtener imagen del usuario que inicia sesion -->
						<img width="34" height="34" src="images/ui-rodolfo.png" />Rodolfo Ramirez<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a id="perfil">
								<i class="fa fa-user"></i>Mi Cuenta</a>
							</li>
							<li><a href="${createLink(controller: 'logout', action: 'index')}">
								<i class="fa fa-sign-out"></i>Cerrar sesión</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<button class="navbar-toggle">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

			<a class="logo" href="${createLink(action: 'index')}">KEYBOX</a>
			<form class="navbar-form form-inline col-lg-2 hidden-xs" action="resultados.html">
				<input class="form-control" placeholder="Busca por nombre, tag, o cliente..." type="text">
			</form>

		</div>

		<div class="container-fluid main-nav clearfix">
			<div class="nav-collapse">
				<ul class="nav">
					<!-- Rellenar lista de los valores obtenidos de la tabla Categoria -->
					<li><a class="current tab" href="${createLink(action: 'index')}">Propuestas</a></li>
					<li><a class="tab user">Usuarios</a></li>
					<li><a class="add-type mas"><i class="fa fa-plus"></i></a></li>
				</ul>
			</div>
		</div>

	</div>
	<div class="container-fluid main-content">

		<div class="row">

			<div id="agregar">



				<!-- Filtros -->
				<div id="filtro" class="col-sm-3 hidden-xs">

				</div>

				<!-- Resultados filtro -->
				<div id="resultadosFiltro" class="col-sm-9">

				</div>

			</div>

		</div>

	</div>
</div>



</body>
</html>
