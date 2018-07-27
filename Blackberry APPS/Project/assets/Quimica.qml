import bb.cascades 1.2
import "Common"

NavigationPane {
    id: navigationQuimica
    
    Page {
        
        property variant quotes: ["“The meeting of two personalities is like the contact of two chemical substances: if there is any reaction, both are transformed.”\n― C.G. Jung","“Scientist believe in things, not in person ”\n― Marie Curie","“To think is to practice brain chemistry.”\n-Deepack Chopra","“Skills are cheap; chemistry is expensive.”\n-Mal Pancoast","“The chemistry involved made everything Factory did quite special.”\n-Peter Hook","“You have to look at how chemistry develops.”\n-Tim Hardaway"]
        property int numrandom: (Math.random()*5)
        
        
        onCreationCompleted: {
            
            console.debug(numrandom);
            
            labelquotechem.text = quotes[numrandom];
            
            console.debug(quotes[numrandom]);
        
        }
        
        titleBar: TitleBar {
            kind: TitleBarKind.FreeForm
            kindProperties: FreeFormTitleBarKindProperties {
                Container {
                    layout: DockLayout {
                    }
                    Label {
                        text: "Chemistry"
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
                            id: labelquotechem
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
