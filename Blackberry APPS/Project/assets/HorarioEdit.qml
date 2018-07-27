import bb.cascades 1.2
import bb.system 1.2

Page {
    property variant nav    
    
    titleBar: TitleBar {
        title : "      Add " 
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
                    //ANTES DE SALVAR COMPARA 
                    
                     if(horainicio.value >= horafinal.value){
                        error.show();
                    }
                     else if(materia.text==""||maestro.text==""){
                         errorname.show();
                     }
                    else {
                        ok.show();
                        mainObj.saveMateria(materia.text,maestro.text,horainicio.value,horafinal.value);
                        mainObj.loadMateria();
                        nav.pop(); 
                    }
                    

                }
            
            }
        ]
        
    
    }
    ScrollView {
        
    
    Container {
       // background: Color.create("#1111111")
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
            text: "Proffesor:"
        
        }
        
        TextField {
            id: maestro
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 730
            hintText: "Enter your proffesor"
        }
        
        Divider {
            
        }
        
        DateTimePicker {
            id: horainicio
            mode: DateTimePickerMode.Time
            title: "This class start:"
            preferredWidth: 730
            horizontalAlignment: HorizontalAlignment.Center
        }
        
        Label {
            
        }
        DateTimePicker {
            id: horafinal
            mode: DateTimePickerMode.Time
            title: "This class End:"
            preferredWidth: 730
            horizontalAlignment: HorizontalAlignment.Center
        }
    }
    }
    attachedObjects: [
        SystemToast {
          id: errorname
          body: "Please, fill all the fields."  
        },
        SystemToast {
            id: error
            body: "Start class time can´t be the same or more than the end of class time."

        },
        SystemToast {
            id: ok
            body: "Ok, saved."
        }
    ]
}
