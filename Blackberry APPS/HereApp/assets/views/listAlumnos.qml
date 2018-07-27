import bb.cascades 1.0
import bb.system 1.0

Page {
    property alias miTituloVista : miTitulo.title
    property int idEliminar
    property string nomRegistro
    
    id: pagAlumnos
    
    titleBar: TitleBar {
        id: miTitulo
        title: "..."
    }
    
    Container {
        id: contAlumnos
        
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
                hintText: "Buscar un alumno"
                verticalAlignment: VerticalAlignment.Center
                inputMode: TextFieldInputMode.Text
                
                onTextChanging: {
                    _HereApp.filtraAlumnosSQL(txtBuscar.text)
                }
                
            } //txtBuscar
            
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
            id: contListaAlumnos
            
            ListView {
                id: listaAlumnos
                objectName: "listaAlumnos"
                dataModel: alumnosDM
                
                listItemComponents: [
                    ListItemComponent {
                        type: "item"
                        StandardListItem {
                            title: ListItemData.nombre+" "+ListItemData.apellidos;
                            description: ListItemData.email;
                        }
                    }
                ] //listItemComponents
                
                onTriggered: {
                    if (indexPath.length > 1) {
                        var miItem = alumnosDM.data(indexPath)
                        _HereApp.abreVistaAlumnoQML("detailAlumno", miItem.grupo)
                        _HereApp.datosActualizaAlumno(miItem.idalumno, "vista")
                    }
                } //onTriggered
                
                multiSelectHandler {
                    actions: [
                        ActionItem {
                            title: "Guardar asistencia"
                            imageSource: "asset:///img/ic_done.png"
                            
                            onTriggered: {
                                
                            }
                        }
                    ]
                } //multiSelectHandler
                
                contextActions: [
                    ActionSet {
                        id: listaOpciones
                        title: "Opciones"   
                        ActionItem {
                            title: "Modificar"
                            imageSource: "asset:///img/ic_edit.png"
                            onTriggered: {
                                if (listaAlumnos.selected().length > 1) {
                                    var miItem = alumnosDM.data(listaAlumnos.selected())
                                    _HereApp.abreFormularioQML("formAlumno")
                                    _HereApp.datosActualizaAlumno(miItem.idalumno, "form")
                                }
                            }
                        }
                        ActionItem {
                            title: "Eliminar"
                            imageSource: "asset:///img/ic_delete.png"
                            onTriggered: {
                                if (listaAlumnos.selected().length > 1) {
                                    var miItem = alumnosDM.data(listaAlumnos.selected())
                                    pagAlumnos.idEliminar = miItem.idalumno
                                    pagAlumnos.nomRegistro = "del grupo a " + miItem.nombre + " " + miItem.apellidos
                                    confirmaEliminar.show()
                                }
                            }
                        }
                    }
                ] //contextActions
                
                attachedObjects: [
                    SystemDialog {
                        id: confirmaEliminar
                        objectName: "confirmaEliminar"
                        title: "Eliminar registro"
                        body: "¿Esta seguro que desea eliminar "+pagAlumnos.nomRegistro+"?"
                        onFinished: {
                            if (confirmaEliminar.result == 2) {
                                _HereApp.eliminarAlumnoSQL(pagAlumnos.idEliminar)
                            }
                        }
                    }
                ] //attachedObjects
                
                onSelectionChanged: {
                    if (selectionList().length == 0) {
                        multiSelectHandler.status = "0 asistentes a la clase";
                    } else {
                        multiSelectHandler.status = selectionList().length +" asistentes a la clase";
                    }
                } //onSelectionChanged
                
            } //listaAlumnos
       
        } //contListaAlumnos
        
    } //contAlumnos
    
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
            title: "Alumno"
            imageSource: "asset:///img/ic_add_alumno.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                _HereApp.abreFormularioQML("formAlumno")
            }
        },
        MultiSelectActionItem {
            title: "Tomar lista"
            ActionBar.placement: ActionBarPlacement.InOverflow
            multiSelectHandler: listaAlumnos.multiSelectHandler
        }
    ] //actions
    
    attachedObjects: [
        GroupDataModel {
            id: alumnosDM
            objectName: "alumnosDM"
            grouping: ItemGrouping.ByFullValue
            sortingKeys: [
                "grupo",
                "nombre",
                "apellidos"
            ]
        }
    ] //attachedObjects
    
} //pagAlumnos
