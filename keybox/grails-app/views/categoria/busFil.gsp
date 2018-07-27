<%--
  Created by IntelliJ IDEA.
  User: javi
  Date: 19/10/15
  Time: 12:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Resultados filtro -->
<div id="resultadosFiltro" class="col-sm-9">
    <div class="widget-container fluid-height">
        <!-- Table -->
        <table class="table table-filters">
            <thead>
            <tr>
                <td></td>
                <td>Nombre</td>
                <td>Fecha</td>
                <td>Elaborado</td>
                <td></td>
            </tr>
            </thead>

            <tbody id="holder">
            <g:each in="${resultados}" var="r">
                <tr>
                    <td>
                        <i style="color: ${r.getAt(5)}"class="fa fa-circle"></i>
                    </td>
                    <td><a class="dato" data-toggle="modal"  id="${r.getAt(1)}">${r.getAt(0)}</a></td>
                    <td><label class="dato" data-toggle="modal">${r.getAt(2).toString().substring(0, 10)}</label></td>
                    <td><label class="dato" data-toggle="modal">${r.getAt(3)}</label></td>
                    <td class="actions dropdown">
                        <g:set var="h" value="${0}" />
                        <g:each in="${favoritos}" var="f">

                            <g:if test="${r.getAt(1) == f.getAt(1) }">
                                <i class="fa fa-heart active" id="${r.getAt(1)}"></i>
                                <g:set var="h" value="${-1}" />
                            </g:if>


                        </g:each>
                        <g:if test="${h == 0}">
                            <i class="fa fa-heart " id="${r.getAt(1)}"></i>
                        </g:if>
                        <a class="actionButton" data-toggle="dropdown" href="#"><i class="fa fa-ellipsis-h"></i></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a tabindex="-1" href="${r.getAt(6)}"><i class="fa fa-download"></i> Descargar</a></li>
                            <li><a tabindex="-1" id="${r.getAt(1)}" class="delLink editDato"><i class="fa fa-pencil"></i> Editar</a></li>
                            <li><a id="${r.getAt(1)}" tabindex="-1" href="#" class="delLink eliminarDato fil"><i class="fa fa-remove"></i> Eliminar</a></li>

                        </ul>
                    </td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_STAFF">
        <a class="add-category agregarContenido" id="${d}"><i class="fa fa-plus"></i> Agregar nueva</a>
    </sec:ifAnyGranted>
</div>
