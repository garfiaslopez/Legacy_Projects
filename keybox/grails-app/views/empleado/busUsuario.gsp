<%--
  Created by IntelliJ IDEA.
  User: javi
  Date: 19/10/15
  Time: 01:08 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<table class="table table-filters">
    <thead>
    <tr>
        <td></td>
        <td>Nombre</td>
        <td>Rol</td>
        <td></td>
    </tr>
    </thead>

    <tbody id="holder">

    <g:each in="${usuarios}" var="u" >

        <tr class="item administradores">
            <td class="filter-category">
                <!--<img width="34" height="34" src="images/ui-rodolfo.png" />-->
                <img src="${createLink(controller: 'categoria', action: 'getImagen', id: u.getAt(2))}" width="34px", height="34px" onerror='this.src="${resource(dir: 'images', file: 'default.jpg')}"'>
            </td>

            <td>${u.getAt(0)}</td>


            <td class="hidden-xs">${roles.get(entera++)}</td>




            <td class="actions">
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <i class="fa fa-pencil editEmpleado"id="${u.getAt(2)}"></i>
                    <i class="fa fa-remove eliminarEmpleado" id="${u.getAt(2)}"></i>
                </sec:ifAllGranted>
            </td>

        </tr>
    </g:each>




    </tbody>
</table>