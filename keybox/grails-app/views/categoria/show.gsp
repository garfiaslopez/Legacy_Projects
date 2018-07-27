<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 11/10/15
  Time: 05:16 PM
--%>
<!-- Filtros -->
<div id="filtro" class="col-sm-3 hidden-xs">
    <div class="list">
        <ul id="filterOptions">
            <!-- g:each iterando los valores a obtener de filtro -->
            <li class="alignment">
                <i class="fa fa-circle-o" ></i><a class="fil" id="0">Ver todo</a>
            </li>
            <g:each in="${filtros}" var="f">
                
                <li class="alignment actions dropdown">

                    <i style="color: ${f.getAt(3)}"class="fa ${f.getAt(2)}"></i>
                    <a class="fil" id="${f.getAt(1)}" name="filtros">${f.getAt(0)}</a>

                    <a class="actionButton" data-toggle="dropdown" href="#">
                        <i class="fa fa-ellipsis-h"></i>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a name="${d}" id="${f.getAt(1)}" class="editarFiltro"><i class="fa fa-pencil"></i> Editar</a></li>
                        <li><a id="${f.getAt(1)}" tabindex="-1" href="#" class="eliminarFiltro"><i class="fa fa-remove"></i> Eliminar</a></li>
                    </ul>


                </li>
            </g:each>



        </ul>
        <br>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_STAFF">
            <a class="add-categoria agregarFiltro" id="${d}"><i class="fa fa-plus"></i> Agregar filtro</a>
        </sec:ifAnyGranted>
    </div>
</div>

<div class="divFil"></div>
    <div id="verDato"> </div>
