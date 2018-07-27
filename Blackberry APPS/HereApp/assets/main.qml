// Default empty project template
import bb.cascades 1.0
import bb.data 1.0
import bb.system 1.0

NavigationPane {
    id: navPrincipal
    peekEnabled: true
    
    Page {
        property int idEliminar
        property string nomRegistro
        
        id: pagPrincial
        
        titleBar: TitleBar {
            title: "Bienvenido"
            }
        
        Container {
            id: contPrincipal
            
            Container {
                id: contBuscar
                leftPadding: 15
                rightPadding: 10
                topPadding: 10
                bottomPadding: 10
                visible: false
                
                background: Color.create(0.0000, 0.6549, 0.8706) //ColorAzulBB
                
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                
                TextField {
                    id: txtBuscar
                    hintText: "Buscar un grupo"
                    verticalAlignment: VerticalAlignment.Center
                    inputMode: TextFieldInputMode.Text
                    
                    onTextChanging:{
                        _HereApp.filtraGruposSQL(txtBuscar.text);
                    }
                    
                }//txtBuscar
                
                Button {
                    id: btnCancelarBuscar
                    text: "Cancelar"
                    preferredWidth: 120
                    onClicked: {
                        contBuscar.visible = false
                        txtBuscar.text = ""
                    }
                    
                } //btnCancelarBuscar
                
            } //contBuscar
            
            Container {
                id: contLista
                
                ListView {
                    id: listaGrupos
                    objectName: "listaGrupos"
                    dataModel: gruposDM
                    
                    listItemComponents: [
                        ListItemComponent {
                            type: "item"
                            StandardListItem {
                                title: ListItemData.grupo
                                description: ListItemData.noalumnos+" alumnos"
                            }
                        } 
                    ] //listItemComponents
                    
                    onTriggered: {
                        if (indexPath.length > 1) {
                            var miItem = gruposDM.data(indexPath)
                            _HereApp.abreVistaAlumnosQML("listAlumnos", miItem.institucion)
                            _HereApp.vistaAlumnosSQL(miItem.idinstitucion, miItem.idgrupo)
                        }
                    } //onTriggered
                    
                    contextActions: [
                        ActionSet {
                            id: listaOpciones
                            title: "Opciones"
                            ActionItem {
                                title: "Modificar"
                                imageSource: "asset:///img/ic_edit.png"
                                onTriggered: {
                                    if(listaGrupos.selected().length > 1){
                                        var miItem = gruposDM.data(listaGrupos.selected())
                                        _HereApp.abreFormularioQML("formGrupo")
                                        _HereApp.listaInstitucionesSQL()
                                        _HereApp.datosActualizaGrupo(miItem.idgrupo)
                                    }
                                }
                            }
                            ActionItem {
                                title: "Eliminar"
                                imageSource: "asset:///img/ic_delete.png"
                                onTriggered: {
                                    if(listaGrupos.selected().length > 1){
                                        var miItem = gruposDM.data(listaGrupos.selected())
                                        pagPrincial.idEliminar = miItem.idgrupo
                                        pagPrincial.nomRegistro = "el grupo "+miItem.grupo
                                        confirmaEliminar.show()
                                    }
                                }
                            }
                        }
                    ] //contextActions
                    
                    attachedObjects: [
                        SystemDialog{
                            id: confirmaEliminar
                            objectName: "confirmaEliminar"
                            title: "Eliminar registro"
                            body: "¿Esta seguro que desea eliminar "+pagPrincial.nomRegistro+"?"
                            onFinished: {
                                if(confirmaEliminar.result==2){
                                   _HereApp.eliminarGrupoSQL(pagPrincial.idEliminar)
                                }
                            }
                        }
                    ] //attachedObjects
                    
                } //listaGrupos
                
            } //contLista
            
        } //contPrincipal
        
        actions: [
            ActionItem {
                title: "Buscar"
                imageSource: "asset:///img/ic_search.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    contBuscar.visible = true
                    txtBuscar.requestFocus()
                }
            },
            ActionItem {
                title: "Institución"
                imageSource: "asset:///img/ic_add_institute.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    _HereApp.abreFormularioQML("formInstitucion")
                }
            },
            ActionItem {
                title: "Grupos"
                imageSource: "asset:///img/ic_add_groups.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                     _HereApp.abreFormularioQML("formGrupo")
                     _HereApp.listaInstitucionesSQL()
                }
            },
            ActionItem {
                title: "Listas de Asistencia"
                imageSource: "asset:///img/ic_add_groups.png"
                ActionBar.placement: ActionBarPlacement.InOverflow
                onTriggered: {
                    _HereApp.abreVistaAsistenciasQML("listAsistencias","Historial de Asistencias")
                    _HereApp.listaFechasAsistenciasSQL()
                }
            }
        ] //actions
        
        attachedObjects: [
            GroupDataModel {
                id: gruposDM
                objectName: "gruposDM"
                grouping: ItemGrouping.ByFullValue
                sortingKeys: [
                    "institucion",
                    "grupo"
                ]
            }
        ] //attachedObjects
        
    } //pagPrincipal
    
} //navPrincipal
