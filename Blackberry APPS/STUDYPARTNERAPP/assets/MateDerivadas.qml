import bb.cascades 1.2
import "Common"

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
                    text: "Derivates"
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
        
        ListView {
            dataModel: XmlDataModel {
                source: "/Models/MateDerivadas.xml"
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
            id: backgroundmath
            imageSource: "Imagenes/Back/fondo_cascaron.amd"
            repeatPattern: RepeatPattern.XY
        }
    
    ]
}