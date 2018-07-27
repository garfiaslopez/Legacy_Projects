angular.module('UsersCtrl',[]).controller('UsersController',function($scope,$mdDialog,MainVars,UserServ){

	var self = this;

	var Profile = MainVars.GetUser();
	console.log(Profile);

	//initialize 'seccion'
	self.Usuario = {
		username: null,
		password: null,
		name: null,
		phone: null,
		address: null,
		rol: null
	}

	self.isEditing = {
		flag: false,
		id: null
	};

	if(Profile.rol == "SuperAdministrador"){
		self.ActiveRoles = true;
		self.Roles = ["Usuario","Administrador"];
	}else{
		self.ActiveRoles = false;
		//self.Roles = ["Empleado","Administrador"];
	}


	function ClearTextFields(){

		self.Usuario.username = null;
		self.Usuario.password = null;
		self.Usuario.name = null;
		self.Usuario.phone = null;
		self.Usuario.address = null;
		self.Usuario.rol = "Empleado";

		self.isEditing.flag = false;
		self.isEditing.id = null;
	}

	function Alerta(title, message){

		$mdDialog.show( $mdDialog.alert()
	        .parent(angular.element(document.body))
	        .title(title)
	        .content(message)
	        .ariaLabel('Alert Dialog Demo')
	        .ok('OK')
		);

	}

	function ReloadData(){
		self.UsersOnDB = [];
		if(Profile.rol == "SuperAdministrador"){
			UserServ.All().success(function(data){
				self.UsersOnDB = data.users;
			});
		}
		self.Usuario.rol = "User";
	}

	ReloadData();

	self.Submit = function(){

		if (self.Usuario.username != undefined &&
			self.Usuario.password != undefined &&
			self.Usuario.name != undefined &&
			self.Usuario.phone != undefined &&
			self.Usuario.address != undefined ){

			if(self.isEditing.flag){

				UserServ.Update(self.isEditing.id,self.Usuario).success(function(data){

					if(data.success){

						Alerta('Usuario Actualizado.',data.message);

						ReloadData();
						ClearTextFields();

					}else{
						Alerta('Error',data.message);
					}

				}).error(function(data){
					Alerta('Error',data.message);
		       	});

			}else{
				UserServ.Create(self.Usuario).success(function(data){
					if(data.success){

						Alerta('Usuario Agregado.',data.message);

						ReloadData();
						ClearTextFields();

					}else{
						Alerta('Error',data.message);
					}
				}).error(function(data){
					Alerta('Error',data.message);
		       	});
			}
		}else{
			Alerta('Datos Incompletos','Favor de rellenar todos los campos.');
		}
	}

	self.Edit = function(UserDB){

		ClearTextFields();

		self.Usuario.username = UserDB.username;
		self.Usuario.password = UserDB.password;
		self.Usuario.name = UserDB.info.name;
		self.Usuario.phone = UserDB.info.phone;
		self.Usuario.address = UserDB.info.address;
		self.Usuario.rol = UserDB.rol;

		self.isEditing.flag = true;
		self.isEditing.id = UserDB._id;

	}

	self.CancelEditing = function(){
		ClearTextFields();
	}

	self.Delete = function(UserDB){
		UserServ.Delete(UserDB._id).success(function(data){
			Alerta('Usuario Eliminado',data.message);
			ReloadData();
			ClearTextFields();
		}).error(function(data){
			Alerta('Error',data.message);
	    });
	}

});
