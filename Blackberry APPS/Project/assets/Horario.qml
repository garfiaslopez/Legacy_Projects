import bb.cascades 1.2
import "Common"
NavigationPane {
    id: navigation

Page {
    onCreationCompleted: {
        mainObj.loadMateria();
    }
    
        titleBar: TitleBar {
            title : "   Schedule" 
            dismissAction: [
                ActionItem {
                    title: "Ratings"
                    onTriggered: {
                        var pagina=calificaciones.createObject();
                        pagina.nav = navigation;
                        navigation.push(pagina);
                    }
                }
                
            ]
            acceptAction: [
                
                ActionItem {
                    title: "Add"
                    onTriggered: {
                        console.debug("BUTON WAS CLIKED")
                        var pagina = horarioedit.createObject();
                        pagina.nav = navigation;
                        navigation.push(pagina);
                    }
                
                }
            ]
        }
    Container {
        //background: Color.create("#111111")
        
        ListView {
            dataModel: horario_model
            listItemComponents: [
                ListItemComponent {
                    type: "header"
                    Header {
                        title: ListItemData.horainicial
                    }
                },
                ListItemComponent {
                    type: "item"
                    ListViewHorario {
                    }
                }
            ]
            onTriggered: {
                var pagina = horariodelete.createObject();
                pagina.nav = navigation;
                pagina.datagroup = dataModel.data(indexPath);
                mainObj.loadCalifiMateria(dataModel.data(indexPath).materia);
                navigation.push(pagina); 
            }
        }     
    }
    attachedObjects: [
        ImagePaintDefinition {
            id: backgroundmath
            imageSource: "Imagenes/Back/BackMath.amd"
            repeatPattern: RepeatPattern.XY
        },
        
        ComponentDefinition {
            id: horarioedit
            source: "HorarioEdit.qml"
        },
        ComponentDefinition {
            id: horariodelete
            source: "HorarioDelete.qml"
        },
        ComponentDefinition {
            id: calificaciones
            source: "Calificaciones.qml"
        }
        
    ]
}
}
