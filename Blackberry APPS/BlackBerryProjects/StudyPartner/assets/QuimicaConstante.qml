import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    text: "Chemical Constants"
                    textStyle{
                        color: Color.White
                        fontWeight: FontWeight.Default
                        fontSize: FontSize.Large                            
                    }
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }//label
            }//container

        }//KindProperties
    }//titleBar
    Container {
        background: linebackground.imagePaint
        id: listaQuimicaConstante
        ListView {
            
            dataModel: XmlDataModel {
                source: "Models/QuimicaConstantes.xml"
            
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
            id: linebackground
            imageSource: "Imagenes/Back/LineBack.amd"
            repeatPattern: RepeatPattern.XY
        }
    ]
}
