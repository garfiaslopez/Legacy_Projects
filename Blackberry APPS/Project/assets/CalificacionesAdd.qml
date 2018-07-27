import bb.cascades 1.2
import bb.system 1.2

Page {
    property variant nav
    titleBar: TitleBar {
        title : "   Add" 
        dismissAction: [
            ActionItem {
                title: "Cancel"
                onTriggered: {
                    nav.pop();
                }
            }
            
        ]
        
        acceptAction: [
            
            ActionItem {
                title: "Save"
                onTriggered: {
                    
                    if(materia.text==""||parcial.text==""||calificacion.text==""){
                        errorname.show();
                    }
                    else {
                        ok.show();
                        mainObj.saveCalificacion(materia.text,parcial.text,calificacion.text);
                        mainObj.loadCalificacion();
                        nav.pop();                        
                    }

                
                }
            
            }
        ]
    }
    ScrollView {
        
    
    Container {
        //background: Color.create("#111111")
        
        topPadding: 10
        layout: StackLayout {
        
        }
        
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text: "Subject:"
        
        }
        
        TextField {
            id: materia
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 730
            hintText: "Enter your subject"
        }
        
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text: "Evaluation:"
        
        }
        
        TextField {
            id: parcial
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 730
            hintText: "Enter your evaluation name"
        }
        
        Divider {
        
        }
        
        Container {
            
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            horizontalAlignment: HorizontalAlignment.Center
            
            Label {
                text: "Note:          "
                verticalAlignment: VerticalAlignment.Center
            }
            TextField {
                id: calificacion
                preferredWidth: 200
                hintText: "Rating"
            }
        }

        
    }
    }
    attachedObjects: [
        ImagePaintDefinition {
            id: backgroundmath
            imageSource: "Imagenes/Back/BackMath.amd"
            repeatPattern: RepeatPattern.XY
        },
        SystemToast {
            id:errorname
            body: "Please, fill all the fields."
        },
        SystemToast {
            id: ok
            body: "Ok, saved."
        }
        
    ]
}
