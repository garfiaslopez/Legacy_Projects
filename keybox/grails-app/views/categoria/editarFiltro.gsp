<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 15/10/15
  Time: 01:32 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="container-fluid main-content">
    <div class="page-title">
        <ul><li><a href="./"><i class="fa fa-home"></i></a></li> &raquo; <li><a>${dato}</a></li> &raquo; <li>Editar filtro</li></ul>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="widget-container fluid-height clearfix">

                    <div class="heading">
                        <i class="fa fa-file-text-o"></i>Detalles
                    </div>
                    <div class="widget-content padded">
                        <g:form action="actualizarFiltro" class="form-horizontal">

                            <div class="form-group">
                                <label class="control-label col-md-2">Nombre</label>
                                <div class="col-md-7">
                                    <input name="nombreF" class="form-control" value="${actualFiltro.nombre}" type="text" required>
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="control-label col-md-2">Icono</label>
                                <div class="col-md-7">
                                    <div class="input-group">
                                        <input name="iconoF" class="form-control IconSelector" value="${actualFiltro.icono}" type="text" required/>
                                        <span class="input-group-addon"></span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2">Color</label>
                                <div class="col-md-7">
                                    <div class="input-group">
                                        <input name="colorF" class="form-control ColorSelector" value="${actualFiltro.color}" type="text" required />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-2 sr-only">Enviar Forma</label>
                                <div class="col-md-7">
                                    <hr>
                                    <input type="text" value="${categoria.id}" name="idCategoria" class="hide">
                                    <input type="text" value="${actualFiltro.id}" name="filterId" class="hide">
                                    <g:submitButton name="actualizarFiltro" value="Actualizar" class="btn btn-primary actualizarFiltro"></g:submitButton>
                                    <a class="btn btn-default-outline" href="${createLink([controller: 'categoria', action: 'indice'])}">Cancelar</a>
                                </div>
                            </div>
                        </g:form>
                    </div>

            </div>
        </div>
    </div>
</div>


<script>
    $('.IconSelector').iconpicker();
    $('.ColorSelector').colorpicker({format:"hex"});

</script>
