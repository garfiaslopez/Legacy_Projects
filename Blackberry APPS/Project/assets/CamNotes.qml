import bb.cascades 1.2

NavigationPane {
    id: navigation
    
    
	Page {
		onCreationCompleted: {
     	 	mainObj.loadFotoNote();
     	 }

        titleBar: TitleBar {
            title : "Board Captures" 
            acceptAction: [
                ActionItem {
                    imageSource:"/Imagenes/ic_camera.png"
                    onTriggered: {
                        var pagina = saveFoto.createObject();
                        pagina.nav = navigation;
                        navigation.push(pagina);
                    }
                }
            ]
        }
	    Container {
	        layout: DockLayout {
	        }
	        
            ListView {
                id: lista
                objectName: "lista"
                dataModel: photoNotes_Model
                listItemComponents: [
                    ListItemComponent {
                    	type: "item"
                    	StandardListItem {
                         title: ListItemData.titulo
                         description: ListItemData.materia
                         imageSource: ListItemData.foto
                        }
                    }
                ] //listItemComponents
                onTriggered: {
                    
                    var pagina = zoomphoto.createObject();
                    pagina.nav = navigation;
                    pagina.data = dataModel.data(indexPath);
                    navigation.push(pagina);
                             
                }
            
            }
	    }
	}
	attachedObjects: [
	    ComponentDefinition {
         id: saveFoto
         source: "CamNotesTake.qml"
     },
	    ComponentDefinition {
         id: zoomphoto
         source: "CamNotesZoom.qml"
     }
	]
}