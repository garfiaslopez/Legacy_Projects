import bb.cascades 1.2
import QtMobilitySubset.location 1.1
import bb.platform 1.0

TabbedPane {
    
    
    onCreationCompleted: {
        if (mainObj.primeraVista()==0){
            mainObj.primeraVistaQuitar();
            tutorial.open();
        }
    }

    property string latitude
    property string longitude
    property variant currentCoord
    
     Menu.definition: MenuDefinition {
        
        // Specify the actions that should be included in the menu
        actions: [
            ActionItem {
                title: "About"
                imageSource: "Imagenes/ic_help.png"
                
                onTriggered: {
                          dialoginfo.open();             
                }
            },
            ActionItem {
                title: "Go study"
                imageSource: "/Imagenes/ic_map.png"
                onTriggered: {
                    //DO THE LOCATION
                    positionSource.start(); 
                    locationInvokerID.go();   
                }
            },
            ActionItem {
                title: "Profile"
                imageSource: "Imagenes/Tab7.png"
                onTriggered: {
                    mySheet.open();
                }
            }
        ] // end of actions list
    } // end of MenuDefinit
     
    showTabsOnActionBar: true
    
    
    Tab { //First tab
        // Localized text with the dynamic translation and locale updates support
        title: qsTr ("Math")
        description :qsTr("¡Math is Radical!")
        imageSource : "/Imagenes/Tab1.png"
        Matematicas {
        }
    } //End of first tab
    Tab { //Second tab
        title: qsTr("Physics")
        description : qsTr("Nothing happens until something moves.")
        imageSource : "/Imagenes/Tab2.png"
        Fisica {
        }
    } //End of second tab
    
    Tab {
        title: qsTr("Chemistry")
        description : qsTr("Life is chemistry, not biology.")
        imageSource : "/Imagenes/Tab3.png"
        Quimica {
        }
    }
    Tab {
        title: qsTr("Notes")
        description : qsTr("Things & secret plans")
        imageSource : "/Imagenes/ic_notes.png"
        Notas {
        }
    }
    Tab {
        title: qsTr("Board Captures")
        description: qsTr("Use camera for notes")
        imageSource: "/Imagenes/ic_camera.png"
        CamNotes {
        }
    }
    Tab {
        title: qsTr("Schedule")
        description: qsTr("Your class hours")
        imageSource: "/Imagenes/Tab6.png"
        Horario {
        }
    }
    
    Tab {
        title: qsTr("Homework")
        description: qsTr("You must do")
        imageSource : "/Imagenes/Tab5.png"
        Tareas {
        }
    }
    Tab {
        title: qsTr("Test your knowledge") //postear scores en Fb 
        description: qsTr("¡Accept the challenge!")
        imageSource : "/Imagenes/Tab8.png"
        TestyouStart {
        }
    }
    attachedObjects: [
        Sheet {
            id: tutorial
            Intro {
                sheet: tutorial
            }
        },
        
        Sheet {
            id: mySheet
            Perfil {
                sheet: mySheet
            }
        },
        
        LocationMapInvoker {
            id: locationInvokerID
            
            
            centerLatitude :  mainObj.location2double(latitude);   
            centerLongitude : mainObj.location2double(longitude);        
            altitude : 200
            
           
            locationLatitude : mainObj.location2double(latitude);
            locationLongitude : mainObj.location2double(longitude);
            locationName : "My location"

            searchText : "libraries"
            searchLatitude : mainObj.location2double(latitude);
            searchLongitude : mainObj.location2double(longitude);
            
        },
        
        /// Location base
        PositionSource {
            id: positionSource //! Desired interval between updates in milliseconds
            updateInterval: 100 //! When position changed, update the location strings
            onPositionChanged: {
                currentCoord = positionSource.position.coordinate;
                latitude = currentCoord.latitude;
                longitude = currentCoord.longitude;
                console.log("latitude-----------------------------------"+latitude, "longitude--------------------------------------"+longitude);
                positionSource.stop();
                console.debug("YA CONSIGIO LATITUDE?");

            }

        },
        
        ImagePaintDefinition {
            id: backgroundLine
            imageSource: "Imagenes/Back/LineBack.amd"
            repeatPattern: RepeatPattern.XY
        },
        ComponentDefinition {
            id: perfil
            Perfil {
            }
        },
        Dialog {
            id: dialoginfo
            Container {
                preferredWidth: 768
                preferredHeight: 1280
                background: Color.create (0.0, 0.0, 0.0, 0.5)
                layout: DockLayout {
                }
                
                Container {
                    //maxHeight: 450
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    
                    layout: DockLayout {
                    }
                    
                    Container {
                        background: backgroundLine.imagePaint
                        horizontalAlignment: HorizontalAlignment.Center
                        preferredWidth: 700
                        preferredHeight: 680
                    }
                    Container {
                        topPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        preferredWidth: 650
                    
	                    Label {
	                        textStyle.fontStyle: FontStyle.Italic
	                        
	                        multiline: true
	                        text:"Hi, Thank you for downloading ¡Study Partner! We hope that you can enjoy this amazing app that only have the objetive of help to you in your school.\n\n ¡Good Luck!\n "
	                    }
	                    Container {
                            horizontalAlignment: HorizontalAlignment.Center
                     
		                    Label {
	                         	horizontalAlignment: HorizontalAlignment.Center
	                         	multiline: true
	                         	text: "Developer: \n Jose De Jesus Garfias Lopez \n Graphic Designer: \n Pedro Mario Martinez Ramos"
	                        }
	                    }
	                    Divider {
                         
                        }
	                    Button {
	                        horizontalAlignment: HorizontalAlignment.Center
                         text: "Ok"
                         onClicked: {
                             dialoginfo.close();
                         }
                        }
	                }
                    
                }
            }
        }
    ]
    
    //DOCTOS DE TAREAS DE DIF MATERIAS... (INVOCATION FRAMEWORK; TRANSFERENCIA NFC;)
    //Postear cosas en fb tw, invocation framwork, 
    //BBM CHANNELS  COMPARTIR....

}