var AppService = angular.module('AppService',[]);

var BaseUrl = "http://104.131.24.52:3000";
//var BaseUrl = "http://localhost:8080";
//var BaseUrl = "http://192.168.0.2:8080";

console.log("ON-SERVICE");

AppService.factory("Socket",function($http,$q,socketFactory){

	var myIoSocket = io.connect(BaseUrl);
	mySocket = socketFactory({
		ioSocket: myIoSocket
	});

	return mySocket;
});

AppService.factory('$localStorage', ['$window', function($window) {

	return {
		Set: function(key, value) {
			$window.localStorage[key] = value;
		},
		Get: function(key, defaultValue) {
			return $window.localStorage[key] || defaultValue;
		},
		setObject: function(key, value) {
			$window.localStorage[key] = JSON.stringify(value);
		},
		getObject: function(key) {
			return JSON.parse($window.localStorage[key] || '{}');
		}
	}

}]);

AppService.service('FCVars', function($localStorage) {

	var OrdersArray = [];
	var FinalOrder = {};
	var Vendor;

	var Coords = {
		denomination: "No info",
		loc: {
			lat: 0.0,
			long: 0.0
		}
	};

	var SetVendorToServe = function(vendor){
		Vendor = vendor;
		$localStorage.Set('VendorToServe',vendor);
	}
	var GetVendorToServe = function(){
		return $localStorage.Get('VendorToServe');
	}
	var DeleteVendorToServe = function(){
		Vendor = {};
		$localStorage.Set('VendorToServe','');
	}

	var SetFinalOrder = function(order){
		FinalOrder = order;
		$localStorage.setObject('FinalOrder',order);
	}
	var GetFinalOrder = function(){
		return $localStorage.getObject('FinalOrder');
	}
	var DeleteFinalOrder = function(){
		FinalOrder = {};
		$localStorage.setObject('FinalOrder',{});
	}

	var SetCoords = function(latitude, longitude,description){
		Coords.loc.lat = latitude;
		Coords.loc.long = longitude;
		Coords.denomination = description || "no info";

		$localStorage.setObject('Coords',Coords);
	}
	var GetCoords = function(){
		return $localStorage.getObject('Coords');
	}
	var DeleteCoords = function(){
		Coords = {};
		$localStorage.setObject('Coords',{});
	}


	var SetIsReady = function(bool){
		$localStorage.Set('isReady',bool);
	}
	var GetIsReady = function(){
		if($localStorage.Get('isReady') == 'true' || $localStorage.Get('isReady') == 'True'){
			return true;
		}else{
			return false;
		}
	}


	var SetIsOnWay = function(bool){
		$localStorage.Set('isOnWay',bool);
	}
	var GetIsOnWay = function(){
		if($localStorage.Get('isOnWay') == 'true' || $localStorage.Get('isOnWay') == 'True'){
			return true;
		}else{
			return false;
		}
	}



	var PushOrder = function(order){
		OrdersArray.push(order);
	}
	var GetOrders = function(){
		return OrdersArray;
	}
	var CleanOrders = function(Data) {
		OrdersArray = [];
	};
	var RemoveOrderAtIndex = function(index){
		OrdersArray.splice(index, 1);
	};
	var RemoveFinalOrder = function(){
		if(OrdersArray.length > 1){
			OrdersArray.splice(OrdersArray.length-1, 1);
		}
	};


	return {

		SetFinalOrder: SetFinalOrder,
		GetFinalOrder: GetFinalOrder,
		DeleteFinalOrder: DeleteFinalOrder,

		SetVendorToServe: SetVendorToServe,
		GetVendorToServe: GetVendorToServe,
		DeleteVendorToServe: DeleteVendorToServe,

		SetCoords: SetCoords,
		GetCoords: GetCoords,
		DeleteCoords: DeleteCoords,

		SetIsReadyForProcessing: SetIsReady,
		isReadyForProcessing: GetIsReady,

		SetIsOnWay: SetIsOnWay,
		isOnWay: GetIsOnWay,

		PushOrder: PushOrder,
		GetOrders: GetOrders,
		CleanOrders: CleanOrders,
		RemoveOrderAtIndex: RemoveOrderAtIndex,
		RemoveFinalOrder: RemoveFinalOrder

	};

});


