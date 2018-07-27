import bb.cascades 1.2

Page {
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    multiline: true
                    text: "Factorizacion"
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
                    multiline: true
                    text: "Formulas para deducir area de las figuras:"
                }
                expanded: false
                toggleArea: TitleBarExpandableAreaToggleArea.Default
            }
        }
    }
}