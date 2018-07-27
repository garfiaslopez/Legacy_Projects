import bb.cascades 1.2
import "Common"

NavigationPane {
    id: navigationFisica
    
    Page {
        property variant quotes: ["“It should be possible to explain the laws of physics to a barmaid.”\n-Albert Einstein","“All science is either physics or stamp collecting.”\n-Ernest Rutherford","“Not only is the universe stranger than we imagine, it is stranger than we can imagine.”\n-Sir Arthur Eddington","“Relativity applies to physics, not ethics.”\n-Albert Einstein","“Nothing happens until something moves.”― Albert Einstein"]
        property int numrandom: (Math.random()*4)
        
        
        onCreationCompleted: {
            
            console.debug(numrandom);
            
            labelquotePhy.text = quotes[numrandom];
            
            console.debug(quotes[numrandom]);
        
        }
        
        titleBar: TitleBar {
            kind: TitleBarKind.FreeForm
            kindProperties: FreeFormTitleBarKindProperties {
                Container {
                    layout: DockLayout {
                    }
                    Label {
                        text: qsTr("Physics")
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
                    content: Container {
                        leftPadding: 35
                        Label {                        
                            id: labelquotePhy    
                            multiline: true         
                            textStyle{
                                fontSize: FontSize.Medium
                                color: Color.create ("#7a184a")
                                fontStyle: FontStyle.Italic
                            }
                        }
                    
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

