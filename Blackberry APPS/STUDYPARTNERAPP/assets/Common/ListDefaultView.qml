import bb.cascades 1.2

Container {
    background: background.imagePainted
    id: listView
    layout: DockLayout {
        
    }
    
    Container {
        
        horizontalAlignment: HorizontalAlignment.Center
        
        layout: DockLayout {
        }
        
        // Item background image.
        ImageView {
            imageSource: "asset:///Imagenes/PrincipalMenuBack.png"
            preferredWidth: 768
            preferredHeight: 173
        }
        
        Container {
            id: highlightContainer
            background: Color.create("#75b5d3")
            opacity: 0.0
            preferredWidth: 760
            preferredHeight: 168
            horizontalAlignment: HorizontalAlignment.Center
        }
        
        // The Item content an image and a text
        Container {
            leftPadding: 3
            horizontalAlignment: HorizontalAlignment.Fill
            
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            
            ImageView {
                preferredWidth: 250
                preferredHeight: 168
                verticalAlignment: VerticalAlignment.Top
                
                // The image is bound to the data in models/recipemodel.xml image attribute.
                imageSource: ListItemData.image
            }
            
            Label {
                // The title is bound to the data in models/recipemodel.xml title attribute.
                text: ListItemData.title
                leftMargin: 30
                verticalAlignment: VerticalAlignment.Center
                textStyle.base: SystemDefaults.TextStyles.TitleText
                //textStyle.color: Color.Black
                textStyle.color:Color.create("#252525")      
            } // Label
        } // Container
    } // Container
    
    // Highlight function for the highlight Container
    function setHighlight(highlighted) {
        if(highlighted) {
            highlightContainer.opacity = 0.9;
        } else {
            highlightContainer.opacity = 0.0;
        }    
    }
    
    // Connect the onActivedChanged signal to the highlight function
    ListItem.onActivationChanged : {        
        setHighlight(ListItem.active);
    } 
    
    // Connect the onSelectedChanged signal to the highlight function
    ListItem.onSelectionChanged : {
        setHighlight(ListItem.selected);
    }
    
    attachedObjects: [
        
        ImagePaintDefinition {
            id: background
            imageSource: "asset:///Imagenes/Back/BackMath.amd"
            repeatPattern: RepeatPattern.XY
        }
    ]
}