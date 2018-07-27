import bb.cascades 1.2

Page {
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
            expandableArea {
                content: Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }                            
                    Button {
                        text: "Save"                       
                        onClicked: {                             
                             mainObj.editData(indice,nuevotexto.text);
                             mainObj.saveData();

                             nav.pop();
                        }
                    }   
                    Button {
                        text: "Delete"
                    	onClicked: {    	    
                    	    mainObj.deleteData(indice);
                            mainObj.saveData();

                    	     nav.pop();                        
                        }
                    }
                    Button {
                       text: "Share"
                       onClicked: {    
                           mainObj.share(nuevotexto.text);           
                       }
                    }   
                }
                expanded: true
                toggleArea: TitleBarExpandableAreaToggleArea.Default
            }
        }   
        
        
    }
    Container {
        background: backgroundLine.imagePaint
        TextArea {
            id: nuevotexto
            backgroundVisible: false
            scrollMode: TextAreaScrollMode.Default
            preferredHeight: 1280
            text: texto
        }   
    }
    attachedObjects: [

	   ImagePaintDefinition {
           id: backgroundLine
           imageSource: "Imagenes/Back/LineBack.amd"
           repeatPattern: RepeatPattern.XY 
	   }
    ]
}
