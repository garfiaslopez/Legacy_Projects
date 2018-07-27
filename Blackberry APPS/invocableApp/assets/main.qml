import bb.cascades 1.0

Page {
    id: pageInvocableApp
    
    titleBar: TitleBar {
        id: titleInvocableApp
        title: "Invocable App"
    }//titleInvocableApp
    
    Container {
        id: contInvocableApp
        leftPadding: 10
        topPadding: 10
        bottomPadding: 10
        rightPadding: 10

        TextArea {
        	id: txtInvocableApp
        	objectName: "txtInvocableApp"
        	preferredHeight: 300
        }//txtInvocableApp

    }//contInvocableApp
    
}//pageInvocableApp
