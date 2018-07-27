angular.module('MapCtrl',[]).controller('MapController',function($scope){

    initMap();
    console.log("REFRESH AFTER INIT MAP");
    
    $scope.busca = function(){

        var request = null;

        console.log("entrooooo");

        var directionsDisplay = new google.maps.DirectionsRenderer();
        var directionsService = new google.maps.DirectionsService();

        request = {
            origin: document.getElementById("origen").value,
            destination: document.getElementById("destino").value,
            travelMode: google.maps.DirectionsTravelMode["WALKING"],
            unitSystem: google.maps.DirectionsUnitSystem["METRIC"],
            provideRouteAlternatives: false
        };

        console.log(request.origin)

        directionsService.route(request, function(response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setMap(map);
                directionsDisplay.setDirections(response);
            } else {
                    alert("No existen rutas entre ambos puntos");
            }
        });

    }
   
})


