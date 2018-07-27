import bb.cascades 1.2

Page {
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    
                    text: "Quimica"
                    textStyle {
                        color: Color.White
                        fontWeight: FontWeight.Default
                        fontSize: FontSize.Large
                    }
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
            expandableArea {
                content: Label {
                    text: "This is the expandable area"
                }
                expanded: false
                toggleArea: TitleBarExpandableAreaToggleArea.IndicatorOnly
            }
        }
    }
    Container {
        Label {
            text: "ESTA ES LA TAB DE QUIMICA"
        
        }
    }
}