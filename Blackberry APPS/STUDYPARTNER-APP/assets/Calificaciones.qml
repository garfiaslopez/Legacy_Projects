import bb.cascades 1.2
import "Common"    
    
	Page {
	    onCreationCompleted: {
         mainObj.loadCalificacion();
     }
        property variant nav

        titleBar: TitleBar {
            title : "Ratings" 
            dismissAction: [
                ActionItem {
                    title: "Cancel"
                    onTriggered: {
                        nav.pop();
                    }
                }
            ]
            
            acceptAction: [
                
                ActionItem {
                    title: "Add"
                    onTriggered: {
                        
                    	var pagina = calificacionesadd.createObject();
                    	pagina.nav = nav;
                    	nav.push(pagina);
                    	
                    }
                
                }
            ]
        }
	    Container {
	        //background: Color.create("#111111")
	        
            ListView {
                dataModel: calificaciones_model
                listItemComponents: [
                    ListItemComponent {
                        type: "header"
                        Header {
                            title:  ListItemData  //"Materia: " + ListItemData.materia                            
                        }
                    },
                    ListItemComponent {
                        type: "item"
                        StandardListItem {
                            title: ListItemData.parcial
                            description: ListItemData.materia
                            status: ListItemData.calificacion
                        }
                    }
                    
                ]
                onTriggered: {
                	var pagina = calificacionesedit.createObject();
                	pagina.nav = nav;
                	pagina.groupdata = dataModel.data(indexPath);
                	nav.push(pagina);
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
                id: calificacionesadd
                source: "CalificacionesAdd.qml"
            },
            ComponentDefinition {
                id: calificacionesedit
                source: "CalificacionesEdit.qml"
            }
        ]
	}