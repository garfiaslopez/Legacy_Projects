import bb.cascades 1.2


Page {
    property NavigationPane nav

    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    multiline: true
                    text: "Math Constants"
                    textStyle {
                        color: Color.White
                        fontWeight: FontWeight.Default
                        fontSize: FontSize.Large
                    }
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
    }
    Container {
        background: backgroundmath.imagePaint
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
    attachedObjects: [
        ImagePaintDefinition {
            id: backgroundmath
            imageSource: "Imagenes/Back/BackMath.amd"
            repeatPattern: RepeatPattern.XY
        }
    ]

}
