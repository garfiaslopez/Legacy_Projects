<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 26/09/15
  Time: 06:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container-fluid main-content">
    <div class="page-title">
        <ul><li><a href="./"><i class="fa fa-home"></i></a></li> &raquo; <li>Nuevo tipo de contenido</li></ul>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-12">
                    <div class="widget-container fluid-height">
                        <div class="heading tabs">
                            <ul class="nav nav-tabs pull-left" data-tabs="tabs" id="tabs">
                                <!-- asignar valores obtenidos de categorias -->
                                <g:each in="${categorias}" var="c">

                                    <li>
                                        <a id="${c.getAt(1)}" class="btnEdit" data-toggle="tab" href="#${c.getAt(0)}"><span>${c.getAt(0)}</span></a>
                                    </li>

                                </g:each>

                                <li class="active">
                                    <a data-toggle="tab" href="#tab4"><span><i class="fa fa-plus"></i></span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content padded" id="my-tab-content">
                            <!-- asignar valores obtenidos de categorias -->
                            <g:each in="${categorias}" var="c">
                                <div class="tab-pane editarC" id="${c.getAt(0)}">

                                </div>
                            </g:each>
                            <div class="tab-pane active" id="tab4">

                                <div class="widget-container fluid-height clearfix">

                                    <div class="widget-content padded">
                                        <g:form action="agregarCategoria" class="form-horizontal" onsubmit="return validarCamposEsp()">

                                            <div class="form-group">
                                                <label class="control-label col-md-2">Nombre</label>
                                                <div class="col-md-7">
                                                    <input id="titulo" name="titulo" class="form-control" placeholder="Título del tipo de contenido" type="text" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-2">Maximo Datos</label>
                                                <div class="col-md-7">
                                                    <input id="maxDato" name="maxDato" class="form-control"
                                                           placeholder="Maximo de datos" type="number"
                                                           min="0" max="100" value="0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-2">Maximo Filtros</label>
                                                <div class="col-md-7">
                                                    <input id="maxFiltro" name="maxFiltro" class="form-control"
                                                           placeholder="Maximo de filtros" type="number"
                                                           min="0" max="100" value="0">
                                                </div>
                                            </div>
                                            <div class="line line-dashed line-lg pull-in"></div>

                                            <div id="campo"></div>

                                            <div class="form-group">
                                                <div class="col-md-2"></div>
                                                <div class="col-md-7">
                                                    <a href="#" id="agregarCampo" class="btn btn-default add-field pull-right"><i class="fa fa-plus"></i>Añade otro campo</a>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-md-2 sr-only">Enviar Forma</label>
                                                <div class="col-md-7">
                                                    <hr>
                                                    <g:submitButton name="agregarCategoria" value="Guardar" class="btn btn-primary"></g:submitButton><a href="./" class="btn btn-default-outline">Cancelar</a>
                                                </div>
                                            </div>
                                        </g:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
