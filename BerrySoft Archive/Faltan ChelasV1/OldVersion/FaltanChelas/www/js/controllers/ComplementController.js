angular.module('ComplementCtrl',[]).controller('ComplementController',function($scope,$state,$ionicLoading,$ionicPopup,ProductServ,FCVars){

  	$scope.Order = {
		product: null,
		quantity: null,
		price: null
	};

	function Alerta(title,msg){
		var alertPopup = $ionicPopup.alert({
     		title: title,
     		template: msg
   		});
	}

	var Complements = false;

	function ReloadData(){

		$scope.ProductsOnDBComplement = [];

		$ionicLoading.show({
      		template: 'Revisando el refri...'
    	});

		ProductServ.AllByType("secondary").success(function(data){

			if(data.success){
				if(data.products.length > 0){
					Complements = true;
					$scope.ProductsOnDBComplement = data.products;
				}else{
					Complements = false;
					$scope.ProductsOnDBComplement = [];
					$scope.ProductsOnDBComplement.push({denomination:'Por Ahora No Hay Complementos'});
				}
			}else{
				Alerta("Error",data.message);
			}

			$ionicLoading.hide();

		});	

	}

	ReloadData();


	$scope.SelectedRow = function(product){

		if(Complements){
			//Clean Other Selecteds Rows:
			angular.forEach($scope.ProductsOnDB, function(pro, key) {
				pro.isSelected = false;
			});	

			product.isSelected = true;

			$scope.Order.price = product.prices[0].price;
			$scope.Order.quantity = product.prices[0].quantity;
			$scope.Order.product = product.denomination;
			$scope.Order.description = product.description;
			
		}else{
			angular.forEach($scope.ProductsOnDB, function(pro, key) {
				pro.isSelected = false;
			});	
		}
	}
  
  	$scope.Continue = function(){

		if($scope.Order != undefined){
			if($scope.Order.product && $scope.Order.price && $scope.Order.quantity){
				console.log("removing final order");
		  		FCVars.RemoveFinalOrder();
				FCVars.PushOrder($scope.Order);
				$state.go('Chekout');
			}else{
				FCVars.RemoveFinalOrder();
				$state.go('Chekout');
			}
		}else{
			FCVars.RemoveFinalOrder();
			$state.go('Chekout');
		}



	}

})
