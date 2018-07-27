import bb.cascades 1.2

Page {
    
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    multiline: true
                    text: "Vectors"
                    textStyle {
                        color: Color.White
                        fontWeight: FontWeight.Default
                        fontSize: FontSize.Large
                    }
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
            expandableArea{
                content: Container {
                    background: backgroundLine.imagePaint
                    ImageView {
                        imageSource: "/Imagenes/Fisica/Vectores/1.png"
                        preferredHeight: 120
                    }
                    ImageView {
                        imageSource: "Imagenes/Fisica/Vectores/Vectors.png"
                        horizontalAlignment: HorizontalAlignment.Center
                        preferredHeight: 400	
                        preferredWidth: 400
                    }
                }
                expanded: true
            }
        }
        
    }
    Container {
        background: backgroundLine.imagePaint 
        ScrollView {
            scrollViewProperties.scrollMode: ScrollMode.Vertical
            
            Container {
                preferredWidth: 768
                
                Container {
                    preferredWidth: 768
                    layout: DockLayout {
                    
                    }
                    ImageView {
                        imageSource: "Imagenes/Ecuaciones/FormulaBack.png"
                    }
                    Container {
                        topPadding: 20
                        ImageView {
                            imageSource: "/Imagenes/Fisica/Vectores/2.png"
                            preferredHeight: 120
                        }
                    }
                }
                
                Container {
                    //Image
                    layout: DockLayout {
                    }
                    ImageView {
                        imageSource: "Imagenes/Ecuaciones/FormulaBack.png"
                    }
                    preferredWidth: 768
                    
                    Container {
                        topPadding: 20
                        ScrollView {
                            
                            scrollViewProperties.scrollMode: ScrollMode.Horizontal
                            ImageView {
                                imageSource: "Imagenes/Fisica/Vectores/3.png"
                                preferredHeight: 120
                                preferredWidth: 1600
                            }
                        
                        }
                    }
                }
                Container {
                    preferredWidth: 768
                    layout: DockLayout {
                    
                    }
                    ImageView {
                        imageSource: "Imagenes/Ecuaciones/FormulaBack.png"
                    }
                    Container {
                        topPadding: 20
                        ImageView {
                            imageSource: "/Imagenes/Fisica/Vectores/4.png"
                            preferredHeight: 120
                        }
                    }
                }
                Container {
                    preferredWidth: 768
                    layout: DockLayout {
                    
                    }
                    ImageView {
                        imageSource: "Imagenes/Ecuaciones/FormulaBack.png"
                    }
                    Container {
                        topPadding: 20
                        ImageView {
                            imageSource: "/Imagenes/Fisica/Vectores/5.png"
                            preferredHeight: 120
                        }
                    }
                }
                Container {
                    //Image
                    layout: DockLayout {
                    }
                    ImageView {
                        imageSource: "Imagenes/Ecuaciones/FormulaBack.png"
                    }
                    preferredWidth: 768
                    
                    Container {
                        topPadding: 20
                        ScrollView {
                            
                            scrollViewProperties.scrollMode: ScrollMode.Horizontal
                            ImageView {
                                imageSource: "Imagenes/Fisica/Vectores/6.png"
                                preferredHeight: 120
                                preferredWidth: 1600
                            }
                        
                        }
                    }
                }
                Container {
                    //Image
                    layout: DockLayout {
                    }
                    ImageView {
                        imageSource: "Imagenes/Ecuaciones/FormulaBack.png"
                        verticalAlignment: VerticalAlignment.Fill
                    }
                    preferredWidth: 768
                    
                    Container {
                        topPadding: 20
                        ScrollView {
                            
                            scrollViewProperties.scrollMode: ScrollMode.Horizontal
                            ImageView {
                                imageSource: "Imagenes/Fisica/Vectores/7.png"
                               // preferredHeight: 120
                                preferredWidth: 1600
                            }
                        
                        }
                    }
                }
                
                
                
                
                
                
            }
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