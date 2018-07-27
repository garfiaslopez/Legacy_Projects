import bb.cascades 1.2

Page {
    property variant navigation
    property string texto
    
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    
                    text: "Detail "
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
	    
	    TextArea {
        	backgroundVisible: false
        	editable: false
        	text: texto
        	 
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
