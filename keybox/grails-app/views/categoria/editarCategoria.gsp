<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 17/10/15
  Time: 08:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<h3>Editar</h3>
<g:form action="actualizarCategoria">
    <input type="text" value="${categoria.id}" style="display: none;" name="categoria">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="form-group">
                <input name="nombreCategoria" type="text" class="form-control"  value="${maximos[0].getAt(2)}" required >
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
        <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="form-group">
                    <input name="maxContenido" type="number" min="0" max="100" class="form-control" placeholder="Max. Contenido: ${maximos[0].getAt(0)}" required >
            </div>
        </div>
        <div class="col-md-3"></div>
        </div>

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="form-group">
                    <input name="maxFiltro" type="number" min="0" max="100" class="form-control"  placeholder="Max. Filtro: ${maximos[0].getAt(1)}" required >
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>

    <div class="row">
        <g:each in="${datos}" var="d">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="form-group">
                    <input name="dato" type="text" class="form-control" id="${d.getAt(1)}" placeholder="${d.getAt(0)}" required >
                </div>
            </div>
            <div class="col-md-3"></div>
        </g:each>
        </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6" style="text-align: center;">
            <g:submitButton name="actualizarCategoria" value="Actualizar" class="btn btn-default"></g:submitButton>
        </div>


    </div>
</g:form>