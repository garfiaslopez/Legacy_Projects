var AppService = angular.module('AppService',[]);

	var BaseUrl = "http://104.131.24.52:3000"
	//var BaseUrl = "http://localhost:8080";
	//var BaseUrl = "http://192.168.0.2:8080";

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
	var Coords = {
		lat: 0.0,
		long: 0.0
	};

	var SetFinalOrder = function(order){
		FinalOrder = order;
		$localStorage.setObject('FinalOrderVendor',order);
	}
	var GetFinalOrder = function(){
		return $localStorage.getObject('FinalOrderVendor');
	}
	var DeleteFinalOrder = function(){
		FinalOrder = {};
		$localStorage.setObject('FinalOrderVendor',{});
	}

	var SetCoords = function(latitude, longitude){
		Coords.lat = latitude;
		Coords.long = longitude;
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
		$localStorage.Set('isOnWayVendor',bool);
	}
	var GetIsOnWay = function(){
		if($localStorage.Get('isOnWayVendor') == 'true' || $localStorage.Get('isOnWayVendor') == 'True'){
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

	var Url = BaseUrl + "/api/product"

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
			email: Data.username,
			password: Data.password
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

AppService.factory("SellServ",function($http,$q){
    
	var Obj = {};

	Obj.GetSell = function(SellId){

		var Url = BaseUrl + "/api/sell/" + SellId;

		return $http.get(Url).success(function(data){
			return data;
		});
	}

	Obj.AllByVendorPending = function(Id){
		
		var Url = BaseUrl + "/api/sell/pendingvendororders/" + Id
		
		return $http.post(Url).success(function(data){
			return data;
		});
	}



	Obj.AllByVendorDate = function(Id,initialDate,finalDate){

		var Url = BaseUrl + "/api/sell/byvendor/" + Id

		return $http.post(Url, {
			initialDate: initialDate,
			finalDate: finalDate
		}).success(function(data){
			return data;
		});
	}


	Obj.AllByVendorDateStatus = function(Id,initialDate,finalDate,status){
		
		var Url = BaseUrl + "/api/sell/byvendor/" + Id

		return $http.post(Url, {
			initialDate: initialDate,
			finalDate: finalDate,
			status: status
		}).success(function(data){
			return data;
		});
	}


	Obj.AllByVendorStatus = function(Id,status){

		var Url = BaseUrl + "/api/sell/byvendor/" + Id

		return $http.post(Url, {
			status: status
		}).success(function(data){
			return data;
		});

	}

	return Obj;
});


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


