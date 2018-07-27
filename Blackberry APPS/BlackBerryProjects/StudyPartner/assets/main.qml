import bb.cascades 1.2

TabbedPane {
    
     Menu.definition: MenuDefinition {
        
        // Specify the actions that should be included in the menu
        actions: [
            ActionItem {
                title: "About"
                imageSource: "Imagenes/ic_help.png"
                
                onTriggered: {
                          dialoginfo.open();             
                }
            }
        ] // end of actions list
    } // end of MenuDefinit
     
    showTabsOnActionBar: true
    
    
    Tab { //First tab
        // Localized text with the dynamic translation and locale updates support
        title: "Math"
        description : "¡Math is Radical!"
        imageSource : "/Imagenes/Tab1.png"
        Matematicas {
        }
    } //End of first tab
    Tab { //Second tab
        title: "Physics"
        description : "Nothing happens until something moves."
        imageSource : "/Imagenes/Tab2.png"
        Fisica {
        }
    } //End of second tab
    
    Tab {
        title: "Chemistry"
        description : "Life is chemistry, not biology."
        imageSource : "/Imagenes/Tab3.png"
        Quimica {
        }
    }
    Tab {
        title: "Notes"
        description : "Things & secret plans"
        imageSource : "/Imagenes/Tab4.png"
        Notas {
        }
    }
    Tab {
        title: "Homework"
        description: "You have to do it"
        imageSource : "/Imagenes/Tab5.png"
        Tareas {
        }
    }

    Tab {
        title: "Test your knowledge" //postear scores en Fb 
        description: "¡Accept the challengue!"
        imageSource : "/Imagenes/Tab8.png"
        TestyouStart {
        }
    }
    attachedObjects: [
        
        ImagePaintDefinition {
            id: backgroundLine
            imageSource: "Imagenes/Back/LineBack.amd"
            repeatPattern: RepeatPattern.XY
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