AppService.factory("ProductServ",function($http,$q){

	var Obj = {};

	var Url = BaseUrl + "/api/product";

	Obj.All = function(){
		return $http.get(Url).success(function(data){
			return data;
		});
	}

	Obj.AllByType = function(type){
		var UrlToPost = Url + "/bytype";
		console.log("POSTING  " + type);
		return $http.post(UrlToPost, {
			product_type: type
		}).success(function(data){
			return data;
		});
	}

	return Obj;
});

AppService.factory("ConfigServ",function($http,$q){

	var Obj = {};
	var Url = BaseUrl + "/api/config"

	Obj.All = function(){
		return $http.get(Url).success(function(data){
			return data;
		});
	}

	return Obj;
});

AppService.factory("UserServ",function($http,$q){

	var Obj = {};

	var Url = BaseUrl + "/api/user"


	Obj.Get = function(UserId){
		var UrlToGet = Url + '/' + UserId;
		return $http.get(UrlToGet).success(function(data){
			return data;
		});
	}

	Obj.Create = function(Data){
		return $http.post(Url, {
			email: Data.email,
			phone: Data.phone,
			password: Data.password
		}).success(function(data){
			return data;
		});
	}

	Obj.Update = function(Id,Data){

		var UpdateUrl = Url +'/'+ Id;

		return $http.put(UpdateUrl,{
			name: Data.name,
			phone: Data.phone,
			password: Data.password
		}).success(function(data){
			return data;
		});
	}

	return Obj;
});


AppService.factory("SellServ",function($http,$q){

	var Obj = {};


	Obj.AllByUserPending = function(Id){

		var Url = BaseUrl + "/api/sell/pendinguserorders/" + Id

		return $http.post(Url).success(function(data){
			return data;
		});
	}



	Obj.AllByUserDate = function(Id,initialDate,finalDate){

		var Url = BaseUrl + "/api/sell/byuser/" + Id
		return $http.post(Url, {
			initialDate: initialDate,
			finalDate: finalDate
		}).success(function(data){
			return data;
		});
	}


	Obj.AllByUserDateStatus = function(Id,initialDate,finalDate,status){

		var Url = BaseUrl + "/api/sell/byuser/" + Id
		return $http.post(Url, {
			initialDate: initialDate,
			finalDate: finalDate,
			status: status
		}).success(function(data){
			return data;
		});
	}


	Obj.AllByUserStatus = function(Id,status){

		var Url = BaseUrl + "/api/sell/byuser/" + Id
		return $http.post(Url, {
			status: status
		}).success(function(data){
			return data;
		});

	}

	return Obj;
});


AppService.factory("ConektaServ",function($http,$q){

	var Obj = {};

	var Url = BaseUrl + "/api/pay"

	Obj.pagar = function(Data){

		return $http.post(Url, {
			data: Data,
		}).success(function(data){
			return data;
		});
	}

	return Obj;
});

AppService.factory('$cordovaGeolocation', ['$q', function ($q) {

	return {
		getCurrentPosition: function (options) {
			var q = $q.defer();

			navigator.geolocation.getCurrentPosition(function (result) {
				q.resolve(result);
			}, function (err) {
				q.reject(err);
			}, options);

			return q.promise;
		},

		watchPosition: function (options) {
			var q = $q.defer();

			var watchID = navigator.geolocation.watchPosition(function (result) {
				q.notify(result);
			}, function (err) {
				q.reject(err);
			}, options);

			q.promise.cancel = function () {
				navigator.geolocation.clearWatch(watchID);
			};

			q.promise.clearWatch = function (id) {
				navigator.geolocation.clearWatch(id || watchID);
			};

			q.promise.watchID = watchID;

			return q.promise;
		},

		clearWatch: function (watchID) {
			return navigator.geolocation.clearWatch(watchID);
		}
	};
}]);

AppService.factory("VendorServ",function($http,$q){

	var Obj = {};

	Obj.GetVendor = function(VendorId){

		var Url = BaseUrl + "/api/vendor/" + VendorId;

		return $http.get(Url).success(function(data){
			return data;
		});
	}

	return Obj;
});

AppService.factory("VendorsConected",function($http,$q){

	var Obj = {};

	var Url = BaseUrl + "/api/vendor/bystatus"

	Obj.GetVendors = function(lat, long){

		return $http.post(Url, {
			lat: lat,
			long: long,
		}).success(function(data){
			return data;
		});
	}

	return Obj;
});
