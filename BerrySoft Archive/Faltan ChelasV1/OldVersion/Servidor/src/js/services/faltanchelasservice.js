var FCService = angular.module('FCService',['ngRoute']);


FCService.factory("Socket",function($http,$q,configData,socketFactory){

	var Url = configData.baseURL
    var myIoSocket = io.connect(Url);
    mySocket = socketFactory({
        ioSocket: myIoSocket
    });

    return mySocket;
});

FCService.factory("UserAdminServ",function($http,$q,configData){

	var Obj = {};

	console.log(configData);
	var Url = configData.APIURL + "/useradmin"


	Obj.Create = function(Data){

		return $http.post(Url, {

			username: Data.username,
			password: Data.password

		}).success(function(data){
			return data;
		});
	}

	Obj.All = function(){
		return $http.get(Url).success(function(data){
			return data;
		});
	}

	Obj.Update = function(Id,Data){

		var UpdateUrl = Url +'/'+ Id;

		return $http.put(UpdateUrl,{
			username: Data.username,
			password: Data.password
		}).success(function(data){
			return data;
		});
	}
	Obj.Delete = function(Id){

		var DeleteUrl = Url +'/'+ Id;
		return $http.delete(DeleteUrl).success(function(data){
			return data;
		});
	}
	return Obj;
});

FCService.factory("UserServ",function($http,$q,configData){

	var Obj = {};

	var Url = configData.APIURL + "/user"

	Obj.All = function(){
		return $http.get(Url).success(function(data){
			return data;
		});
	}

	Obj.Update = function(Id,Data){

		var UpdateUrl = Url +'/'+ Id;

		return $http.put(UpdateUrl,{
			username: Data.username,
			password: Data.password
		}).success(function(data){
			return data;
		});
	}
	Obj.Delete = function(Id){

		var DeleteUrl = Url +'/'+ Id;
		return $http.delete(DeleteUrl).success(function(data){
			return data;
		});
	}
	return Obj;
});


FCService.factory("VendorServ",function($http,$q,configData){

	var Obj = {};

	console.log(configData);
	var Url = configData.APIURL + "/vendor"

	Obj.Create = function(Data){

		return $http.post(Url, {
			email: Data.email,
			type: Data.type,
			password: Data.password,
			name: Data.name,
			marketname: Data.marketname,
			phone: Data.phone,
			gender: Data.gender,
			birthdate: Data.birthdate,
			paydata: {
				clabe: Data.paydata.clabe,
				bank: Data.paydata.bank,
				name: Data.paydata.name
			},
			othercontact: {
				name: Data.othercontact.name,
				phone: Data.othercontact.phone
			},
			loc: {
				denomination: Data.loc.denomination,
				lon: Data.loc.lon,
				lat: Data.loc.lat
			}
		}).success(function(data){
			return data;
		});
	}

	Obj.All = function(){
		return $http.get(Url).success(function(data){
			return data;
		});
	}

	Obj.Update = function(Id,Data){

		var UpdateUrl = Url +'/'+ Id;

		return $http.put(UpdateUrl,{
			username: Data.username,
			password: Data.password
		}).success(function(data){
			return data;
		});
	}
	Obj.Delete = function(Id){

		var DeleteUrl = Url +'/'+ Id;
		return $http.delete(DeleteUrl).success(function(data){
			return data;
		});
	}
	return Obj;
});


FCService.factory("ConfigServ",function($http,$q,configData){

	var Obj = {};

	console.log(configData);
	var Url = configData.APIURL + "/config"

	Obj.Create = function(Data){

		return $http.post(Url, {

			denomination: Data.denomination,
			parameter: Data.parameter

		}).success(function(data){
			return data;
		});
	}

	Obj.All = function(){
		return $http.get(Url).success(function(data){
			return data;
		});
	}

	Obj.Update = function(Id,Data){

		var UpdateUrl = Url +'/'+ Id;

		return $http.put(UpdateUrl,{
			denomination: Data.denomination,
			parameter: Data.parameter
		}).success(function(data){
			return data;
		});
	}
	Obj.Delete = function(Id){

		var DeleteUrl = Url +'/'+ Id;
		return $http.delete(DeleteUrl).success(function(data){
			return data;
		});
	}
	return Obj;
});


FCService.factory("ProductServ",function($http,$q,configData){

	var Obj = {};

	console.log(configData);

	var Url = configData.APIURL + "/product"

	Obj.Create = function(Data){

		return $http.post(Url, {

			denomination: Data.denomination,
			description: Data.description,
			type: Data.type

		}).success(function(data){
			return data;
		});
	}

	Obj.All = function(){
		return $http.get(Url).success(function(data){
			return data;
		});
	}

	Obj.Update = function(Id,Data){

		var UpdateUrl = Url +'/'+ Id;

		return $http.put(UpdateUrl,{

			denomination: Data.denomination,
			description: Data.description,
			type: Data.type,
			prices: Data.prices

		}).success(function(data){
			return data;
		});

	}
	Obj.Delete = function(Id){

		var DeleteUrl = Url +'/'+ Id;
		return $http.delete(DeleteUrl).success(function(data){
			return data;
		});
	}
	return Obj;
});

FCService.factory("SellServ",function($http,$q,configData){

	var Obj = {};
	var Url = configData.APIURL + "/sell/bydate"

	Obj.AllByDate = function(initialDate,finalDate){
		return $http.post(Url, {
			initialDate: initialDate,
			finalDate: finalDate
		}).success(function(data){
			return data;
		});
	}

	return Obj;
});
