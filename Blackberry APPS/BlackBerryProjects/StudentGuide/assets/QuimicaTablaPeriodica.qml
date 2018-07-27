import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    text: "Tabla Periodica"
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
                    multiline: true
                    text: "Lo siento aun no hay tabla periodica pero conformate con esta imagen de un anime :D"
                }
                expanded: false
                toggleArea: TitleBarExpandableAreaToggleArea.Default
            }//Expandablearea
        }//KindProperties
    }//titleBar
    Container {
        
        layout: DockLayout {}
        
        ImageView {
            id: myImage
            
            // This custom property stores the initial scale of the
            // image when a pinch gesture begins
            property double initialScale: 1.0
            
            // This custom property determines how quickly the image
            // grows or shrinks in response to the pinch gesture
            property double scaleFactor: 0.8
            
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            
            imageSource: "/Imagenes/Image.jpg"
            
            gestureHandlers: [
                // Add a handler for pinch gestures
                PinchHandler {
                    // When the pinch gesture starts, save the initial
                    // scale of the image
                    onPinchStarted: {
                        myImage.initialScale = myImage.scaleX;
                    }
                    
                    // As the pinch expands or contracts, change
                    // the scale of the image
                    onPinchUpdated: {
                        myImage.scaleX = myImage.initialScale +
                        ((event.pinchRatio - 1) *
                        myImage.scaleFactor);
                        myImage.scaleY = myImage.initialScale +
                        ((event.pinchRatio - 1) *
                        myImage.scaleFactor);
                    }
                }
            ]
        } // end of ImageView
        
    }
}
