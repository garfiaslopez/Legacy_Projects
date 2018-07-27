// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('Tiendero', ['ionic', 'ngCordova','ngIOS9UIWebViewPatch','AuthService', 'AppService','btford.socket-io', 'MainCtrl', 'RegLogCtrl','SideMenuCtrl'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if(window.cordova && window.cordova.plugins.Keyboard) {
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
        StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider, $httpProvider){

	$httpProvider.interceptors.push('AuthInterceptor');

	$stateProvider

    .state('Login', {
        url: '/Login',
        cache: false,
        views: {
            'Main-View':{
                templateUrl: 'templates/login.html',
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

  	$urlRouterProvider.otherwise("/App/Main");

})
