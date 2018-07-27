import bb.cascades 1.2

Page {
    property variant nav
    property variant data
    
    titleBar: TitleBar {
        title : "                   View" 
        dismissAction: [
            ActionItem {
                title: "Cancel"
                onTriggered: {
                    nav.pop();
                }
            }
        
        ]
    }
    
    actions: [
        ActionItem {
            title: "Delete"
            imageSource: "/Imagenes/ic_delete.png"
            onTriggered: {
            	mainObj.deleteFotoNote(data.elemento);
                mainObj.loadFotoNote();
                nav.pop();
            }          
            ActionBar.placement: ActionBarPlacement.OnBar
        }
    ]
    Container {
        background: Color.create("#111111")
        
        layout: DockLayout {}
        
        ScrollView {
            
            scrollViewProperties{
                
                scrollMode: ScrollMode.Both
                pinchToZoomEnabled: true
                minContentScale: 1
                maxContentScale: 4
            
            }
            
            
            preferredHeight: 609
            preferredWidth: 768
            
            
            ImageView {
                id: myImage
                
                preferredHeight: 600
                preferredWidth: 768
                
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                
                imageSource: data.foto
                       
            } // end of ImageView
        }
    }
}
