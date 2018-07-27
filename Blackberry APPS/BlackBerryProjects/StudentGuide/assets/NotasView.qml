import bb.cascades 1.2



Page {
        
    id: notasViewPage
    
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    
                    text: "Ver Nota"
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
                        text: "Editar"
                        
                        onClicked: {
                             
                            
                        }
                    
                    }
                    
                    Button {
                        text: "borrar"
                    
                    	onClicked: {
                         
                        }
                    }
                    Button {
                       text: "Compartir"
                       
                       
                       onClicked: {
                           
                       }
                       
                       
                    }
                    
                }
                expanded: false
                toggleArea: TitleBarExpandableAreaToggleArea.Default
            }
        }
        
    }
    Container {
        
        
        Label {
            text: "HOLA PAGINA "
        }
        
    }
}
