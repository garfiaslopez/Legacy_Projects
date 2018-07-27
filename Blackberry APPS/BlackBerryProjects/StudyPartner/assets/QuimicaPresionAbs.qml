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
                    text: "Absolute Pressure"
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
        
        ScrollView {
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            
            ImageView {
                imageSource: "Imagenes/Presionasb.png"
            }
        }
    }
    
    attachedObjects: [
        
        ImagePaintDefinition {
            id: backgroundLine
            imageSource: "Imagenes/Back/LineBack.amd"
            repeatPattern: RepeatPattern.XY
        }
    
    ]
}