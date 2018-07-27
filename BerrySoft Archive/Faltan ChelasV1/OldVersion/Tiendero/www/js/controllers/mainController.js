angular.module('MainCtrl',[]).controller('MainController',function($scope,$state,$window,$ionicPopup,$localStorage,$cordovaGeolocation,$cordovaSms,Auth,Socket,FCVars,SellServ,VendorServ){
    var map;
    var VendorSession = $localStorage.getObject('VendorFC');
    console.log("Vendor:", VendorSession);

    Socket.on('HowYouAre', function (data) {
        if(VendorSession.type == 'fijo'){
            Socket.emit('AddVendor',VendorSession);
        }else{
            Socket.emit('AddMovible',VendorSession);
        }
    });

	$scope.LogOut = function(){
        Auth.LogOut();
        $state.go('Login');
    }

    var UserToServe;
    var OrderToServe;
    $scope.ShowDataOrder = false;
    $scope.ShowMapOrder = false;
    $scope.ShowWaitingOrder = true;
    $scope.OrderToServe = {};

    function Alerta(title,msg){
        var alertPopup = $ionicPopup.alert({
            title: title,
            template: msg
        });
    }

    function AlertaReload(title,msg){

         var ActualPopUp = $ionicPopup.show({
            title: title,
            template: msg,
            buttons: [
            {
                text: 'Cancelar',
                type: 'button',
                onTap: function(e) {

                }               
            },
            {
                text: 'Aceptar',
                type: 'button-positive',
                onTap: function(e) {
                    ArrivedTasks();
                }   
            }]  
     });
    }


    function playAudio(url) {
        var my_media = $cordovaMedia.newMedia(url,
            function () {
                console.log("playAudio():Audio Success");
            },
            function (err) {
                console.log("playAudio():Audio Error: " + err);
            }
        );
        my_media.setVolume(1);
        my_media.play({ numberOfLoops: 10, playAudioWhenScreenIsLocked : true });
    }



    $scope.$on("$ionicView.afterEnter", function () {
        //PROCESAR EN LA BASE DE DATOS EL ESTADO DE CUALQUIER ORDEN POR ESTE USUARIO Y CONSEGUIR EL ESTADO PARA COMPARAR QUE VISTA SE DEBE DE CARGAR
        SellServ.AllByVendorPending(VendorSession._id).success(function(data){
            if(data.success){
                if(data.status == "Buscando"){

                    //SHOW THE ORDER FOR THE TENDERO IF ACCEPTS:..

                    console.log("Searching");
                    var total = 0;
                    angular.forEach(data.sell.products, function(pro, key) {
                        total = total + pro.price;
                    }); 

                    $scope.TotalOrder = total;
                    $scope.OrderToServe = data.sell;
                    OrderToServe = data.sell;
                    UserToServe = $scope.OrderToServe.user_id;

                    OrderStatus();
                    playAudio('sound/Notification.mp3');


                }else if(data.status == "Aceptada"){
                    
                    MapStatus();
                    console.log("aceptada");
                    $scope.OrderToServe = data.sell;
                    SetUpOnWayMap(data.sell);                            

                }else{
                    ClearAllData();
                    WaitingStatus();  
                }
            }else{
                    ClearAllData();
                    WaitingStatus();  
            }
        });
        
    }); 


    Socket.on('NewOrder', function (data) {
        console.log(data);
        var total = 0;
        angular.forEach(data.order, function(pro, key) {
            total = total + pro.price;
        }); 
        $scope.TotalOrder = total;
        $scope.OrderToServe = data;
        OrderToServe = data;
        UserToServe = $scope.OrderToServe.user;
        OrderStatus();
        playAudio('sound/Notification.mp3');
    });

    Socket.on('ExpiredOrder', function (data) {
        console.log(data);
        WaitingStatus();
        ClearAllData();
        Alerta('Expiro Orden',data.msg);
    });

    $scope.Accept = function(){

        Socket.emit('AcceptOrder',{vendor: VendorSession });
        MapStatus();

        SellServ.GetSell(OrderToServe.order_id).success(function(data){
            if(data.success){
                console.log("aceptada");
                $scope.OrderToServe = data.sell;
                SetUpOnWayMap(data.sell);
            }
        });

    }
    $scope.Cancel = function(){
        WaitingStatus();
        ClearAllData();
    }

    function SetUpOnWayMap(Order){

        console.log(Order);

        var posOptions = {timeout: 10000, enableHighAccuracy: false};
        $cordovaGeolocation.getCurrentPosition(posOptions).then(function (position) {

            console.log("GEOLOCATION START");
            
            lat  = position.coords.latitude
            long = position.coords.longitude

            map = L.map('map').setView([lat,long], 15);
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                maxZoom: 18,
                minZoom: 15,
                id: 'faltanchelas.cifr24j501jobzklx2mb77si7',
                accessToken: 'pk.eyJ1IjoiZmFsdGFuY2hlbGFzIiwiYSI6ImNpZnIyNGtqbjdscGlzNmtxdjgzZ2xvMXoifQ.ZC_IADum0wI1mjDTVoiB7A'
            }).addTo(map);

            var CustomIcon = L.icon({
                iconUrl: 'img/marker.png',
                iconSize: [25, 35],
                popupAnchor: [0,-10]
            });
            console.log(Order);

            VendorServ.GetVendor(Order.vendor_id._id).success(function(data){
                //WHY IS NULL HERE?
                var route = L.Routing.control({
                    plan: L.Routing.plan([
                        L.latLng(data.vendor.loc.cord[1], data.vendor.loc.cord[0]),
                        L.latLng(Order.loc[1], Order.loc[0])
                    ], {
                        createMarker: function(i, wp) {
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

        }, function(err) {
              // error
        });       
    } 

    function ArrivedTasks(){

        Socket.emit('Arrived', {order_id: $scope.OrderToServe._id});
        WaitingStatus();
        ClearAllData();
        $window.location.reload(true)

    }

    $scope.Arrived = function(){
        AlertaReload("Confirmación","Se avisara al cliente que has llegado.\n ¿Estas Seguro?");
    }

    
    $scope.SmsToVendor = function(){
        $cordovaSms.send($scope.OrderToServe.user_id.phone, 'FaltanChelas: ').then(function() {
            Alerta('Éxito','El vendedor recibirá tu mensaje.');
        }, function(error) {
            console.log(error)
        });
    }


    function ClearAllData(){
        $scope.OrderToServe = {};
        $scope.TotalOrder = 0;
        FCVars.DeleteFinalOrder();

    }
    function WaitingStatus(){
        $scope.ShowDataOrder = false;
        $scope.ShowMapOrder = false;
        $scope.ShowWaitingOrder = true;
    }
    function OrderStatus(){
        $scope.ShowDataOrder = true;
        $scope.ShowMapOrder = false;
        $scope.ShowWaitingOrder = false;
    }
    function MapStatus(){
        $scope.ShowDataOrder = false;
        $scope.ShowMapOrder = true;
        $scope.ShowWaitingOrder = false;
    }



})
