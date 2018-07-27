import bb.cascades 1.2

TabbedPane {
    showTabsOnActionBar: true
    Tab {
        title: "Home"
        Page {
            id: page1
            actions: [
                ActionItem {
                    title: "New"
                },
                ActionItem {
                    title: "Delete"
                }
            ]
        }
    }
    Tab {
        title: "Options"
        Page {
            id: page2
            actions: [
                ActionItem {
                    title: "Edit"
                },
                ActionItem {
                    title: "Save"
                }
            ]
        }
    }
    Tab {
        title: "Help"
        Page {
            id: page3
            actions: [
                ActionItem {
                    title: "Search"
                },
                ActionItem {
                    title: "Browse"
                }
            ]
        }
    }
}