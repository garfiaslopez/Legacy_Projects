import bb.cascades 1.0

Sheet {
    property string idGrupo
    
    id: sheetFormGrupo
    objectName: "sheetFormGrupo"
    
    Page {
        id: pagFormGrupo
        objectName: "pagFormGrupo"
        
        titleBar: TitleBar {
            id: titAgregarForm
            title: "Agregar Grupo"
            
            dismissAction: ActionItem {
                title: "Cancelar"
                onTriggered: {
                    sheetFormGrupo.close()
                }
            }
            
            acceptAction: ActionItem {
                title: "Guardar"
                onTriggered: {
                    if (idGrupo!="") {
                        _HereApp.modificarGrupoSQL(idGrupo, listaInstituciones.selectedValue, txtNombre.text, txtNumAlumnos.text)
                    } else {
                        _HereApp.guardarGrupoSQL(listaInstituciones.selectedValue, txtNombre.text, txtNumAlumnos.text)
                    }
                }
            }
            
        } //titAgregarGrupo
        
        ScrollView {
            id: scrollFormGrupo
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            
            content: Container {
                id: contFormGrupo
                objectName: "contFormGrupo"
                leftPadding: 20.0
                topPadding: 20.0
                rightPadding: 20.0
                bottomPadding: 20.0
                
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                
                Label {
                    text: "Institución:"
                }
                
                DropDown {
                    id: listaInstituciones
                    objectName: "listaInstituciones"
                    title: "Seleccione una institución"
                    enabled: true
                }
                
                Label {
                    text: "Nombre/clave del grupo:"
                }
                
                TextField {
                    id: txtNombre
                    objectName: "txtNombre"
                    hintText: "Ingrese el nombre/clave del grupo"
                }
                
                Label {
                    text: "Cantidad de alumnos"
                }
                
                TextField {
                    id: txtNumAlumnos
                    objectName: "txtNumAlumnos"
                    hintText: "Ingrese la cantidad de alumnos"
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                }
                
            } //contFormGrupo
            
        } //scrollFormGrupo
        
    } //pagFormGrupo
            
} //sheetFormGrupo