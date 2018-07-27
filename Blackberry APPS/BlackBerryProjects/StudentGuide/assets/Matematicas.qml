import bb.cascades 1.2
import "Common"

NavigationPane {
    id: navigationMate


Page {
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    
                    text: "Matematicas"
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
                    text: "Diversas formulas en el area de la matematica"
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
                 type: "header"
                 Container {
                     layout: StackLayout {
                         orientation: LayoutOrientation.LeftToRight
                     }
                     Label {
                         text: "                                 "
                     }
	                 Label {
	                     
	                     text: ListItemData.title
	                     horizontalAlignment: HorizontalAlignment.Center
	                     verticalAlignment: VerticalAlignment.Center
	                     
	                     
	                     // Apply a text style to create a large, bold font with
	                     // a specific color
	                     textStyle {
	                         textAlign: TextAlign.Center
	                         base: SystemDefaults.TextStyles.TitleText
	                         fontWeight: FontWeight.Bold
	                         color: Color.create ("#7a184a")
	                         
	                     }
	                 }  
	             }
               },
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
               
               //pagina.title = CeldaEscojida.title;
               
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
