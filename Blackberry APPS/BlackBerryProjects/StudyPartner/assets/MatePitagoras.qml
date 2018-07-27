import bb.cascades 1.2
import bb.system 1.0

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
                    text: "Pythagorean Theorem"
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
                    horizontalAlignment: HorizontalAlignment.Fill
                    
                    ImageView {
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        imageSource: "Imagenes/Ecuaciones/TeoremaPitagoras.png"
                    }
                }
            	expanded: true
            }
            
        }
    }
    Container {
        background: backgroundmath.imagePaint
    
    ScrollView {

	    Container {
	        preferredWidth: 768
	        preferredHeight: 700
	        
	        background: backgroundmath.imagePaint
	        
	        
	        Label {
	            horizontalAlignment: HorizontalAlignment.Center
	            text: "Formula:"
	            textStyle{
	                fontSize: FontSize.XLarge
	                color: Color.create ("#7a184a")
	            }
	        }
	        
	        Container {
	            preferredWidth: 768
	            preferredHeight: 150
	            
	            layout: DockLayout {
	                
	            }
	
	            ImageView {
	                horizontalAlignment: HorizontalAlignment.Center
	                
	                imageSource: "Imagenes/Ecuaciones/FormulaBack.png"
	                preferredWidth: 650
	                
	            }
	            ImageView {
	                horizontalAlignment: HorizontalAlignment.Center
	                verticalAlignment: VerticalAlignment.Center
	                
	                imageSource: "Imagenes/Ecuaciones/TeoremaPitagoras2.png"
	            }
	        }
	        
	        Container {
	        	layout: AbsoluteLayout {
	             
	         }
	            
	            Label {
	                layoutProperties: AbsoluteLayoutProperties {
	                    positionX: 150
	                    positionY: 50
	                }
	                text: "c:"   
	                textStyle{
	                    fontSize: FontSize.XLarge
	                    color: Color.create ("#7a184a")
	                }
	             }
	            TextField {
	                id: ctextfield
	                
                    inputMode: TextFieldInputMode.NumbersAndPunctuation


                    autoFit: TextAutoFit.Default
	                layoutProperties: AbsoluteLayoutProperties {
	                    positionX: 70
	                    positionY: 130
	                }
	                preferredWidth: 200
	                hintText: "0"
                    //text: "0"
	            }
	            Label {
	                layoutProperties: AbsoluteLayoutProperties {
	                    positionX: 380
	                    positionY: 50
	                }
	                text: "a:"
	                textStyle{
	                    fontSize: FontSize.XLarge
                        color: Color.create ("#7a184a")
	                }
	            }
	            TextField {
	                id: atextfield
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                    autoFit: TextAutoFit.Default
	                layoutProperties: AbsoluteLayoutProperties {
	                    positionX: 300
	                    positionY: 130
	                }
	               // text: "0"
	                preferredWidth: 200
	                hintText: "0"
	            }
	            Label {
	                layoutProperties: AbsoluteLayoutProperties {
	                    positionX: 580
	                    positionY: 50
	                }
	                text: "b:"
	                textStyle{
	                    fontSize: FontSize.XLarge
                        color: Color.create ("#7a184a")
	                }
	            }
	            TextField {
	                id: btextfield
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
	                autoFit: TextAutoFit.Default
	                layoutProperties: AbsoluteLayoutProperties {
	                    positionX: 530
	                    positionY: 130
	                }
	                preferredWidth: 200
	                hintText: "0"
                    //text: "0"
	            }
	        }//containertextos
	        Label {
             
             }
	        Button {
	            attachedObjects: [
	                SystemToast {
                     id: error
                     body: "Left blank the textfield that you want calculate."
                 }
	            ]
	            property int a
	            property int b
	            property int c
	             horizontalAlignment: HorizontalAlignment.Center
	             preferredWidth: 250
	             text: "Calculate"
	             onClicked: {
	                 
	                 
                     if(atextfield.text=="")
                         a = 0;
                     else 
                         a = atextfield.text;
                      ////   ///////////
                         
                     if(btextfield.text=="")
                         b = 0;
                     else 
                         b = btextfield.text;
                      ///   ///////
	                 
                     if(ctextfield.text=="")
                         c = 0;
	                 else 
                         c = ctextfield.text;

					///////////////////
					
	                 if(c==0){
	                     resultLabel.text = Math.sqrt(a*a+b*b);
	                 }
	                 else if(b==0){
	                     resultLabel.text = Math.sqrt(c*c-a*a);
	                 }
	                 else if(a==0){
                         resultLabel.text = Math.sqrt(c*c-b*b);
	                 }
	                 //INVALIDOS:
	                 else if(a==0 && b==0 && c==0){
                         error.show();
	                 }
                     else if(a==0 && b==0 || b==0 && c==0||a==0 && c==0){
                         error.show();
                     }
	                 else{
	                     error.show();
	                     console.debug("ENTRO A ELSE:...")
	                 }
	                 
	             }
             }
	        Label {
             id:resultLabel
             horizontalAlignment: HorizontalAlignment.Center
             textStyle{
                 fontSize: FontSize.XXLarge
                 color: Color.create ("#7a184a")
             }
             text: "Result"
             
            }
	      }//containerprincipal
    }//scroll
}
    attachedObjects: [
        
        
        
        ImagePaintDefinition {
            id: backgroundmath
            imageSource: "Imagenes/Back/BackMath.amd"
            repeatPattern: RepeatPattern.XY
        }
    
    ]
}