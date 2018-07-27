angular.module('VendorCtrl',[]).controller('VendorController',function($rootScope,$location,$scope,$mdSidenav,$mdDialog,Auth,VendorServ){

	var self = this;

	self.AddVendor = function(){

        $scope.Tittle = "Añadir Vendedor";
		$scope.CloseMenu();
    	$location.path("/AddVendedor");
	}

	function ReloadData(){
		self.VendorsOnDB = [];
		VendorServ.All().success(function(data){
			self.VendorsOnDB = data.vendors;
			console.log(self.VendorsOnDB);
		});
	}

	ReloadData();

	self.Detail = function (VendorDB){

       	console.log(VendorDB);

       	var parentEl = angular.element(document.body);

		$mdDialog.show({
         	parent: parentEl,
         	template:
		           '<md-dialog aria-label="List dialog">' +
		           '  	<md-dialog-content>'+
		           '    	<md-list>'+
		           '      		<md-list-item>'+
		           '       			<p>Name: 	{{info.name}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>Phone: 	{{info.phone}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>Tienda: 	{{info.marketname}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>Genero: 	{{info.gender}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>Fecha Nac : 	{{info.birthdate}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>Nombre: 	{{info.othercontact.name}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>Telefono: 	{{info.othercontact.phone}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>Nombre: 	{{info.paydata.name}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>Banco: 	{{info.paydata.bank}}</p>' +
		           '      		</md-list-item>' +
		           '      		<md-list-item>'+
		           '       			<p>CLABE: 	{{info.paydata.clabe}}</p>' +
		           '      		</md-list-item>' +
		           '		</md-list>'+
		           '  	</md-dialog-content>' +
		           '  	<div class="md-actions">' +
		           '    	<md-button ng-click="closeDialog()" class="md-primary">' +
		           '      		Cerrar' +
		           '    	</md-button>' +
		           '  	</div>' +
		           '</md-dialog>',
         	locals: {
           		info: VendorDB
         	},
          	controller: function DialogController($scope, $mdDialog) {
            	$scope.closeDialog = function() {
              		$mdDialog.hide();
            	}
            	$scope.info = VendorDB;
          	}
        });

	}

});
