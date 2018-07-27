angular.module('MainCtrl',[]).controller('MainController',function($scope,$window,$http,$state,$ionicLoading,$ionicPopup,$localStorage,$cordovaGeolocation,VendorServ,VendorsConected,Auth,Socket,FCVars){

    var UserSession = $localStorage.getObject('UserFC');
    console.log("USUARIO:");
    console.log(UserSession);

    var vendors;
    var lat;
    var long;
    var AddedAnotherLoc = false;
    var CanMakeOrder = false;

    $scope.ShowVendorDetail = false;
    $scope.VendorToServe = {};

    

    function SetUpInitialMap(){

        var posOptions = {timeout: 10000, enableHighAccuracy: false};
        $cordovaGeolocation.getCurrentPosition(posOptions).then(function (position) {
            
            console.log(position);
            lat  = position.coords.latitude
            long = position.coords.longitude

            FCVars.SetCoords(lat,long,'No Info');

            //var map = L.map('map').setView([19.41803754445646, -99.18223147925414], 15);
            var map = L.map('map').setView([lat, long], 16);

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                maxZoom: 18,
                minZoom: 15,
                id: 'gargui3.ciehvx10z00epsxm3lfdvrd5q',
                accessToken: 'pk.eyJ1IjoiZ2FyZ3VpMyIsImEiOiJjaWVodngxZGswMGVwc2ltMWp3bmg4eGwxIn0.tPFWSMawD6Rh2Exf_peWuQ'
            }).addTo(map);

            var GeoCoderOptions = {
                collapsed: false, 
                position: "topright",
                placeholder: "Buscar",
                errorMessage: "No Se Encontro Tu Ubicación",
                geocoder: new L.Control.Geocoder.Google(),
                showResultIcons: true
            };

            var geocoder = L.Control.geocoder(GeoCoderOptions).addTo(map);

            // geocoder.reverse({lat,long}, map.options.crs.scale(map.getZoom()), function(results) {
            //     console.log(results);
            // })

            var ActualMarker;

            geocoder.markGeocode = function(result) {

                if(!AddedAnotherLoc){

                    AddedAnotherLoc = true;

                    FCVars.SetCoords(result.center.lat,result.center.lng,result.name);

                    var marker = L.marker([result.center.lat, result.center.lng]).addTo(map);
                    ActualMarker = marker;

                    marker.bindPopup("Lugar de entrega");
                    marker.openPopup();
                    marker.dragging.enable();

                    marker.on('dragend', function(e) {
                        var LatLngDragged = marker.getLatLng();
                        marker.openPopup();
                        FCVars.SetCoords(LatLngDragged.lat,LatLngDragged.lng,result.name);
                    });

                    marker.on('dblclick', function(e){
                        FCVars.SetCoords(lat,long,'No Info');
                        map.removeLayer(marker);
                        AddedAnotherLoc = false;
                    });

                }else{
                    ActualMarker.openPopup();
                }



            };

            var myIcon = L.icon({
                iconUrl: 'img/marker.png',
                iconSize: [25, 35],
                popupAnchor: [0,-10]

            });

            var markerUser = L.marker([lat, long], {icon: myIcon}).addTo(map);
            
            markerUser.bindPopup('<a href="#/Product" class="button button-block OrderButton">¿Te Faltan Chelas?</a>').openPopup();

            VendorsConected.GetVendors(lat, long).success(function(data){
                if(data.success){
                    vendors = data.vendors;

                    if(vendors.length > 0){
                        CanMakeOrder = true;
                        markerUser.bindPopup('<a href="#/Product" class="button button-block OrderButton">¿Te Faltan Chelas?</a>').openPopup();
                        angular.forEach(vendors, function(ven, key) {
                             var marker = L.marker([ven.loc.cord[1], ven.loc.cord[0]]).addTo(map);
                             marker.bindPopup(ven.marketname);
                        });
                    }else{
                        //Alerta("Sin Cobertura","Por el momento no hay proveedores cercanos a tu zona.");
                        CanMakeOrder = false;
                    }
                }else{
                    //Alerta("No hay servicio",data.message);
                }
            });



        }, function(err) {
              // error
        });
    }

    function SetUpOnWayMap(VendorId){

        $scope.ShowVendorDetail = true;
        var VendorTmp = FCVars.GetVendorToServe();

        console.log('VENDOR TMP ID ' + VendorTmp);
        VendorServ.GetVendor(VendorTmp).success(function(data){

            if(data.success){

                $scope.VendorToServe = data.vendor;

                //CONFIGURE THE MAP AND ROUTES:
                var posOptions = {timeout: 10000, enableHighAccuracy: false};
                $cordovaGeolocation.getCurrentPosition(posOptions).then(function (position) {
                    
                    lat  = position.coords.latitude
                    long = position.coords.longitude

                    //var map = L.map('map').setView([19.41803754445646, -99.18223147925414], 15);
                    var map = L.map('map').setView([lat, long], 14);
                    
                    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                        maxZoom: 18,
                        minZoom: 12,
                        id: 'gargui3.ciehvx10z00epsxm3lfdvrd5q',
                        accessToken: 'pk.eyJ1IjoiZ2FyZ3VpMyIsImEiOiJjaWVodngxZGswMGVwc2ltMWp3bmg4eGwxIn0.tPFWSMawD6Rh2Exf_peWuQ'
                    }).addTo(map);

                    var myIcon = L.icon({
                        iconUrl: '../img/marker.png',
                        iconSize: [25, 35],
                        popupAnchor: [0,-10]

                    });

                    var route = L.Routing.control({
                        plan: L.Routing.plan([
                            L.latLng(lat, long),
                            L.latLng(19.41803754445646, -99.18223147925414)
                        ], {
                            createMarker: function(i, wp) {
                                return L.marker(wp.latLng, {
                                    draggable: false,
                                    icon: myIcon
                                });
                            },
                        }),
                        routeWhileDragging: false,
                        showAlternatives: false,
                        draggableWaypoints: false,
                        addWaypoints: false,
                        lineOptions: {
                            styles: [
                                {color: '#EFC028', opacity: 1, weight: 6}
                            ],
                            addWaypoints: false
                        },
                        show: false,
                    }).addTo(map);

                    route.on('routeselected', function(e) {
                        var r = e.route;
                        var line = L.Routing.line(r);
                        var bounds = line.getBounds();
                        map.fitBounds(bounds);
                    });

                }, function(err) {
                      // error
                });
            }else{
                Alerta("No hay servicio",data.message);
            }
        });        
    }

    function Alerta(title,msg){
        var alertPopup = $ionicPopup.alert({
            title: title,
            template: msg
        });
    }

    if(FCVars.isReadyForProcessing()){

        console.log("Mandar a procesar pedido");
        //Check status of pedido:
        $ionicLoading.show({
            template: 'Buscando Proveedor.'
        });
        //SOCKET IO Y TODO LO DEMAS:
        Socket.emit('SearchVendor',FCVars.GetFinalOrder());

    }else if(FCVars.isOnWay()){
        
        SetUpOnWayMap();

    }else{

        SetUpInitialMap();

    }

    //SOCKET ACTIONS:

    Socket.on('HowYouAre', function (data) {
        Socket.emit('AddUser',UserSession);
    });

    Socket.on('Accepted', function (data) {
        console.log(data);
        $ionicLoading.hide();
        FCVars.SetIsReadyForProcessing(false);
        FCVars.SetIsOnWay(true);
        FCVars.SetVendorToServe(data.vendor._id);
        SetUpOnWayMap();
        Alerta('Orden En Camino',data.msg);
    });

    Socket.on('Rejected', function (data) {
        console.log(data);
        SetUpInitialMap();
        FCVars.SetIsReadyForProcessing(false);
        FCVars.SetIsOnWay(false);
        FCVars.DeleteVendorToServe();
        $ionicLoading.hide();
        Alerta('No Se Encontro Provedor',data.msg);
    });

    $scope.MakeOrder = function(){
        $state.go('Product');
    }

    $scope.LogOut = function(){
        Auth.LogOut();
        window.location = 'templates/registerlogin.html';
    }

    

})
