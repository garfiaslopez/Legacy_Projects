import bb.cascades 1.0
import bb.cascades.pickers 1.0

Page {
    id: pageNFC

    titleBar: TitleBar {
        id: titleNFC
        title: "Share Files NFC"
    }

    Container {
        id: contNFC
        rightPadding: 20
        leftPadding: 20
        topPadding: 20
        bottomPadding: 20

        Button {
            id: btnSelectFile
            text: "Select File to Share"
            horizontalAlignment: HorizontalAlignment.Fill
            imageSource: "asset:///img/icoSelection.png"
            onClicked: {
                filePicker.open();
            }
        } //btnSelectFile

        Button {
            id: btnInvokeNFC
            objectName: "btnInvokeNFC"
            text: "Invoke NFC"
            horizontalAlignment: HorizontalAlignment.Fill
            imageSource: "asset:///img/icoNFC.png"
            enabled: false
            onClicked: {
                _myApp.invokeNFC(labelNFC.text);
            }
        } //btnInvokeNFC

        Label {
            id: labelNFC
            objectName: "labelNFC"
            multiline: true
        } //labelNFC

    } //contNFC

    attachedObjects: [
        FilePicker {
            id: filePicker
            mode: FilePickerMode.Picker
            viewMode: FilePickerViewMode.GridView
            sortBy: FilePickerSortFlag.Name
            filter: sortOrder.Ascending
            type: defaultType
            onFileSelected: {
                if(selectedFiles[0]){
                    btnInvokeNFC.enabled=true;
                    labelNFC.text = "file://"+selectedFiles[0];
                }
            }
        } //filePicker
    ]

}//pageNFC
