var AuthServices = angular.module('AuthService',[]);

AuthServices.factory("Auth",function($http,$q,AuthToken){

	var AuthFactory = {};

	AuthFactory.Login = function(email,password){

		var Url = "http://104.131.24.52:3000/authenticate/vendor";
		//var Url = "http://localhost:8080/authenticate/vendor";
		//var Url = "http://192.168.0.2:8080/authenticate/vendor";

		return $http.post(Url , {
			email: email,
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

	return AuthFactory;

});


AuthServices.factory("AuthToken", function($window){


	var AuthTokenFactory = {};

	AuthTokenFactory.GetToken = function(){
		return $window.localStorage.getItem("token-App-FC-T");
	}

	AuthTokenFactory.SetToken = function(token){
		
		if(token){
			$window.localStorage.setItem("token-App-FC-T",token);
		}else{
			$window.localStorage.removeItem("token-App-FC-T");
		}
	}

	return AuthTokenFactory;

});	


AuthServices.factory("AuthInterceptor",function($q, $location, AuthToken){

	var InterceptorFactory = {};

	InterceptorFactory.request = function(config){

		var token = AuthToken.GetToken();

		if(token){
			console.log(config);
			config.headers["Authorization"] = token;
		}
		return config;
	}

	InterceptorFactory.ResponseError = function(response){
		
		if(response.status == 403){
			AuthToken.SetToken();
			$location.path("/");
		}
		return $q.reject(response);
	}

	return InterceptorFactory;
});