import bb.cascades 1.2

Container {
    background: backgroundmath.imagePaint
    id: listView
    layout: DockLayout {
    
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        
        layout: DockLayout {
        }
        
        // Item background image.
        ImageView {
            imageSource: "asset:///Imagenes/MenuSchedule.png"
            preferredWidth: 768
            preferredHeight: 212
        }
        
        Container {
            id: highlightContainer
            background: Color.create("#75b5d3")
            opacity: 0.0
            preferredWidth: 760
            preferredHeight: 200
            horizontalAlignment: HorizontalAlignment.Center
        }
        
        // The Item content an image and a text
        Container {
            leftPadding: 3
            horizontalAlignment: HorizontalAlignment.Fill
            
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            
            Container {
                layout: StackLayout {
                
                }
                Label {
                    
                    // The title is bound to the data in models/recipemodel.xml title attribute.
                    text: "  "+ListItemData.materia
                    topMargin: 20
                    leftMargin: 70
                    verticalAlignment: VerticalAlignment.Center
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: Color.create("#20A7DC")
                } // Label
                
                Label {
                    text: "  Professor :  " + ListItemData.maestro

                    leftMargin: 70
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color: Color.White
                }
                Label {
                    text: "  Horario :  " + ListItemData.horainicial + " - " + ListItemData.horafinal
                    
                    leftMargin: 70
                    textStyle.base: SystemDefaults.TextStyles.TitleText
                    textStyle.color:Color.White
                }
            }//container
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
            id: backgroundmath
            imageSource: "asset:///Imagenes/Back/BackMath.amd"
            repeatPattern: RepeatPattern.XY
        }
    ]
}