angular.module('RouterCtrl',['ngRoute','UsersCtrl','DashboardCtrl']).config(function($routeProvider, $locationProvider){

		$routeProvider.when('/Dashboard',{
			templateUrl: '/public/pages/admin/dashboard.html',
			controller: 'DashboardController',
			controllerAs: 'Dashboard'
		}).when('/Users',{
			templateUrl:'../public/pages/admin/users.html',
			controller:'UsersController',
			controllerAs:'Users'
		});

	$locationProvider.html5Mode(true);

});
