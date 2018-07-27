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

			background: backgroundGame.imagePaint
			
	        horizontalAlignment: HorizontalAlignment.Center
	        verticalAlignment: VerticalAlignment.Center
            layout: AbsoluteLayout {
            }
            
            Label {
                translationX: 30
                translationY: 150
                 text: "\"3 lifes,  your knowledge & many questions\""
                 textStyle.color: Color.DarkGray
            }   
            
            Label {
                translationX: 80
                translationY: 200
            	text: "How many will you be able to answer?"
            }
            ImageView {
                imageSource: "/Imagenes/StudyGame.png"
                translationX: 130
                translationY: 260
            }
	        Button {
	            text: "¡Go!"
	            translationX: 210
	            translationY: 800
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
