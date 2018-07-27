import bb.cascades 1.0

Page {
    property alias miTituloVista: miTitulo.title
    id: pagAsistencias
    
    titleBar: TitleBar {
        id: miTitulo
        title: "..."
    }
    
    Container {
        id: contListaAsistencias
        objectName: "contListaAsistencias"
        leftPadding: 20.0
        topPadding: 20.0
        rightPadding: 20.0
        bottomPadding: 20.0
        
        DateTimePicker {
            id: historialFechas
            objectName: "historialFechas"
            mode: DateTimePickerMode.Date
            title: "Seleccione una fecha "
        }
    }
    
}
