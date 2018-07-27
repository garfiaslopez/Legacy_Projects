angular.module('RegLogCtrl',[]).controller('RegLogController',function($scope,$state,$ionicHistory,$ionicPopup,$localStorage,Auth,UserServ){

	$scope.ShowLogin = true;
	$scope.ShowRegister = false;
	$scope.NewUser = {
		email: null,
		phone: null,
		password: null
	}
	$scope.User = {
		email: null,
		password: null
	}

	function Alerta(title,msg){
		var alertPopup = $ionicPopup.alert({
     		title: title,
     		template: msg
   		});
	}

	function ValidateEmail(email) {
	    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	    return re.test(email);
	}

  	$scope.SelectedLogin = function(){
		$scope.ShowLogin = true;
		$scope.ShowRegister = false;	
	}

  	$scope.SelectedRegister = function(){
		$scope.ShowLogin = false;
		$scope.ShowRegister = true;	
	}

	$scope.Login = function(){

		if(	$scope.User.email != undefined &&
			$scope.User.password != undefined ){

			if (ValidateEmail($scope.User.email)) {

				Auth.Login($scope.User.email, $scope.User.password).success(function(data) {

		            if(data.success){
		            	$localStorage.setObject('VendorFC',data.usuario);
		            	$ionicHistory.nextViewOptions({
			                disableAnimate: true,
			                disableBack: true
			            });
		            	$state.go('App.Main');

		            }else{
		            	Alerta("Error","Usuario o Contraseña Incorrectas.");
		            }

		       	}).error(function(data){
		   			if(data){
		   				Alerta("Error",data.message);
		   			}else{
						Alerta("Error",'No se puede comunicar con el servidor.');
		   			}
		       	});
			}else{
				Alerta("Error","Favor de ingresar un Email Valido.");
			}
		}else{
			Alerta("Error","Favor de rellenar todos los campos.");
		}
	}



})
