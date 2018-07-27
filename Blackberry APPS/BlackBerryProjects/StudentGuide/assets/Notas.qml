import bb.cascades 1.2


NavigationPane {    
    
    id: navNotas
    Page {
        id: mainpage
        property variant numero
        
        titleBar:  TitleBar {
            kind: TitleBarKind.FreeForm
            kindProperties: FreeFormTitleBarKindProperties {
                Container {
                    layout: DockLayout {
                    }
                    Label {
                        
                        text: "Notas"
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
                    content: Label {
                        text: "Podras guardar diversas notas"
                    }
                    expanded: false
                    toggleArea: TitleBarExpandableAreaToggleArea.Default
                }
            }
        }
        Container {
            ListView {
                id: listNotas
                dataModel: ArrayDataModel {
                    id: notaArray
                }  
                onTriggered: {
                    var CeldaEscojida = dataModel.data(indexPath);
                    var number = indexPath;
                    mainpage.numero = indexPath;
                    
                    console.debug("NUMERO OF CELDA ES   "+ indexPath);
                    console.debug("CELDA ESCOJIDA ES  " + CeldaEscojida);                              
                    console.debug("EL TAMAÑO DEL ARREGLO ES  " + notaArray.size());
                    
                    pageNotaSelected.source = "NotasView.qml"
                    var pagina = pageNotaSelected.createObject();
                    navNotas.push(pagina);   
                    
                }
                
                gestureHandlers: [
                    LongPressHandler {
    
                        onLongPressed: {

                            //DELETE AT INDEX OF TABLE .. BUT HOW CAN I GET THE INDEX TOUCHED?
                            
                   
                        }
                    }
                ]
            }
            
            TextArea {
                id: nameField
                hintText: "Escribe aqui tu nota o lo que quieras."
                preferredHeight: 140
                horizontalAlignment: HorizontalAlignment.Fill
            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    text: "Añadir"
                    
                    onClicked: {
                        // If a name was typed in the text field, append
                        // it to the data model
                        if (nameField.text != "")
                            notaArray.append(nameField.text);
                                                    
                        nameField.text = "";          
                                                             
                    }
                }
              
            } // end of Container
        }
        
     }
    
     attachedObjects: [
         ComponentDefinition {
             id: pageNotaSelected
             source:"NotasView.qml"
         }
     ]
     onPopTransitionEnded: {
         page.destroy();
     }
    
    
}