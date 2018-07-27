import bb.cascades 1.2
import bb.system 1.2


Page {
    actions: [
        ActionItem {
            title: "Delete"
            imageSource: "/Imagenes/ic_delete.png"
            onTriggered: {
                mainObj.deleteData(indice);
                mainObj.saveData();
                
                nav.pop();       
            }          
            ActionBar.placement: ActionBarPlacement.OnBar
        },
        ActionItem {
                    title: "Save"
                    imageSource: "/Imagenes/ic_save.png"

                    onTriggered: {
                        
                        if(nuevotexto.text==""){
                            errornote.show();
                        }
                        else {
                            mainObj.editData(indice,nuevotexto.text);
                            mainObj.saveData();
                            
                            nav.pop();
                        }

                    }         
                    ActionBar.placement: ActionBarPlacement.OnBar
        },
        ActionItem {
            title: "Share"
            imageSource: "/Imagenes/ic_share.png"

            onTriggered: mainObj.share(nuevotexto.text);           
            ActionBar.placement: ActionBarPlacement.Default
        }
    ]
    
    property variant nav
    property variant indice
    property string texto    
    id: notasViewPage    
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {                    
                    text: "My Note"
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
        
        TextArea {
            id: nuevotexto
            backgroundVisible: false
            scrollMode: TextAreaScrollMode.Default
            preferredHeight: 1280
            text: texto
            //textStyle.color: Color.Black
        }  

         
    }
    attachedObjects: [

	   ImagePaintDefinition {
           id: backgroundLine
           imageSource: "Imagenes/Back/LineBack.amd"
           repeatPattern: RepeatPattern.XY 
	   },
	   SystemToast {
        id: errornote
        body: "Please, fill the note field."
    }
	   
    ]
}
