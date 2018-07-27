import bb.cascades 1.2
import bb.system 1.2

    Page {
        property variant nav
        property variant sheet
        Container {
            layout: DockLayout {
                
            }

            ImageView {
                id:imagen1
                preferredHeight: 720
                preferredWidth: 600
                imageSource: "/Imagenes/tutoInicio2.png"
                horizontalAlignment: HorizontalAlignment.Center
                 onTouchCapture: {
                     toast.show();
                     sheet.close();
                 }
             }
            ImageView {
                id: imagen2
                preferredHeight: 720
                preferredWidth: 600
                imageSource: "/Imagenes/tutoInicio1.png"
                horizontalAlignment: HorizontalAlignment.Center

                onTouchCapture: {
                    imagen1.visible = true;
                    imagen2.visible = false;

                }
            }
        }
        attachedObjects: [
            SystemToast {
                id: toast
                body: "Congratulations!, You finish the tutorial"
            }
        
        ]
    }