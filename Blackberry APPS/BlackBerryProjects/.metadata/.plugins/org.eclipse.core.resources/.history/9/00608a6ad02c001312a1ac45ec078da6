import bb.cascades 1.2
import "Common"

Page {
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    multiline: true
                    text: "Areas y Perimetros"
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
                    text: "Formulas para deducir area y perimetro de algunas figuras geometricas:"
                }
                expanded: false
                toggleArea: TitleBarExpandableAreaToggleArea.Default
            }
        }
    }
    ListView {
        id: listadeAreas
        dataModel: XmlDataModel {
            source: "Models/AreasMates.xml"
        }
        listItemComponents: [
            ListItemComponent {
                type: "titulo"
                ListAreaView {
                }
            }
        ]
        
    }
    
    
    
    
}
