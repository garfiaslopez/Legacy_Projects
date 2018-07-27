import bb.cascades 1.2
import "Common"

NavigationPane {
    id: navigationFisica
    
    Page {
        titleBar: TitleBar {
            kind: TitleBarKind.FreeForm
            kindProperties: FreeFormTitleBarKindProperties {
                Container {
                    layout: DockLayout {
                    }
                    Label {
                        text: "Fisica"
                        textStyle{
                            color: Color.White
                            fontWeight: FontWeight.Default
                            fontSize: FontSize.Large                            
                        }
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    }//label
                }//container
                expandableArea{
                    content: Label {
                        text: "Aqui metere la introduccion?"
                    }
                    expanded: false
                    toggleArea: TitleBarExpandableAreaToggleArea.Default
                }//Expandablearea
            }//KindProperties
        }//titleBar
        
        Container {
            ListView {
                id: fisicaListMain
                dataModel: XmlDataModel {
                    source: "/Models/FisicaTemasList.xml"
                }
                listItemComponents: [
                    ListItemComponent {
                        type: "tema"
                        ListDefaultView {
                        }
                    }
                ]
                onTriggered: {
                    var celdaescojida = dataModel.data(indexPath);
                    
                    pageSelectedFisica.source = celdaescojida.file;
                    var pagina = pageSelectedFisica.createObject();
                   // pagina.title = celdaescojida.title;
                    
                    navigationFisica.push(pagina);
                    
                }
            }
        }
        
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: pageSelectedFisica
           // source: "FisicaTema1.qml"
        }
        
    ]
    onPopTransitionEnded: {
        page.destroy();
    }
    
    
}

