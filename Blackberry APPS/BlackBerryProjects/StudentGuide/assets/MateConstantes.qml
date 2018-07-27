import bb.cascades 1.2


Page {
    
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    multiline: true
                    text: "Constantes Matematicas"
                    textStyle {
                        color: Color.White
                        fontWeight: FontWeight.Default
                        fontSize: FontSize.Large
                    }
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
            expandableArea {
                content: Label {
                    multiline: true
                    text: "Valores constantes ya definidos en el lenguaje matematico."
                }
                expanded: false
                toggleArea: TitleBarExpandableAreaToggleArea.Default
            }
        }
    }
    Container {

        id: lista1
        ListView {

	        dataModel: XmlDataModel {
	            source: "Models/MatesConstantes.xml"
	        
	        }
	        listItemComponents: [
	            
	            ListItemComponent {
                    type: "listItem"
                    StandardListItem {
                        title: ListItemData.constante
                        status: ListItemData.title
                    }
	                
	                
	            }
	        ]
	    
	    }
        
    }
}
