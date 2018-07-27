import bb.cascades 1.0
import bb.cascades.maps 1.0

Page {
    id: pageMapView
    
    titleBar: TitleBar {
        id: titleMapView
        title: "My Location"
    }// titleMapView
    
    Container {
        id: contMapView
        
        MapView {
            id: mapView
            objectName: "mapView"
            verticalAlignment: VerticalAlignment.Fill
            horizontalAlignment: HorizontalAlignment.Fill
        } // mapView
        
    } // contMapView
    
} // pageMapView
