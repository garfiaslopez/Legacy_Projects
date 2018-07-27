var app = angular.module('AdminApp',['RouterCtrl','AuthService','MainService','ngMaterial','md.data.table','ngSanitize','btford.socket-io']);

app.config(function($mdIconProvider, $httpProvider, $mdThemingProvider){

    $mdIconProvider
        .icon("menu", "../public/images/icons/menu.svg"        , 24)
        .icon("user", "../public/images/icons/account4.svg"    , 24)
        .icon("section", "../public/images/icons/bed24.svg"    , 24)
        .icon("commercial", "../public/images/icons/google128.svg"    , 24)
        .icon("pack", "../public/images/icons/work3.svg"    , 24)
        .icon("commercializer", "../public/images/icons/emoticon117.svg"    , 24)
        .icon("cars", "../public/images/icons/front16.svg"    , 24)
        .icon("receipt", "../public/images/icons/receipt.svg"    , 24)
        .icon("dasboard", "../public/images/Dasboard.svg"    , 24)
        .icon("billing", "../public/images/Facturacion.svg"    , 24)
        .icon("spends", "../public/images/Gastos.svg"    , 24)
        .icon("historial", "../public/images/Historial.svg"    , 24)
        .icon("ingresses", "../public/images/Ingresos.svg"    , 24)
        .icon("services", "../public/images/icons/circles23.svg"    , 24)
        .icon("paybills", "../public/images/Vales.svg"    , 24)
        .icon("ticket", "../public/images/Ticket.svg"    , 24)
        .icon("Ticket", "../public/images/Ticket.svg"    , 400)
        .icon("carwashes", "../public/images/icons/front17.svg"    , 24)
        .icon("products", "../public/images/Ticket.svg"    , 24)
        .icon("delete", "../public/images/icons/cancel19.svg"    , 24)
        .icon("userlogin", "../public/images/icons/account4.svg"    , 120)
        .icon("logout", "../public/images/icons/thermostat1.svg"    , 120)
        .icon("configurations", "../public/images/icons/settings49.svg"    , 120)
        .icon("usercircle", "../public/images/icons/round58.svg"    , 120);



    $httpProvider.interceptors.push('AuthInterceptor');

    $mdThemingProvider.theme('default')
        .primaryPalette('blue')
        .accentPalette('red');


});

app.controller('MainController',function($rootScope,$location,$scope,$mdSidenav,Auth,MainVars){

    $scope.Profile = {
        name: "Usuario",
        rol: "Nivel",
    };

    if(Auth.isLoggedIn()){
        console.log("islogged");
        $location.path("/Dashboard");
        $scope.Tittle = "Dashboard";
    }else{

        window.location = '/Login';
    }

    MenuList = [
        {
            name:"Dashboard",
            icon:"section",
            route:"/Dashboard",
            selected: true

        },
        {
            name:"Usuarios",
            icon:"user",
            route:"/Users",
            selected: false

        }
    ];
    Auth.GetUser().success(function(data) {
        $scope.Profile = {
            name: data.user.info.name,
            id: data.user._id,
            rol: data.user.rol,
        };

        MainVars.SetUser($scope.Profile);

        if($scope.Profile.rol == "SuperAdministrador"){
            $scope.Menu = MenuList;
        }else{
            //$scope.Menu = MenuListOther;
        }
    });

    $scope.ShowMenu = function() {
        $mdSidenav('left').toggle();
    }
    $scope.CloseMenu = function() {
        $mdSidenav('left').close();
    }
    $scope.LogOut = function(){
        Auth.LogOut();
        window.location = '/Home';
    }
    $scope.navigateTo = function(item){

        angular.forEach($scope.Menu, function(value, key) {
          value.selected = false;
        });

        item.selected = true;
        $scope.Tittle = item.name;
    	$location.path(item.route);
        $scope.CloseMenu();

    }
});
