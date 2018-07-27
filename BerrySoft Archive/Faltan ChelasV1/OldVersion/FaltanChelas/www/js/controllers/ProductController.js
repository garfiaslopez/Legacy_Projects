angular.module('ProductCtrl',[]).controller('ProductController',function($scope,$state,$ionicLoading,$ionicPopup,ProductServ,FCVars){

	$scope.Order = {
		product: null,
		description: null,
		quantity: null,
		price: null
	};

	var Products = false;

	var ChelasSelected = [];
	var ChelasCountSelected = 0;
	var ChelasTotalSelected = 0;

	function Alerta(title,msg){
		var alertPopup = $ionicPopup.alert({
     		title: title,
     		template: msg
   		});
	}

	function ReloadData(){

		$scope.ProductsOnDB = [];

		$ionicLoading.show({
      		template: 'Revisando el refri...'
    	});

		ProductServ.AllByType("primary").success(function(data){

			if(data.success){

				if(data.products.length > 0){
					Products = true;
					$scope.ProductsOnDB = data.products;
				}else{
					Products = false;
					$scope.ProductsOnDB = [];
					$scope.ProductsOnDB.push({denomination:'Por ahora no hay productos'});
				}
			}else{
				Alerta("Error",data.message);
			}

			$ionicLoading.hide();

		});	

	}

	ReloadData();

	$scope.SelectedPrice = function(product,price){

		price.Selected = !price.Selected;

		if(price.Selected){
			var ChelasCountNow = ChelasCountSelected + Number(price.quantity);
			if(ChelasCountNow <= 24){
				ChelasCountSelected = ChelasCountNow;
				ChelasTotalSelected += price.price;
				var Chela = {};
				Chela.product = product.denomination;
				Chela.description = product.description;
				Chela.price = price.price;
				Chela.quantity = price.quantity;

				ChelasSelected.push(Chela);

				$scope.Order.quantity = ChelasCountSelected;
				$scope.Order.price = ChelasTotalSelected;
			}else{
				price.Selected = !price.Selected;
				Alerta('¡Oops!','Por el momento sólo aceptamos pedidos menores a 24 chelas.');
			}
		}else{
			//delete from array the price and product selected
			var ChelasCountNow = ChelasCountSelected - Number(price.quantity);
			ChelasCountSelected = ChelasCountNow;
			ChelasTotalSelected -= price.price;
			var Chela = {};
			Chela.product = product.denomination;
			Chela.description = product.description;
			Chela.price = price.price;
			Chela.quantity = price.quantity;
			angular.forEach(ChelasSelected, function(ChelaSelected, key) {
				if( (ChelaSelected.product == Chela.product) && 
					(ChelaSelected.price == Chela.price) && 
					(ChelaSelected.quantity == Chela.quantity) && 
					(ChelaSelected.description == Chela.description)){
					ChelasSelected.splice(key,1);
				}
            }); 
			$scope.Order.quantity = ChelasCountSelected;
			$scope.Order.price = ChelasTotalSelected;
		}
	}

	$scope.Continue = function(){

		if(ChelasSelected.length > 0){
			FCVars.CleanOrders();
			angular.forEach(ChelasSelected, function(ChelaSelected, key) {
				FCVars.PushOrder(ChelaSelected);
            });
			$state.go('App.Checkout');
		}else{
			Alerta('¡No seas así!','Por favor selecciona mínimo una chela.');
		}

	}

  
})
