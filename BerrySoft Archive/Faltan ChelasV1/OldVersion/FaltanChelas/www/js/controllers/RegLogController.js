angular.module('RegLogCtrl',[]).controller('RegLogController',function($scope,$ionicPopup,Auth,UserServ,FCVars,$localStorage){

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
		            	//save Data.Usuario:
		            	$localStorage.setObject('UserFC',data.usuario);
		                window.location = 'index.html';

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

	$scope.Register = function(){

		if(	$scope.NewUser.email != undefined &&
			$scope.NewUser.phone != undefined &&
			$scope.NewUser.password != undefined ){

			if (ValidateEmail($scope.NewUser.email)) {

				UserServ.Create($scope.NewUser).success(function(data){
					console.log(data);

					if(data.success){
						var alertPopup = $ionicPopup.alert({
				     		title: 'Registro Exitoso',
				     		template: 'Ya puedes iniciar sesion.'
				   		});
				   		alertPopup.then(function(res) {
							$scope.ShowLogin = true;
							$scope.ShowRegister = false;

							$scope.NewUser.email = null;
							$scope.NewUser.password = null;
							$scope.NewUser.phone = null;
						});
				   	}else{
		            	Alerta("Error",data.message);
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
