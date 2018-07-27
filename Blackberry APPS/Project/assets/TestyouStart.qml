import bb.cascades 1.2
import bb.multimedia 1.0

NavigationPane {
    
    id: navtestmain
	    Page {
	    titleBar:  TitleBar {
	        kind: TitleBarKind.FreeForm
	        kindProperties: FreeFormTitleBarKindProperties {
	            Container {
	                layout: DockLayout {
	                }
	                Label {
	                    
	                    text: "Test your knowledge"
	                    textStyle {
	                        color: Color.White
	                        fontWeight: FontWeight.Default
	                        fontSize: FontSize.Large
	                    }
	                    verticalAlignment: VerticalAlignment.Center
	                    horizontalAlignment: HorizontalAlignment.Center
	                }
	            }
	        }
	    }
	    Container {
	    	topPadding: 60
			background: Color.create("#111111")
			
	        horizontalAlignment: HorizontalAlignment.Center
	        verticalAlignment: VerticalAlignment.Center
            layout: StackLayout {
            }
            
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                 text: "\"3 lifes,  your knowledge & many questions\""
                 textStyle.color: Color.create("#20A7DC")
            }   
            
            Label {
                horizontalAlignment: HorizontalAlignment.Center
            	text: "How many will you be able to answer?"
            	textStyle.color: Color.White
            }
                
	            ImageView {
	                preferredHeight: 400
	                preferredWidth: 400
	                horizontalAlignment: HorizontalAlignment.Center
	                imageSource: "/Imagenes/StudyGame.png"
	            }
	        Button {
	            text: "¡Go!"
	            horizontalAlignment: HorizontalAlignment.Center
	            verticalAlignment: VerticalAlignment.Center
	            onClicked: {
	                
                    var pagina = pagetestgame.createObject();                    
                    navtestmain.push(pagina);
                }
	        }
	        
	    }
	}
    attachedObjects: [
        ImagePaintDefinition {
            id: backgroundGame
            imageSource: "Imagenes/Back/GameBack.amd"
            repeatPattern: RepeatPattern.XY
        },
        ComponentDefinition {
            id: pagetestgame
            source:"Testyou.qml"
        }
    ]
    onPopTransitionEnded: {
        page.destroy();
    }
}
