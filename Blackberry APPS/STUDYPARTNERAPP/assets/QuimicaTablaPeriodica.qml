import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    text: "Periodic Table"
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
        background: backgroundLine.imagePaint
        
        layout: DockLayout {}
        
        ScrollView {

            scrollViewProperties{
                
                scrollMode: ScrollMode.Both
                pinchToZoomEnabled: true
                minContentScale: 1
                maxContentScale: 4
                
        }
            
            
            preferredHeight: 1150
            preferredWidth: 768
	            
	            
	        ImageView {
	            id: myImage

	            preferredHeight: 1200
	            preferredWidth: 768
	            
	            horizontalAlignment: HorizontalAlignment.Center
	            verticalAlignment: VerticalAlignment.Center
	            
	            imageSource: "/Imagenes/TablaP.png"
	            
	          
	        } // end of ImageView
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
