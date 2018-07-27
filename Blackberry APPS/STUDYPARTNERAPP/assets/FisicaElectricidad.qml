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
                    text: "Electricity"
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
        background: backgroundLine.imagePaint        
        
        ListView {
            dataModel: XmlDataModel {
                source: "Models/FisicaElectricidad.xml"
            }
            listItemComponents: [
                ListItemComponent {
                    type: "formula"
                    ListFormulasView {
                    
                    }
                }
            ]
        }
    }
    
    attachedObjects: [
        
        ImagePaintDefinition {
            id: backgroundLine
            imageSource: "Imagenes/Back/fondo_cascaron.amd"
            repeatPattern: RepeatPattern.XY
        }
    
    ]
}