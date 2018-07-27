import bb.cascades 1.2
import "Common"


NavigationPane {
    id: navigationMate
Page {
    
    property variant quotes: ["“Pure mathematics is, in its way,the poetry of logical ideas.”\n-Albert Einstein","“Mathematics are well and good but nature keeps dragging us around by the nose.”\n-Albert Einstein","“Math is radical!”\n-Bumper Sticker","“There is no Royal Road to Geometry.”\n-Euclid","“Mathematics is the Queen of the Sciences.”\n-Carl Friedrich Gauss"]
    property int numrandom: (Math.random()*4)
    

    onCreationCompleted: {
        
        console.debug(numrandom);
        
        labelquotemath.text = quotes[numrandom];
        
        console.debug(quotes[numrandom]);
        
    }
    titleBar:  TitleBar {
        id: titulo
        property variant numrand
        
        
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    
                    text: qsTr("Math")
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
	                    leftPadding: 35
			            Label {                        
			                id: labelquotemath    
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
            }
        }
    }
    Container {
       ListView {
           
           id: mateListMain
           dataModel: XmlDataModel {
               source: "/Models/MateTemasList.xml"
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
               
               pageSelectedMate.source = CeldaEscojida.file;
               var pagina = pageSelectedMate.createObject();
               
               pagina.nav = navigationMate;
               navigationMate.push(pagina);
               
           }
       }
    }
}

attachedObjects: [
    ComponentDefinition {
        id: pageSelectedMate
        //source:"Mate.qml"
    }
]
onPopTransitionEnded: {
    page.destroy();
}

}
