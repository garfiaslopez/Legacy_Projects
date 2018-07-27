angular.module('RouterCtrl',['ngRoute','DashboardCtrl','HistoryCtrl','ProductsCtrl','ServicesCtrl','UsersCtrl']).config(function($routeProvider, $locationProvider){
		$routeProvider.when('/Dashboard',{
			templateUrl: '/public/pages/admin/dashboard.html',
			controller: 'DashboardController',
			controllerAs: 'Dashboard'
		}).when('/Users',{
			templateUrl:'../public/pages/admin/users.html',
			controller:'UsersController',
			controllerAs:'Users'
		}).when('/Services',{
			templateUrl:'../public/pages/admin/services.html',
			controller:'ServicesController',
			controllerAs:'Services'
		}).when('/Products',{
			templateUrl:'../public/pages/admin/products.html',
			controller:'ProductsController',
			controllerAs:'Products'
		});

	$locationProvider.html5Mode(true);

});
