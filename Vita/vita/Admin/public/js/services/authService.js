var AuthServices = angular.module('AuthService',['ngRoute']);


//var ApiBase = "http://159.203.118.233:3000";
//var ApiBase = "http://10.200.252.12:3000";
var ApiBase = "http://104.236.233.71:3010";

AuthServices.factory("Auth",function($http,$q, AuthToken){

	var AuthFactory = {};

	var BaseUrl = ApiBase + '/authenticate';


	AuthFactory.Login = function(username,password){

		return $http.post(BaseUrl , {

			username: username,
			password: password

		}).success(function(data){

			AuthToken.SetToken(data.token);
			return data;

		});
	}

	AuthFactory.LogOut = function(){

		AuthToken.SetToken();

	}

	AuthFactory.isLoggedIn = function(){

		if(AuthToken.GetToken()){
			return true;
		}else{
			return false;
		}

	}

	AuthFactory.GetUser = function(){

		if (AuthToken.GetToken()) {

			return $http.get(BaseUrl + '/me');

		}else{

			return $q.reject({message:"User has no token"});

		}
	}

	return AuthFactory;

});


AuthServices.factory("AuthToken", function($window){

	var AuthTokenFactory = {};

	//get the token from localstorage from browser
	AuthTokenFactory.GetToken = function(){

		return $window.localStorage.getItem("Token_Vita");

	}
	//guardar el token en localstorage:
	AuthTokenFactory.SetToken = function(token){

		if(token){
			$window.localStorage.setItem("Token_Vita",token);

		}else{

			$window.localStorage.removeItem("Token_Vita");
		}
	}

	return AuthTokenFactory;

});


AuthServices.factory("AuthInterceptor",function($q, $location, AuthToken){

	var InterceptorFactory = {};

	InterceptorFactory.request = function(config){

		var token = AuthToken.GetToken();

		if(token){

			config.headers["Authorization"] = token;
			config.headers["Content-Type"] = 'application/json';

		}

		return config;

	}

	InterceptorFactory.responseError = function(response){

		if(response.status == 403){
			AuthToken.SetToken();
			$location.path("/");
		}

		return $q.reject(response);

	}

	return InterceptorFactory;


});
