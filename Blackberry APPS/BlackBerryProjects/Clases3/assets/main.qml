import bb.cascades 1.0

Page {
    content: Container {
        // The top-level container uses a dock layout so that the
        // image can always remain centered on the screen as it
        // changes size
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
            
            imageSource: "Image.jpg"
            
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
    } // end of Container
} // end of Page