angular.module('MainCtrl',[]).controller('MainController',function($scope,$ionicHistory,$window,$http,$state,$ionicLoading,$ionicPopup,$localStorage,$cordovaGeolocation,$cordovaSms,VendorServ,VendorsConected,Auth,Socket,FCVars,SellServ){
    
    //RECUPERAMOS EL USUARIO EN SESION
    var UserSession = $localStorage.getObject('UserFC');
    //VARIABLES:
    var CanMakeOrder = false;
    var map;
    var AddedAnotherLoc = false;

    var LocationMarker;
    var ActualMarker;

    var LatLocalization;
    var LongLocalization;

    var VendorMarkers = [];

    //SOCKET CONNECTION
    Socket.on('HowYouAre', function (data) {
        Socket.emit('AddUser',UserSession);
    });

    ///ICONOS DE MARCADORES DE MAPA
    var CustomIcon = L.icon({
        iconUrl: 'img/marker.png',
        iconSize: [25, 35],
        popupAnchor: [0,-10]

    });

    var MarketIcon = L.icon({
        iconUrl: 'img/marketmarker.png',
        iconSize: [35, 35],
        popupAnchor: [0,-10]

    });


    /////FUNCIONES DE AYUDA
    function Alerta(title,msg){
         var ActualPopUp = $ionicPopup.alert({
             title: title,
            template: msg
     });
    }

        /////FUNCIONES DE AYUDA
    function AlertaReload(title,msg){

         var ActualPopUp = $ionicPopup.show({
            title: title,
            template: msg,
            buttons: [
            {
                text: '<b>Aceptar</b>',
                type: 'button-positive',
                onTap: function(e) {
                    $window.location.reload(true) 
                }   
            }]  
     });
    }

    $scope.$on("$ionicView.loaded", function () {
    });

    $scope.$on("$ionicView.beforeLeave", function () {
        if(ActualMarker){
            map.removeLayer(ActualMarker);
        }
        AddedAnotherLoc = false;
    });


    //SI LA VISTA APARECE (AUNQUE YA HAYA CARGADO PUEDE SER QUE EL USUARIO REGRESO A LA VISTA)
    $scope.$on("$ionicView.afterEnter", function () {

        if(FCVars.isReadyForProcessing()){
            //THIS IS GOING TO ENTER BEFORE THE USER MADE THE ORDER IN THE LAST VIEW;
            $ionicLoading.show({
                template: 'Buscando repartidor...'
            });
            //SOCKET IO Y TODO LO DEMAS:
            Socket.emit('SearchVendor',FCVars.GetFinalOrder());
            SetUpSearching();
            FCVars.SetIsReadyForProcessing(false);

        }else{

            //PROCESAR EN LA BASE DE DATOS EL ESTADO DE CUALQUIER ORDEN POR ESTE USUARIO Y CONSEGUIR EL ESTADO PARA COMPARAR QUE VISTA SE DEBE DE CARGAR
            SellServ.AllByUserPending(UserSession._id).success(function(data){
                if(data.success){
                    if(data.status == "Buscando"){
                        LoadMap();
                        Alerta('Buscando...','Se está buscando quien atienda tu pedido.');
                        SetUpSearching();
                    }else if(data.status == "Aceptada"){
                        console.log("aceptada");
                        console.log(data);
                        LoadMap();
                        SetUpOnWayMap(data.sell);                            
                        Alerta('Orden En Camino','Su orden esta siendo servida.');

                    }else{
                        SetUpInitialMap();  
                    }
                }else{
                    SetUpInitialMap();  
                }
                $ionicLoading.hide();
            });
        }
    }); 

    
    //CARGAR EL MAPA CON COORDENADAS CUALESQUIERA.
    function LoadMap(){
        map = L.map('map').setView([19.41803754445646, -99.18223147925414], 15);
        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
            maxZoom: 18,
            minZoom: 15,
            id: 'faltanchelas.cifr24j501jobzklx2mb77si7',
            accessToken: 'pk.eyJ1IjoiZmFsdGFuY2hlbGFzIiwiYSI6ImNpZnIyNGtqbjdscGlzNmtxdjgzZ2xvMXoifQ.ZC_IADum0wI1mjDTVoiB7A'
        }).addTo(map);
    }

    function DeleteVendorsOnMap(){
        angular.forEach(VendorMarkers, function(markervendor, key) {    // se borra cada posicion de tiendero en el mapa
                map.removeLayer(markervendor);
        });
        VendorMarkers = [];
    }

    //RECUPERAR LOCALIZACION Y CENTRAR EL MAPA:
    function SetLocationMarker(){
        var posOptions = {timeout: 10000, enableHighAccuracy: false};
        $cordovaGeolocation.getCurrentPosition(posOptions).then(function (position) {

            var latitude = position.coords.latitude;
            var longitude = position.coords.longitude;
            LatLocalization = latitude;  // se pasa el valor a las variables globales.
            LongLocalization = longitude; // se pasa el valor a las variables gloables.

            //guardar la posicion en localstorage para poder recuperarla en la orden
            FCVars.SetCoords(latitude,longitude,'No Info');
            //centrar el mapa en la posicion
            map.setView([latitude, longitude], 15);
            //Setup Marker
            LocationMarker = L.marker([latitude, longitude], {icon: CustomIcon}).addTo(map);            
            LocationMarker.on('click', function(e){   // cuando dan click al marcador.
                RemoveManualMarker();
            });

            //Solicitar los vendedores disponibles al servidor:
            VendorsConected.GetVendors(latitude, longitude).success(function(data){
                
                if(data.success){
                    var vendors = data.vendors;
                    if(vendors.length > 0){    // si hay se puede ordenar
                        DeleteVendorsOnMap(); 
                        CanMakeOrder = true;
                        angular.forEach(vendors, function(ven, key) {    // se coloca cada posicion de tiendero en el mapa
                            var marker = L.marker([ven.loc.cord[1], ven.loc.cord[0]], {icon: MarketIcon}).addTo(map);            
                            marker.bindPopup(ven.marketname);
                            VendorMarkers.push(marker);
                        });
                        LocationMarker.bindPopup('<a href="#/App/Product" class="button button-block OrderButton">¿Te faltan chelas?</a>').openPopup();
                    }else{
                        //Sino no se puede ordenar
                        CanMakeOrder = false;
                        LocationMarker.bindPopup('<a class="button button-block OrderButton">Por ahora no hay tenderos cerca.</a>').openPopup();
                    }
                }else{
                    LocationMarker.bindPopup('<a class="button button-block OrderButton">Al parecer el refri esta desconectado.</a>').openPopup();
                }
            });
        }, function(err) {
            CanMakeOrder = false;
            Alerta('Error','No se pudo determinar tu ubicación.');   // geolocalizacion fallo
        });
    }

    function AddManualMarker(latitude, longitude, description){

        //Solicitar los vendedores disponibles en la zona del nuevo marcador al servidor:
        VendorsConected.GetVendors(latitude, longitude).success(function(data){
            if(data.success){

                var vendors = data.vendors;
                if(vendors.length > 0){    // si hay se puede ordenar
                    console.log("COORDS TO SERVE:");
                    console.log(latitude,longitude);


                    FCVars.SetCoords(latitude,longitude, description);
                    //se agrega el marcador en el mapa.
                    ActualMarker = L.marker([latitude, longitude]).addTo(map);
                    LocationMarker.clickable = false;
                    DeleteVendorsOnMap(); 
                    CanMakeOrder = true;
                    angular.forEach(vendors, function(ven, key) {    // se coloca cada posicion de tiendero en el mapa
                        var marker = L.marker([ven.loc.cord[1], ven.loc.cord[0]], {icon: MarketIcon}).addTo(map);            
                        marker.bindPopup(ven.marketname);
                        VendorMarkers.push(marker);
                    });
                    //si puede ordenar desplegar el boton para hacer la orden.
                    ActualMarker.bindPopup('<a class="button button-block OrderButton"></a>').openPopup();
                    ActualMarker.bindPopup('<a href="#/App/Product" class="button button-block OrderButton">¿Te faltan chelas?</a>').openPopup();
                    ActualMarker.dragging.enable();
                    ActualMarker.on('dragend', function(e) {   //cuando terminan de arrastrar el marcador:
                        var LatLngDragged = ActualMarker.getLatLng();  // se obtienen las coords
                        ActualMarker.openPopup();   // se muestra el boton de ordenar
                        FCVars.SetCoords(LatLngDragged.lat,LatLngDragged.lng,result.name);  // se actualizan las coords en LocalStorage
                    });
                    ActualMarker.on('dblclick', function(e){   // cuando dan doble click al marcador.
                        RemoveManualMarker();
                    });
                }else{
                    Alerta("No hay servicio",'Al parecer no hay tenderos cerca de esa zona.');   // el servidor esta caido o apagado.
                }
            }else{
                Alerta("No hay servicio",data.message);   // el servidor esta caido o apagado.
            }
            $ionicLoading.hide();
            cordova.plugins.Keyboard.close();
        });
    }

    function RemoveManualMarker(){
        if(LatLocalization != undefined && LongLocalization != undefined){ // si existe una coordenada de localizacion:
            FCVars.SetCoords(LatLocalization,LongLocalization,'No Info');   // se quitan las coordenadas del marcador y se agregan las coordenadas de localizacion
        }else{
        }
        if(ActualMarker){
            map.removeLayer(ActualMarker);
        }
        AddedAnotherLoc = false;
    }

    // SETEAR MAPA PRINCIPAL O ESTADO NORMAL   
    function SetUpInitialMap(){
        
        LoadMap();

        SetLocationMarker();      //Se recupera la ubicacion y se colocan los tenderos si hay.  
        //OPCIONES DEL BUSCADOR DEL MAPA :  (searchBar)
        var GeoCoderOptions = {
            collapsed: false, 
            position: "topright",
            placeholder: "Buscar",
            errorMessage: "No se encontró tu ubicación",
            geocoder: new L.Control.Geocoder.Google(),
            showResultIcons: true
        };
        var geocoder = L.Control.geocoder(GeoCoderOptions).addTo(map);

        // geocoder.reverse({lat,long}, map.options.crs.scale(map.getZoom()), function(results) {
        //     console.log(results);
        // })
        
        //CUANDO BUSCARON ALGUNA OTRA UBICACION EN EL MAPA:
        geocoder.markGeocode = function(result) {
            // se avisa que se estan buscando tenderos:
            $ionicLoading.show({
                template: 'Buscando repartidor...'
            });
            if(!AddedAnotherLoc){
                AddedAnotherLoc = true;  // añadieron otra ubicacion que no es la de localizacion por lo tanto se actualiza en LOCALSTORAGE
            }else{
                RemoveManualMarker();
            }
            AddManualMarker(result.center.lat,result.center.lng,result.name);
        };
    }

    function SetUpSearching(){

        Socket.on('Accepted', function (data) {
            $ionicLoading.hide();
            ClearAllData();

            if(LocationMarker){
                map.removeLayer(LocationMarker);
            }
            
            SetUpOnWayMap(data.order);
            Alerta('Orden En Camino',data.msg);


        });

        Socket.on('Rejected', function (data) {
            //SetUpInitialMap();
            ClearAllData();
            $ionicLoading.hide();
            AlertaReload('No se encontró proveedor',data.msg);
        });
    }

    function SetUpOnWayMap(Order){        
        Socket.on('Arrived', function (data) {
            ClearAllData();
            //First alert and after reload
            AlertaReload(data.title,data.msg);
        });

        VendorServ.GetVendor(Order.vendor_id).success(function(data){
            //WHY IS NULL HERE?
            $scope.ShowVendorDetail = true;
            $scope.VendorToServe = data.vendor;
            var route = L.Routing.control({
                plan: L.Routing.plan([
                    L.latLng(data.vendor.loc.cord[1], data.vendor.loc.cord[0]),
                    L.latLng(Order.loc[1], Order.loc[0])
                ], {
                    createMarker: function(i, wp) {
                        if(i==0){
                            return L.marker(wp.latLng, {draggable: false,icon: MarketIcon});
                        }
                        return L.marker(wp.latLng, {draggable: false,icon: CustomIcon});
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
        });
    }
    function ClearAllData() {
        FCVars.DeleteFinalOrder();
        FCVars.DeleteCoords();
        FCVars.DeleteVendorToServe();
        FCVars.SetIsReadyForProcessing(false);
        FCVars.SetIsOnWay(false);
    }

    $scope.SmsToVendor = function(){
        $cordovaSms.send($scope.VendorToServe.phone, 'FaltanChelas: ').then(function() {
            Alerta('Éxito','El vendedor recibirá tu mensaje.');
        }, function(error) {
            console.log(error)
        });
    }
})
