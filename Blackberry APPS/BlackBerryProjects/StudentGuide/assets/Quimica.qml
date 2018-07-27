import bb.cascades 1.2
import "Common"

NavigationPane {
    id: navigationQuimica
    
    Page {
        titleBar: TitleBar {
            kind: TitleBarKind.FreeForm
            kindProperties: FreeFormTitleBarKindProperties {
                Container {
                    layout: DockLayout {
                    }
                    Label {
                        text: "Quimica"
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
                    source: "/Models/QuimicaTemasList.xml"
                }
                listItemComponents: [
                    ListItemComponent {
                        type: "tema"
                        ListDefaultView {
                        }
                    }
                ]
                onTriggered: {
                    
                    var CeldaEscojida = dataModel.data(indexPath);
                    
                    pageSelectedQuimica.source = CeldaEscojida.file;
                    var pagina = pageSelectedQuimica.createObject();
                    //pagina.title = CeldaEscojida.title;
                    
                    navigationQuimica.push(pagina);
                                 
                }
            }
        }
    
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: pageSelectedQuimica
           //source: "QuimicaTablaPeriodica.qml"
        }
    
    ]
    onPopTransitionEnded: {
        page.destroy();
    }


}
