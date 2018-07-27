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
                    text: "Physics Constants"
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
        background: lineBackground.imagePaint
        id: lista1
        ListView {
            
            dataModel: XmlDataModel {
                source: "Models/FisicaConstantes.xml"
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
            id: lineBackground
            imageSource: "Imagenes/Back/LineBack.amd"
            repeatPattern: RepeatPattern.XY
        }
    ]
}