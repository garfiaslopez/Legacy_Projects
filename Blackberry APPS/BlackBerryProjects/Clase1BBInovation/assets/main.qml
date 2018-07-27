import bb.cascades 1.2

Page {
    Container {
        ListView {
            dataModel: XmlDataModel {
                source: "Data.xml"
            }
            listItemComponents: [
                ListItemComponent {
						Header {
						    title: ListItemData.title
						}  	                    
	            },
                ListItemComponent {
                    type: "body"
                    Label {
                        text: ListItemData.title
                    }
                }              
            ]
        }
        
        TextArea {
            id: nameField
            hintText: "Text To Save in body of XML file"
            preferredHeight: 140
            horizontalAlignment: HorizontalAlignment.Fill
        }
        
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                text: "ADD"
                onClicked: {
                    
                    //SAVE THE TEXT IN TEXTAREA TO A DATA.XML 
                }
            }//end of button
        } // end of Container
    }//end of container
}//end of page
