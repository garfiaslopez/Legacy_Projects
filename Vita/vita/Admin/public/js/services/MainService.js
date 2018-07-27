var MainService = angular.module('MainService',['ngRoute']);

var ApiBase = "http://104.236.233.71:3010";

MainService.factory("Socket",function($http,$q,socketFactory){
    var myIoSocket = io.connect(ApiBase);
    mySocket = socketFactory({
        ioSocket: myIoSocket
    });

    return mySocket;
});

MainService.service('MainVars', function() {

  var User = {};
  var SetUserData = function(user){
  	User = user;
  };
  var GetUserData = function(){
  	return User;
  };

  return {
    SetUser: SetUserData,
    GetUser: GetUserData
  };

});

MainService.service('UserServ', function($http,$q) {

    var Obj = {};
	var BaseUrl = ApiBase + '/user';
	var BasesUrl = ApiBase + '/users';

	Obj.Create = function(Data){

		return $http.post(BaseUrl, {

			username: Data.username,
			password: Data.password,
			name: Data.name,
			phone: Data.phone,
			address: Data.address,
			rol: Data.rol

		}).success(function(data){

			return data;

		});
	}

	Obj.All = function(){
		return $http.get(BasesUrl).success(function(data){
			return data;
		});
	}

	Obj.Update = function(Id,Data){

		var UpdateUrl = BaseUrl +'/'+ Id;

		return $http.put(UpdateUrl,{

			username: Data.username,
			password: Data.password,
			name: Data.name,
			phone: Data.phone,
			address: Data.address,
			rol: Data.rol

		}).success(function(data){
			return data;
		});

	}

	Obj.Delete = function(Id){

		var DeleteUrl = BaseUrl +'/'+ Id;

		return $http.delete(DeleteUrl).success(function(data){
			return data;
		});
	}

	return Obj;

});
