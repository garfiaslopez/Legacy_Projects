
import bb.cascades 1.0
import bb.cascades.multimedia 1.0
import bb.multimedia 1.0

Page {
    id: page
    
    actions: [
        ActionItem {
            title: "Capture"
            imageSource: "/Imagenes/ic_camera.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                camera.capturePhoto();
            }
        }
        
    ]
    property variant nav
    
    Container {
        background: Color.create("#11111")
        
        layout: DockLayout {}
        
        //! [0]
        // The camera preview control
        Camera {
            id: camera
            
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            onTouch: {
                if (event.isDown()) {
                    // Take photo
                    capturePhoto();
                }
            }
            onCameraOpened: {
                
                //mainObj.selectAspectRatio(camera, 9/16);
                
                // Apply some settings after the camera was opened successfully
                getSettings(cameraSettings)
                cameraSettings.focusMode = CameraFocusMode.ContinuousAuto
                cameraSettings.shootingMode = CameraShootingMode.Stabilization
                applySettings(cameraSettings)
                
                // Start the view finder as it is needed by the barcode detector
                camera.startViewfinder()
            }
            onPhotoSaved: {
                console.debug(fileName);
                var pagina = savephoto.createObject();
                pagina.nav=nav;
                pagina.foto_direc = fileName;
                nav.push(pagina);
            }
            
            
            onShutterFired: {
                // A cool trick here to play a sound. There are legal requirements in many countries to have a shutter-sound when
                // taking pictures. So we need this shutter sound if you are planning to submit you're app to app world.
                // So we play the shutter-fire sound when the onShutterFired event occurs.
                cameraSound.play();
            }
            onCameraResourceAvailable: {
                // This signal handler is triggered when the Camera resource becomes available to app
                // after being lost by for example putting the phone to sleep, once it has been received
                // it is possible to start the viewfinder again. 
                camera.startViewfinder()
            }
            
            onCreationCompleted: {
             // Open the front facing camera.                     
                     camera.open(CameraUnit.Rear);
             }
            //! [2]
            
            onCameraOpenFailed: {
                console.log("onCameraOpenFailed signal received with error " + error);
            }
            onViewfinderStartFailed: {
                console.log("viewfinderStartFailed signal received with error " + error);
            }
            onViewfinderStopFailed: {
                console.log("viewfinderStopFailed signal received with error " + error);
            }
            onPhotoCaptureFailed: {
                console.log("photoCaptureFailed signal received with error " + error);
            }
            onPhotoSaveFailed: {
                console.log("photoSaveFailed signal received with error " + error);
            }
            
            
            attachedObjects: [
                
                CameraSettings {
                    id: cameraSettings
                },
                SystemSound {
                    id: cameraSound
                    sound: SystemSound.CameraShutterEvent
                },
                ComponentDefinition {
                    id: savephoto
                    source:"CamNotesAdd.qml";
                }
            ]
            //! [2]
        }
        //! [0]
    }
}