import bb.cascades 1.0

Sheet {
    property string idAlumno
    
    id: sheetFormAlumno
    objectName: "sheetFormAlumno"
    
    Page {
        id: pagFormAlumno
        objectName: "pagFormAlumno"
        
        titleBar: TitleBar {
            id: titAgregarForm
            title: "Agregar Alumno"
            
            dismissAction: ActionItem {
                title: "Cancelar"
                onTriggered: {
                    sheetFormAlumno.close()
                }
            }
            
            acceptAction: ActionItem {
                title: "Guardar"
                onTriggered: {
                    if (idAlumno != "") {
                        _HereApp.modificarAlumnoSQL(idAlumno, txtMatricula.text, txtNombre.text, txtApellidos.text, txtTelefono.text, txtEmail.text)
                        
                    } else {
                        _HereApp.guardarAlumnoSQL(txtMatricula.text, txtNombre.text, txtApellidos.text, txtTelefono.text, txtEmail.text)
                    }
                }
            }
            
        } //titAgregarAlumno
        
        ScrollView {
            id: scrollFormAlumno
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            
            content: Container {
                id: contFormAlumno
                objectName: "contFormAlumno"
                leftPadding: 20.0
                topPadding: 20.0
                rightPadding: 20.0
                bottomPadding: 20.0
                
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                
                Label {
                    text: "Matrícula:"
                }
                
                TextField {
                    id: txtMatricula
                    objectName: "txtMatricula"
                    hintText: "Ingrese la matrícula del alumno"
                }
                
                Label {
                    text: "Nombre:"
                }
                
                TextField {
                    id: txtNombre
                    objectName: "txtNombre"
                    hintText: "Ingrese el nombre del alumno"
                }
                
                Label {
                    text: "Apellidos:"
                }
                
                TextField {
                    id: txtApellidos
                    objectName: "txtApellidos"
                    hintText: "Ingrese los apellidos del alumno"
                }
                
                Label {
                    text: "Teléfono:"
                }
                
                TextField {
                    id: txtTelefono
                    objectName: "txtTelefono"
                    hintText: "Ingrese el teléfono del alumno"
                    inputMode: TextFieldInputMode.PhoneNumber
                }
                
                Label {
                    text: "Email:"
                }
                
                TextField {
                    id: txtEmail
                    objectName: "txtEmail"
                    hintText: "Ingrese el Email"
                    inputMode: TextFieldInputMode.EmailAddress
                }
                
            } //contFormAlumno
            
        } //scrollFormAlumno
        
    } //pagFormAlumno
    
} //sheetFormAlumno