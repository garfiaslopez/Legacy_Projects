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
                    text: "Integrals"
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
        
    }
    attachedObjects: [
        
        ImagePaintDefinition {
            id: backgroundmath
            imageSource: "Imagenes/Back/fondo_cascaron.amd"
            repeatPattern: RepeatPattern.XY
        }
    
    ]
}