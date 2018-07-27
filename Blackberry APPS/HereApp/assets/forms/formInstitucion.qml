import bb.cascades 1.0

Sheet {
    property string idInstitucion
    
    id: sheetFormInstitucion
    objectName: "sheetFormInstitucion"
    
    Page {
        id: pagFormInstitucion
        objectName: "pagFormInstitucion"
        
        titleBar: TitleBar {
            id: titAgregarInstitucion
            title: "Agregar Inst."
            
            dismissAction: ActionItem {
                title: "Cancelar"
                onTriggered: {
                    sheetFormInstitucion.close()
                }
            }
            
            acceptAction: ActionItem {
                title: "Guardar"
                onTriggered: {
                    if (idInstitucion != "") {
                        _HereApp.modificarInstitucionSQL(idInstitucion, txtNombre.text, txtTelefono.text, txtSitioWeb.text, txtUbicacion.text)
                    } else {
                        _HereApp.guardarInstitucionSQL(txtNombre.text, txtTelefono.text, txtSitioWeb.text, txtUbicacion.text)
                    }
                }
            }
            
        } //titAgregarInstitucion
        
        ScrollView {
            id: scrollFormInstitucion
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            
            content: Container {
                id: contFormInstitucion
                objectName: "contFormInstitucion"
                leftPadding: 20.0
                topPadding: 20.0
                rightPadding: 20.0
                bottomPadding: 20.0
                
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                
                Label {
                    text: "Nombre:"
                }
                
                TextField {
                    id: txtNombre
                    objectName: "txtNombre"
                    hintText: "Ingrese el nombre de la institución"
                }
                
                Label {
                    text: "Teléfono:"
                }
                
                TextField {
                    id: txtTelefono
                    objectName: "txtTelefono"
                    hintText: "Ingrese el teléfono de la institución"
                    inputMode: TextFieldInputMode.PhoneNumber
                }
                
                Label {
                    text: "Sitio web:"
                }
                
                TextField {
                    id: txtSitioWeb
                    objectName: "txtSitioWeb"
                    hintText: "Ingrese la url del sitio web"
                }
                
                Label {
                    text: "Ubicación:"
                }
                
                TextArea {
                    id: txtUbicacion
                    objectName: "txtUbicacion"
                    hintText: "Ingrese la dirección"
                    preferredHeight: 250
                    maxHeight: 250
                }
                
            } //contFormInstitucion
            
        } //scrollFormInstitucion
        
    } //pagFormInstitucion
    
} //sheetFormInstitucion
