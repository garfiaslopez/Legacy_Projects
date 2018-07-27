import bb.cascades 1.2

Page {
    Container {
        Button {
            id: boton1
            text: "click"
            onClicked: {
                
                txtrespuesta.text = _app.metodo1()
                
            }

        }
        TextField {
            id: txtrespuesta
            

        }

    }
}
