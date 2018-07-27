// Default empty project template
import bb.cascades 1.0

// creates one page with a label
Page {
    signal qmlSignal()
    Container {
        
        layout: StackLayout {
        }
        Label {
            id: label
            text: qsTr("List App")
            textStyle.base: SystemDefaults.TextStyles.BigText
        }
        TextField {
            id: textfield
            hintText: "Enter Text..."
        }
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                text: "Add to List"
                onClicked: {
                    mainObj.addData(textfield.text);
                }
                horizontalAlignment: HorizontalAlignment.Left
            }
            Button {
                text: "Send Signal"
                onClicked:{
                        qmlSignal();
                    }
                horizontalAlignment: HorizontalAlignment.Right
            }
        }
        ListView {
            dataModel: listmodel
        }
        
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                text: "Save list"
                horizontalAlignment: HorizontalAlignment.Left
                onClicked: {
                    mainObj.saveData();
                }
            }
            Button {
                text: "Load List"
                horizontalAlignment: HorizontalAlignment.Right
                onClicked: {
                    mainObj.loadData();
                }
            }
        }
        onCreationCompleted: {
            mainObj.dataReady.connect(onDataReady);
        }
        function onDataReady()
        {
            label.text = "data ready"
        }
    }
}

