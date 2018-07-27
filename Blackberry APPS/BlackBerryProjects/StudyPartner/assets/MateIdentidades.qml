import bb.cascades 1.2

Page {
    property NavigationPane nav

    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    multiline: true
                    text: "Trigonometric Identities"
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
                    background: backgroundmath.imagePaint

                    layout: StackLayout {
                    }
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Definitions:"
                    }
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        ImageView {
                            imageSource: "/Imagenes/Ecuaciones/identidades/tan.png"
                            preferredHeight: 110
                            preferredWidth: 360
                        }
                        Divider {
                            
                        }
                        ImageView {
                            imageSource: "/Imagenes/Ecuaciones/identidades/sec.png"
                            preferredHeight: 110
                            preferredWidth: 360
                        }
                        ImageView {
                            imageSource: "/Imagenes/Ecuaciones/identidades/csc.png"
                            preferredHeight: 110
                            preferredWidth: 360
                        }
                    }
                    Divider {
                        
                    }
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        Label {
                            text: "         "
                        }
                        ImageView {
                            imageSource: "/Imagenes/Ecuaciones/identidades/cot.png"
                            preferredHeight: 130
                            preferredWidth: 600
                        }
                    }
                    Divider {
                        
                    }
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        Label {
                            text: "         "
                        }
                        ImageView {
                            imageSource: "/Imagenes/Ecuaciones/identidades/sen2.png"
                            preferredHeight: 90
                            preferredWidth: 600
                        }

                    }
                    Divider {
                        
                    }
                }
                expanded: true
            }
        }
    }
    Container {
        background: backgroundmath.imagePaint
        ScrollView {
            preferredHeight: 1300
            preferredWidth: 768
        
	        ImageView {
	            imageSource: "/Imagenes/Ecuaciones/identidades/IdentidadesTrigo.png"
	            preferredHeight: 1300
	            preferredWidth: 768
	        }
        }
    }
    attachedObjects: [
        
        ImagePaintDefinition {
            id: backgroundmath
            imageSource: "Imagenes/Back/BackMath.amd"
            repeatPattern: RepeatPattern.XY
        }
    
    ]
}