import bb.cascades 1.2

Page {
    titleBar:  TitleBar {
        id: titulo
        property variant numrand
        
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    
                    text: "Angles"
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
        
        ScrollView {
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            
            ImageView {
                imageSource: "/Imagenes/AngulosNotables.png"
            }
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
