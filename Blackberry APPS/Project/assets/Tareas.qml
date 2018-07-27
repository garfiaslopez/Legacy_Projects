import bb.cascades 1.2
import bb.system 1.2

import "Common"

NavigationPane {
    id: navtareas
    Page {	      
        
        onCreationCompleted: {
            mainObj.loadEvents();
        }
        
        titleBar:  TitleBar {
            kind: TitleBarKind.FreeForm
            kindProperties: FreeFormTitleBarKindProperties {
                Container {
                    layout: DockLayout {
                    }
                    Label {
                        
                        text: "Homework"
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
        	//background: Color.create("#111111")
        	
        	ListView {
             	id: tareas
             	dataModel: tareas_modelList
             	
             	onTriggered: {
                  	var pagina = pageTareaSelected.createObject();
                  	pagina.navigation = navtareas;
                  	pagina.texto = dataModel.data(indexPath);
                  	navtareas.push(pagina);
              }
            }
        	Divider {
             
            }
        	Container {
            	TextArea {
            	    
            	    preferredHeight: 150
                    id: subject
                    hintText: "Enter Subject"
                } 
            }
        	
        	DateTimePicker {
        	    id: tiempo
        	    mode: DateTimePickerMode.DateTime
                title: "Delivery Date:"
             
            }
        	DateTimePicker {
        	    id: reminder
             	title: "Remind me before Delivery:"
                mode: DateTimePickerMode.Timer
            }

        	Button {
             id: add
             horizontalAlignment: HorizontalAlignment.Fill
             text: "Remind Me"
             onClicked: {
                 if(subject.text != ""){
                 		mainObj.addNewEvent(subject.text,tiempo.value,reminder.value);
                         ok.show();     
                 }
                 else {
                     errorwork.show();
                 }
                 subject.text="";
             }
            }
        	Label {
             
            }
        	

        }
        
    }
    attachedObjects: [
        SystemToast {
            id: ok
            body: "¡Perfect! i will remind you."
        },
        SystemToast {
            id:errorwork
            body: "Please, fill the subject field."
        },
        ComponentDefinition {
            id: pageTareaSelected
            source:"TareasDetail.qml"
        },
        ImagePaintDefinition {
            id: backgroundLine
            imageSource: "Imagenes/Back/LineBack.amd"
            repeatPattern: RepeatPattern.XY
        }
    ]
    
}