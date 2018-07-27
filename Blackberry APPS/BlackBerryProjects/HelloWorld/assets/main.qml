import bb.cascades 1.2

Page {
    Container {
        //Todo: fill me with QML
       // layout: DockLayout 
        Header {
            title: qsTr("Hola Mundo!")
            subtitle: qsTr("LOL")

        }
        Label {
            // Localized text with the dynamic translation and locale updates support
            //property variant 
            property string holalabel:"HOLA"
            onHolalabelChanged: {
                console.log("Cambio la propiedad de",holalabel);
            }
            id: etiqueta1
            text: qsTr("ola mundo ke ase?")
            textStyle.base: SystemDefaults.TextStyles.BigText
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center   
        }
        Button {
            
            text: "SOY UN BOTON"
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                etiqueta1.text = "SOY UN BOTON";
            }
        }
        Button {
            
            text: "Soy Otro Boton! :D"
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                etiqueta1.text = "Soy Otro Boton :D";
            }

        }
        Button {
            text: "RETURN HOLA"
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                if (etiqueta1.holalabel == "HOLA"){
                    etiqueta1.text = etiqueta1.holalabel;
                }
                else{
                    etiqueta1.holalabel = "HOLA"
                    etiqueta1.text = etiqueta1.holalabel;
                }
                
            }

        }
        CheckBox {
        	text: "Hi add fucking ':)'"
        	horizontalAlignment: HorizontalAlignment.Center
        	
        	onCheckedChanged: {
             etiqueta1.text = etiqueta1.holalabel + ":) ";
             etiqueta1.holalabel = etiqueta1.text;
         }
        	
        
        	
        }

    }
}
