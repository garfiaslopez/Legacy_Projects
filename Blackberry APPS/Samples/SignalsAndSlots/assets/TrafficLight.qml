import bb.cascades 1.0
 
Container {
    id: root
    layout: AbsoluteLayout {}
    
    // The frame of the traffic light
    ImageView {
        id: trafficLightFrame
        imageSource: "asset:///images/traffic_light_frame.png"
    }
         
    // The red light
    ImageView {
        id: redLight
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 40
            positionY: 41
        }
        imageSource: "asset:///images/red_light.png"
        opacity: 1.0
    }
         
    // The yellow light
    ImageView {
        id: yellowLight
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 39
            positionY: 196
        }
        imageSource: "asset:///images/yellow_light.png"
        opacity: 0.0
    }
         
    // The green light
    ImageView {
        id: greenLight
        layoutProperties: AbsoluteLayoutProperties {
            positionX: 38
            positionY: 351
        }
        imageSource: "asset:///images/green_light.png"
        opacity: 0.0
    }
    
    function changeLight() {
        if (redLight.opacity == 1.0) {
            // If the light is red, change it to green
            redLight.opacity = 0.0;
            greenLight.opacity = 1.0;
        } else if (greenLight.opacity == 1.0) {
            // If the light is green, change it to yellow
            greenLight.opacity = 0.0;
            yellowLight.opacity = 1.0;
        } else {
            // If the light is yellow, change it to red
            yellowLight.opacity = 0.0;
            redLight.opacity = 1.0;
        }
    } // end of changeLight() function
} // end of top-level Container