import bb.cascades 1.2
import "Common"

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
                    text: "Complex Numbers"
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
                    topPadding: 15
                    background: backgroundmath.imagePaint
                    
                    ImageView {
                        horizontalAlignment: HorizontalAlignment.Center
                        imageSource: "/Imagenes/Ecuaciones/NumComplex/NumComplejos.png"
                        preferredHeight: 400
                        preferredWidth: 400
                    }
                    Container {
                        layout: DockLayout {
                        }

                        Container {
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            topPadding: 15
                            leftPadding: 12
                            ImageView {
                                imageSource: "/Imagenes/Ecuaciones/NumComplex/UnidadImaginaria.png"
                                preferredHeight: 110
                                preferredWidth: 280
                            }
                            Label {
                                text: ""
                            }
                            
                            ImageView {
                                imageSource: "Imagenes/Ecuaciones/NumComplex/Zcomplejo.png"
                                preferredHeight: 100
                                preferredWidth: 420
                            }
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
        ListView {
            dataModel: XmlDataModel {
                source: "Models/MateNumerosCom.xml"
            }
            listItemComponents: [
                ListItemComponent {
                    type: "formula"
                    ListFormulasView {
                        
                    }
                }
            ]
        }
        
    }
    attachedObjects: [
        
        ImagePaintDefinition {
            id: backgroundmath
            imageSource: "Imagenes/Back/fondo_cascaron.amd"
            repeatPattern: RepeatPattern.XY
        }
    
    ]
}