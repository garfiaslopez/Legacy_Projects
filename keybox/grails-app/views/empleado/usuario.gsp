<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 26/09/15
  Time: 07:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="col-sm-3 hidden-xs">
    <div class="list">
        <ul id="filterOptions">
            <li class="all current">
                <i class="fa fa-circle"></i><a class="btnFil" id="0">Ver todo</a>
            </li>
            <li class="administradores">
                <i class="fa fa-circle"></i><a class="btnFil" id="1">Administradores</a>
                <i class="fa fa-ellipsis-h"></i>
            </li>
            <li class="editores">
                <i class="fa fa-circle"></i><a class="btnFil" id="2">Editores</a>
                <i class="fa fa-ellipsis-h"></i>
            </li>
            <li class="consultores">
                <i class="fa fa-circle"></i><a class="btnFil" id="3">Consultores</a>
                <i class="fa fa-ellipsis-h"></i>
            </li>
        </ul>
    </div>
</div>
<div class="col-sm-9">
    <div class="widget-container fluid-height tbUsuario">
        <!-- Table -->

    </div>
    <!-- Add new button -->
    <sec:ifAllGranted roles="ROLE_ADMIN">
        <a class="add-content agregarEmpleado"><i class="fa fa-plus"></i> Nuevo usuario</a>
    </sec:ifAllGranted>
</div>
