import bb.cascades 1.0

Page {
    id: pageInvocationFramework

    titleBar: TitleBar {
        id: titInvocationFramework
        title: "Usign Invocation Framework"
    }//titInvocationFramework

    Container {
        id: contInvocationFramework
        leftPadding: 10
        rightPadding: 10
        bottomPadding: 10
        topPadding: 10
        
        Button {
            id: btnShareTwitter
            text: "Share On Twitter"
            horizontalAlignment: HorizontalAlignment.Fill
            imageSource: "asset:///img/icoTw.png"
            
            onClicked: {
                invokeTW.trigger("bb.action.SHARE");
            }
        }//btnShareTwitter
        
        Button {
            id: btnShareFacebook
            text: "Share On Facebook"
            horizontalAlignment: HorizontalAlignment.Fill
            imageSource: "asset:///img/icoFb.png"
            
            onClicked: {
                invokeFB.trigger("bb.action.SHARE");
                
            }
        }//btnShareFacebook
    
    }//contInvocationFramework
    
    actions: [
        InvokeActionItem {
            id: invokeAll
            title: "Share On All"
            ActionBar.placement: ActionBarPlacement.OnBar
            query{
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
            }
            onTriggered: {
                data = "Hello from My App";
            }
        }
    ]//actions
    
    attachedObjects: [
        Invocation {
            id: invokeFB
            query {
                mimeType: "text/plain"
                invokeTargetId: "Facebook"
                data: "Hello from My App"
            }
        },
        Invocation {
            id: invokeTW
            query {
                mimeType: "text/plain"
                invokeTargetId: "Twitter"
                data: "Hello from My App"
            }
        }
    ]//attachedObjects
    
}//pageInvocationFramework
