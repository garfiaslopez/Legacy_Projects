import bb.cascades 1.2
import bb.system 1.2

NavigationPane {    
    id: navNotas
    Page {
        onCreationCompleted: {
            mainObj.loadData();
        }
        id: mainpage
        property variant numero
        
        titleBar:  TitleBar {
            kind: TitleBarKind.FreeForm
            kindProperties: FreeFormTitleBarKindProperties {
                Container {
                    layout: DockLayout {
                    }
                    Label {
                        
                        text: "Notes"
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
            background: backgroundLine.imagePaint
            ListView {
                id: listNotas
                dataModel: listmodel 
                onTriggered: {
                               
                    var pagina = pageNotaSelected.createObject();
                    pagina.indice = indexPath;
                    pagina.texto = dataModel.data(indexPath);
                    pagina.nav = navNotas;
                    
                    navNotas.push(pagina);   
                    
                }
            }
            
            TextArea {
                
                id: nameField
                hintText: "Write something here..."
                preferredHeight: 140
                horizontalAlignment: HorizontalAlignment.Fill
            }
            
            Container {
                bottomPadding: 20
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: "Add"
                    
                    onClicked: {
                        // If a name was typed in the text field, append
                        // it to the data model
                        if (nameField.text != ""){
                            
                            mainObj.addData(nameField.text);
                            mainObj.saveData();
                            donetoast.show();
                        }
                                                    
                        nameField.text = "";          
                                                             
                    }
                }
              
            } // end of Container
        }
        
     }
    
     attachedObjects: [
     	SystemToast {
        	id: donetoast
        	body: "¡Ok!, saved"  
        },
         
         ComponentDefinition {
             id: pageNotaSelected
             source:"NotasView.qml"
         },
         ImagePaintDefinition {
             id: backgroundLine
             imageSource: "Imagenes/Back/LineBack.amd"
             repeatPattern: RepeatPattern.XY
         }
     ]
     onPopTransitionEnded: {
         page.destroy();
         
     }
    
    
}