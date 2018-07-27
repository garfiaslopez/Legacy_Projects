<%--
  Created by IntelliJ IDEA.
  User: javi
  Date: 15/10/15
  Time: 02:18 AM
--%>

<div id="fsModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <!-- dialog -->
    <div class="modal-dialog">
        <!-- content -->
        <div class="modal-content">
            <!-- header -->
            <div class="modal-header">
                <h1 id="myModalLabel" class="modal-title"> ${des[0].getAt(1)}</h1>
                <div class="modal-actions">
                    <button class="btn btn-secondary cerrar" data-dismiss="modal"> <i class="fa fa-remove"></i> </button>
                </div>
            </div>
            <!-- header -->
            <!-- body -->
            <div class="modal-body">
                <!-- end Profile Widget --><!-- Text Post -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="widget-container fluid-height clearfix">
                                <div class="col-md-12">
                                    <div class="heading">
                                        <i class="fa fa-file-text-o"></i>Detalles del archivo
                                    </div>
                                    <div class="widget-content padded">
                                        <p class="lead">
                                            <!--Propuesta de desarrollo de marca "Luz" para entender quién es y cómo se le percibe.-->
                                            ${des[0].getAt(0)}
                                        </p>
                                        <table class="table table-filters">
                                            <tbody>
                                            <tr class="alignment">
                                                <td>
                                                    <i style="color: ${des[0].getAt(9)}" class="fa fa-circle"></i>
                                                </td>
                                                <td>${des[0].getAt(4)}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <i class="fa fa-briefcase"></i>
                                                </td>
                                                <td>${des[0].getAt(2)}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <i class="fa fa-calendar-plus-o"></i>
                                                </td>
                                                <td>${des[0].getAt(3)}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <i class="fa fa-file-text-o"></i>
                                                </td>
                                                <td> ${des[0].getAt(1)}</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <i class="fa fa-tag"></i>
                                                </td>
                                                <td> ${des[0].getAt(5)}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <hr>
                                        <a href="${des[0].getAt(6)}" target="_blank" class="btn btn-primary descargar"> <i class="fa fa-download"></i> Descargar archivo</a>
                                        <a class="btn btn-default-outline popover-trigger lin" data-toggle="popover" data-html='true'
                                           data-content='<form><input type="text" value="http://keybox.mx/s/eh59cnvhpts50a7/Propuesta%20LMZetina%20copia.key?dl=1"/><br><br><input type="text" value="user@keybox.mx"><br><br><button>Enviar</button</form>'
                                           data-placement="top" data-original-title="Enviar link"> <i class="fa fa-share-square"></i> Compartir</a>
                                            <p class="parrafo" style="visibility: hidden">link : </p>
                                            <p class="parrafo" style="visibility: hidden">${des[0].getAt(6)}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="social-wrapper">
                                <div id="social-container">
                                    <div class="item widget-container fluid-height social-entry">


                                    <div id="comentarios"></div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end Text Post -->

            </div>
            <!-- body -->

        </div>
        <!-- content -->
    </div>
    <!-- dialog -->
</div>
</div>

