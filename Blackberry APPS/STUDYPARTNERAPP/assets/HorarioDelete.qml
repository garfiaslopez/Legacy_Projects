import bb.cascades 1.2
import bb.system 1.2

Page {
    property variant nav    
    property variant datagroup

    actions: [
        ActionItem {
            title: "Delete"
            imageSource: "/Imagenes/ic_delete.png"
            onTriggered: {
                
                mainObj.deleteMateria(datagroup.materia,datagroup.elemento);
                mainObj.loadMateria();
                nav.pop();
   
            }          
            ActionBar.placement: ActionBarPlacement.OnBar
        }
    ]
    titleBar: TitleBar {
        title : "Detail - Edit " 
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
                    
                    if(horainicio.value >= horafinal.value){
                        error.show();
                    }
                    else if(materia.text==""||maestro.text==""){
                        errorname.show();
                    }
                    else {
                        ok.show();
                        mainObj.deleteMateria(datagroup.materia,datagroup.elemento);
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
       // background: Color.create("#111111")
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
            text: datagroup.materia
        }
        
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text: "Proffesor:"
        
        }
        
        TextField {
            id: maestro
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 730
            text: datagroup.maestro
        }
        
        Divider {
        
        }
        
        DateTimePicker {
        	
            id: horainicio
            mode: DateTimePickerMode.Time
            title: "This class start:"
            preferredWidth: 730
            horizontalAlignment: HorizontalAlignment.Center
            value: horainicio.dateFromTime(datagroup.horainicial +"00")
        }
        
        Label {
        
        }
        DateTimePicker {
            id: horafinal
            mode: DateTimePickerMode.Time
            title: "This class End:"
            preferredWidth: 730
            horizontalAlignment: HorizontalAlignment.Center
            value: horainicio.dateFromTime(datagroup.horafinal +"00")

        }
        
        Divider {
        
        }
        
        Label {
            horizontalAlignment: HorizontalAlignment.Center
            text: "Notes:"
        }
        
        ListView {
            dataModel: individual_model
            
            listItemComponents: [
                ListItemComponent {
                    type: "item"
                    StandardListItem {
                        title: ListItemData.parcial
                        status: ListItemData.calificacion
                    }
                }
            ]
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