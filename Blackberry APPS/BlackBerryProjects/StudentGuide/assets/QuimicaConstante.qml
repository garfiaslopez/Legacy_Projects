import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    text: "Constantes Quimicas"
                    textStyle{
                        color: Color.White
                        fontWeight: FontWeight.Default
                        fontSize: FontSize.Large                            
                    }
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }//label
            }//container
            expandableArea{
                content: Label {
                    text: "Valores constantes en el area de la quimica"
                }
                expanded: false
                toggleArea: TitleBarExpandableAreaToggleArea.Default
            }//Expandablearea
        }//KindProperties
    }//titleBar
    Container {
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
}
