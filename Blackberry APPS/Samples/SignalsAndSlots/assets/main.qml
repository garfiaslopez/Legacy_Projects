import bb.cascades 1.0
import CustomTimer 1.0
 
Page {
    content: Container {
        id: root
        layout: DockLayout {}
        
        property int currentCount: 0
                 
        Timer {
            id: lightTimer
             
            // Specify a timeout interval of 1 second
            interval: 1000
            
            onTimeout: {
                // Decrement the counter and update the countdown text
                root.currentCount -= 1;
                timerDisplay.text = "" + root.currentCount;
                 
                // When the counter reaches 0, change the traffic light
                // state, stop the countdown timer, and start the pause
                // timer
                if (root.currentCount == 0) {
                    trafficLight.changeLight();
                    lightTimer.stop();
                    pauseTimer.start();
                }
            } // end of onTimeout signal handler
        } // end of Timer
        
        Timer {
            id: pauseTimer
             
            // Specify a timeout interval of 2 seconds 
            interval: 2000
         
            // When the timeout interval elapses, change the traffic
            // light state, enable the "Change!" button, and stop
            // the pause timer
            onTimeout: {
                trafficLight.changeLight();
                changeButton.enabled = true;
                pauseTimer.stop();
            }
        }
        
        ImageView {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            imageSource: "asset:///images/background.png"
        }
        
        // A container to hold both the upper and lower sections of the UI
        Container {
            layout: StackLayout {}

            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            // A container for the upper section
            Container {
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }
                 
                // Our custom TrafficLight component
                TrafficLight {
                    id: trafficLight

                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Bottom
                }
            }
            
            // A container for the lower section
            Container {
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }
                 
                // The button that changes the traffic light
                Button {
                    id: changeButton
                    
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    text: "Change!"
                    
                    onClicked: {
                        // Change the traffic light state
                        trafficLight.changeLight();
                         
                        // Set the initial countdown time
                        root.currentCount = 9;
                         
                        // Start the countdown timer
                        lightTimer.start();
                         
                        // Update the countdown text
                        timerDisplay.text = "" + root.currentCount;
                         
                        // Disable the "Change!" button
                        changeButton.enabled = false;
                    }
                }
                 
                // The text area that displays the countdown
                TextArea {
                    id: timerDisplay

                    horizontalAlignment: HorizontalAlignment.Center
                    preferredWidth: 67
                     
                    // Apply a text style to create centered body text
                    textStyle {
                        base: SystemDefaults.TextStyles.BodyText
                        textAlign: TextAlign.Center
                    }
                    text: "0"
                }
            } // end of lower section Container
        } // end of upper and lower section Container
    } // end of top-level Container
} // end of Page