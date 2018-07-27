import bb.cascades 1.2

Container {
    id:listformulas
    layout: DockLayout {
    }
    Container {
        
        ImageView {
            imageSource: "asset:///Imagenes/Ecuaciones/FormulaBack.png"
            verticalAlignment: VerticalAlignment.Fill
        }

        horizontalAlignment: HorizontalAlignment.Center
        layout: DockLayout {
        }
        
        Container {
            preferredWidth: 768
             
            topPadding: 25
            ImageView {
                
                
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                
                imageSource: ListItemData.image
                
            }
        }
        
    }
}

