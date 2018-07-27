// Tabbed Pane project template
import bb.cascades 1.0

TabbedPane {
    showTabsOnActionBar: true
    Tab {
        title: qsTr("Next Events")
        Page {
            id: tab1
            
            Container {
                // define tab content here
                Label {
                    text: qsTr("Your Next Events")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                    }
                }
                ListView{
                    id: list_nextevents
                    dataModel:model_nextevents
                }
            }
        }
    }
    Tab {
        title: qsTr("Past Events")
        Page {
            id: tab2
            
            Container {
                // define tab content here
                Label {
                    text: qsTr("Your past events")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                    }
                }
                ListView {
                    dataModel:model_prevevents
                }
            }
        }
    }
    Tab {
        title: qsTr("Add Event")
        Page {
            id: tab3
            
            Container {
                layout:StackLayout {
                           
                       }
                // define tab content here
                Label {
                    text: qsTr("Enter Event Details here")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                    }
                }
                Label {
                    text: "Subject"
                }
                TextField {
                    id:subject
                    hintText: "Enter Subject"
                }
                DateTimePicker {
                    id: datetime
                    mode: DateTimePickerMode.DateTime
                    title: "Select Starttime & Date"
                }
                Button {
                    text: "Add Event"
                    onClicked: {
                        appObj.addEvent(subject.text,datetime.value);
                    }
                }
            }
            }
        }
   
    
    onCreationCompleted: {
        // this slot is called when declarative scene is created
        // write post creation initialization here
        console.log("TabbedPane - onCreationCompleted()")

        // enable layout to adapt to the device rotation
        // don't forget to enable screen rotation in bar-bescriptor.xml (Application->Orientation->Auto-orient)
        OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.All;
    }
}
