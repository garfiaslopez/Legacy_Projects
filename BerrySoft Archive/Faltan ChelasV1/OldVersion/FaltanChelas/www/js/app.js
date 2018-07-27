// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('App', ['ionic','ngCordova','ngIOS9UIWebViewPatch','AuthService','AppService','btford.socket-io','MainCtrl','ProductCtrl','ComplementCtrl','RegLogCtrl','CheckoutCtrl','MapCtrl','SideMenuCtrl'])

.run(function($ionicPlatform,$cordovaStatusbar,$location,Auth) {

    $ionicPlatform.ready(function() {
        console.log("READY FUNCTION")
        $cordovaStatusbar.overlaysWebView(true);
        console.log("overlaysWebView FUNCTION")

        $cordovaStatusbar.style(1);
        console.log("style FUNCTION")

        if(window.cordova && window.cordova.plugins.Keyboard) {
            console.log("hideKeyboardAccessoryBar FUNCTION")

          cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
        }
        console.log("FINISH RUN FUNCTION")

    });

    console.log("FINISH FUNCTION RUN FUNCTION")

})

.config(function($stateProvider, $urlRouterProvider,$httpProvider) {

    console.log("CONFIG FUNCTION")

    $httpProvider.interceptors.push('AuthInterceptor');

    $stateProvider


        .state('Login', {
            url: '/Login',
            cache: false,
            views: {
                'Main-View':{
                    templateUrl: 'templates/registerlogin.html',
                    controller : "RegLogController"
                }
            }

        })

        .state('App', {
            url: '/App',
            abstract: true,
            views: {
                'Main-View':{
                    templateUrl: 'templates/sidemenu.html',
                    controller : "SideMenuController"
                }
            }
        })

        .state('App.Main', {
            url: '/Main',
            cache: true,
            views: {
                'MainContent':{
                    templateUrl: 'templates/main.html',
                    controller : "MainController"
                }
            },
            onEnter: function($state, Auth, $ionicHistory){

                // $ionicHistory.nextViewOptions({
                //     disableAnimate: true,
                //     disableBack: true
                // });
                if(!Auth.isLoggedIn()){
                    $state.go('Login');
                    console.log("ONLOGIN");
                }
            }
        })

        .state('App.Product', {
            url: '/Product',
            cache: false,
            views: {
                'MainContent':{
                    templateUrl: 'templates/product.html',
                    controller : "ProductController"
                }
            }
        })

        .state('App.Complement', {
            url: '/Complement',
            cache: false,
            views: {
                'MainContent': {
                    templateUrl: 'templates/complement.html',
                    controller : "ComplementController"
                }
            }
        })

        .state('App.Checkout', {
            url: '/Checkout',
            cache: false,
            views: {
                'MainContent': {
                    templateUrl: 'templates/checkout.html',
                    controller : "CheckoutController"
                }
            }
        })

        .state('Mapa', {
            url: '/Mapa',
            cache: false,
            views: {
                'Main-View': {
                    templateUrl: 'templates/mapa.html',
                    controller : "MapController"
                }
            }
        })

  $urlRouterProvider.otherwise("/App/Main");

})

.controller('AppController',function($scope,$ionicHistory,Auth){
    console.log("APP CONTROLLER FUNCTION")

});
