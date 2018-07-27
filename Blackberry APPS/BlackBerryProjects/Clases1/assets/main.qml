import bb.cascades 1.2

Page {
    Container {
        ListView {
            id: lista1
            dataModel: XmlDataModel {
                source: "Modelos/Datos.xml"

            }
            listItemComponents: [
                ListItemComponent {
                    type: "header"
                    Header {
                        title: ListItemData.title
                    }
                },
                ListItemComponent {
                    type: "listItem"
                    Label {
                        text:ListItemData.title
                    }
                }
            ]

        }

    }
}
