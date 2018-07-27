angular.module('CheckoutCtrl',[]).controller('CheckoutController',function($scope,$state,$ionicLoading,$ionicHistory,$localStorage,$ionicPopup,ConfigServ,FCVars,UserServ){
    
    function Alerta(title,msg){
        var alertPopup = $ionicPopup.alert({
            title: title,
            template: msg
        });
    }

    var conektaSuccessResponseHandler;
    var conektaErrorResponseHandler;
    $scope.Form = {};
    $scope.NewCard = {};


    var UserSession = $localStorage.getObject('UserFC');
    console.log("USUARIO:" , UserSession);

    var Coords = FCVars.GetCoords();
    console.log("coordenadas reales");
    console.log("COORDS:" , Coords);

    //FOR TESTING 
    // var Coords = {
    //     denomination: 'Direccion De Prueba',
    //     loc:{
    //         long: -99.17320603972699, 
    //         lat: 19.412214513889193
    //     }
    // };

    $scope.Products = FCVars.GetOrders();

    var UserFromDB;
	var total = 0;

	angular.forEach($scope.Products, function(pro, key) {
		total = total + Number(pro.price);
	});	

	$scope.ServiceCharge = 20;
    $scope.ShowForm = true;
    var PaymethodSelected = undefined;

    function ReloadData(){

        //Obtener Configuraciones
        ConfigServ.All().success(function(data){
            if(data.success){
                var Configs = data.configs;
                angular.forEach(Configs, function(conf, key) {
                    if(conf.denomination == "COMISION_FC" ||conf.denomination == "comisionfc" ||
                        conf.denomination == "Comision_FC" ||conf.denomination == "Comision" ||
                        conf.denomination == "COMISION" ||conf.denomination == "COMISIONFC"){
                        $scope.ServiceCharge = Number(conf.parameter);
                    }else{
                        $scope.ServiceCharge = 20;
                    }
                    //total order when i get the comission.
                    $scope.TotalOrder = total + $scope.ServiceCharge;
                }); 
            }else{
                Alerta("Error",data.message);
            }
        }); 

        //Obtener datos del usuario:
        UserServ.Get(UserSession._id).success(function(data){
            if(data.success){
                console.log("USER FROM DB");
                console.log(data);

                UserFromDB = data.user;
                if(UserFromDB.paymethods.length > 0){
                    $scope.ListPayMethods = UserFromDB.paymethods;
                    $scope.ShowForm = false;
                }else{
                    $scope.ShowForm = true;
                }
            }
        })

    }

    ReloadData();

    var CardSelected;
    $scope.SelectedPayMethod = function(Card){
        Card.Selected = true;
        CardSelected = Card;
    }

    $scope.AddPayMethod = function(){

        CardSelected = undefined;
        angular.forEach($scope.ListPayMethods, function(card, key) {
            card.Selected = false;
        });

        var myPopup = $ionicPopup.show({
            template: '<label class="item-input"><input type="text" placeholder="Nombre del tarjetahabiente" ng-model="NewCard.card.name"></label><label class="item-input"><input type="text" placeholder="Numero de tarjeta (16 Dig.)" ng-model="NewCard.card.number"></label><div class="row DebitCardForm"><label class="DebitForm item-input"><input class="DebitInput" type="text" placeholder="CVC" ng-model="NewCard.card.cvc"></label><label class="DebitForm item-input"><input class="DebitInput" type="text" placeholder="Mes XX" ng-model="NewCard.card.exp_month"></label><label class="DebitForm item-input"><input class="DebitInput" type="text" placeholder="2019" ng-model="NewCard.card.exp_year"></label></div>',
            title: 'Agregue Su Nueva Tarjeta',
            scope: $scope,
            buttons: [{ 
                text: 'Cancel' 
            },
            {
                text: '<b>Guardar</b>',
                type: 'button-positive',
                onTap: function(e) {
                    if (!$scope.NewCard.card) {
                        e.preventDefault();
                    } else {
                        return $scope.NewCard;
                    }    
                }   
            }]  
        });

        myPopup.then(function(NewCard) {
            console.log('Tapped!', NewCard);

            if(NewCard){
                Conekta.token.create(NewCard, AddNewCardToList, conektaErrorResponseHandler);
            }

        });
    }

    function AddNewCardToList(token){

        $ionicLoading.hide();

        $scope.ListPayMethods.push({
            termination: $scope.NewCard.card.number.substr($scope.NewCard.card.number.length - 4),
            Selected: true,
            isNew: true,
            denomination: 'NUEVA',
            tokenization: token.id
        });

    }

    function SendDataToServer(tokenized,token){

        Coords.denomination = $scope.CoordsDenomination;
        var orden = {
            info: {
                isTokenized: tokenized,
                token: token
            },
            order: $scope.Products,
            user: {
                _id: UserFromDB._id,
                name: UserFromDB.name || 'No Name Provided',
                email: UserFromDB.email.address,
                phone: UserFromDB.phone
            },
            coords: Coords
        }

        console.log(orden);

        FCVars.SetFinalOrder(orden);
        FCVars.SetIsReadyForProcessing(true);
        $ionicHistory.nextViewOptions({
            disableBack: true
        });
        $ionicLoading.hide();
        $state.go('App.Main', {}, { reload: true });

    }

  	$scope.MakeOrder = function(){

  		$ionicLoading.show({
      		template: 'Procesando Orden'
    	});

        //If is the form && Already added card && new saved card
        console.log("BEFORE MAKE ORDER");
        console.log(CardSelected);
        if(CardSelected){
            //Es Nueva o ya agregada
            if(CardSelected.isNew){
                SendDataToServer(false,CardSelected.tokenization);
            }else{
                SendDataToServer(true,CardSelected.tokenization);
            }

        }else{

            if($scope.Form.card){
                Conekta.token.create($scope.Form, conektaSuccessResponseHandler, conektaErrorResponseHandler);
            }else{
                $ionicLoading.hide();
                Alerta('Error','Favor de agregar algun método de pago.');
            }
        }

	}
    conektaSuccessResponseHandler = function(token){
        console.log("SUCCESS RESPONSE CONEKTA");
        console.log(token);

        SendDataToServer(false,token.id);
    };
    conektaErrorResponseHandler = function(response){
        $ionicLoading.hide();
        Alerta('Error Al Procesar Tu Orden:',response.message_to_purchaser);
    };


})
