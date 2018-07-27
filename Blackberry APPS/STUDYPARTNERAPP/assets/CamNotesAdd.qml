import bb.cascades 1.2
import bb.system 1.2

Page {
    property variant nav 
    property string foto_direc
    
    titleBar: TitleBar {
        title : "   Add " 
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
                    if(materia.text !="" && titulo.text!=""){
                        
                        mainObj.saveFotoNote("file://"+foto_direc,materia.text,titulo.text);
                        mainObj.loadFotoNote();
                        nav.pop();
                        
                    }
                    else {
                        error.show();
                    }

                  
                } 
            }
        ]
    }
    ScrollView {
        
    
    Container {
        
        layout: StackLayout {
        }
        topPadding: 30
        
        ImageView {
            id: imagen
            preferredHeight: 400
            preferredWidth: 600
            horizontalAlignment: HorizontalAlignment.Center
            
            imageSource: "file://" + foto_direc
        }


        Container {
            horizontalAlignment: HorizontalAlignment.Center
            topPadding: 30
            Divider {
            
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "Subject:"
            }
            TextArea {
                id: materia
                horizontalAlignment: HorizontalAlignment.Center
                preferredWidth: 700
                hintText: "Enter subject"
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                text: "Title:"
            }
            TextArea {
                id: titulo
                horizontalAlignment: HorizontalAlignment.Center
                preferredWidth: 700
                hintText: "Enter title"
            }
        
            
        }

        
    }
    }
    attachedObjects: [
        SystemToast {
            id: error
            body: "Please, fill all the fields."
        }
    ]
}
