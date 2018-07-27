import bb.cascades 1.0

Page {
    property alias miTituloVista : miTitulo.title
    property string idAlumno
    
    id: pagAlumno
    
    titleBar: TitleBar {
        id: miTitulo
        title: "..."
    }
    
    Container {
        id: contVistaAlumno
        objectName: "contVistaAlumno"
        leftPadding: 20.0
        topPadding: 20.0
        rightPadding: 20.0
        bottomPadding: 20.0
        
        Label {
            id: txtNombre
            objectName: "txtNombre"
            text: "..."
            
            textStyle{
                base: SystemDefaults.TextStyles.PrimaryText
                fontSize: FontSize.XLarge
            }
        }
        
        Divider {
        }
        
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            Label {
                text: "Matrícula:"
                textStyle {
                    base: SystemDefaults.TextStyles.PrimaryText
                    color: Color.Gray
                }
            }
            Label {
                id: txtMatricula
                objectName: "txtMatricula"
                text: "..."
                textStyle {
                    base: SystemDefaults.TextStyles.PrimaryText
                }
            }
        }
        
        Divider {
        }
        
        StandardListItem {
            id: txtTelefono
            objectName: "txtTelefono"
            title: "..."
            description: "..."
            imageSource: "asset:///img/ic_phone.png"
        }
        
        StandardListItem {
            id: txtEmail
            objectName: "txtEmail"
            title: "..."
            description: "..."
            imageSource: "asset:///img/ic_email_yellow.png"
        }
    }
}
