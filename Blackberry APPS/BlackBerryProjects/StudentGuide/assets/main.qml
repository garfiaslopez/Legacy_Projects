import bb.cascades 1.2

TabbedPane {
    showTabsOnActionBar: true
    Tab { //First tab
        // Localized text with the dynamic translation and locale updates support
        title: "Matematicas"
        description : "This is only shown in the side bar"
        imageSource : "/Imagenes/Tab1.png"
        delegate: Delegate {
            source: "Matematicas.qml"
        }
    } //End of first tab
    Tab { //Second tab
        title: "Fisica"
        description : "This is only shown in the side bar"
        imageSource : "/Imagenes/Tab2.png"
        delegate: Delegate {
            source: "Fisica.qml"
        }
    } //End of second tab
    
    Tab {
        title: "Quimica"
        description : "This is only shown in the side bar"
        imageSource : "/Imagenes/Tab3.png"
        delegate: Delegate {
            source: "Quimica.qml"
        }
    }
    Tab {
        title: "Notas"
        description : "This is only shown in the side bar"
        imageSource : "/Imagenes/Tab4.png"
        delegate: Delegate {
            source: "Notas.qml"
        }
    }
    Tab {
        title: "Tareas"
        description: "This is only shown in the side bar"
        //imageSource: ""
        delegate: Delegate {
            source: "Tareas.qml"
        }
    }
    Tab {
        title: "Horario"
        description: "This is only shown in the side bar"
        //imageSourve: ""
        delegate: Delegate {
            source: "Horario.qml"
        }
    }
    
    //DOCTOS DE TAREAS DE DIF MATERIAS... (INVOCATION FRAMEWORK; TRANSFERENCIA NFC;)
    //Postear cosas en fb tw, invocation framwork, 
    //BBM CHANNELS  COMPARTIR....

}