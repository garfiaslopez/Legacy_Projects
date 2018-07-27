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
        background: Color.create("#111111")
        id: listaQuimicaConstante
        ListView {
            
            dataModel: XmlDataModel {
                source: "Models/QuimicaConstantes.xml"
            
            }
            listItemComponents: [
                
                ListItemComponent {
                    type: "listItem"
                    Container {
                        
                        topPadding: 5
                        bottomPadding: 5
                        
                        
                        Container {
                            horizontalAlignment: HorizontalAlignment.Left
                            Label {
                                text: ListItemData.constante
                                textStyle.color: Color.White
                            }
                        
                        }
                        
                        Container {
                            horizontalAlignment: HorizontalAlignment.Right
                            Label {
                                text: ListItemData.title
                                textStyle.color: Color.DarkGray
                            
                            }
                        }
                    
                    
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
