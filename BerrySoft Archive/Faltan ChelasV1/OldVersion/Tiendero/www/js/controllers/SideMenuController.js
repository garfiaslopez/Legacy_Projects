angular.module('SideMenuCtrl',[]).controller('SideMenuController', function($scope,$state, $localStorage, $ionicLoading , $ionicModal, $timeout , FCVars,SellServ, UserServ, Auth) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

    var VendorSession = $localStorage.getObject('VendorFC');
    console.log("Vendor:", VendorSession);

    function ReloadData(){
        
        $ionicLoading.show({
            template: 'Llenando el refri...'
        });

        SellServ.AllByVendorStatus(VendorSession._id,'Cobrado').success(function(data){
            
            if(data.success){

                console.log(data.sells);
                
                $scope.SellsOnDB = data.sells;
                $scope.CountSells = $scope.SellsOnDB.length;
                
                var total = 0;
                angular.forEach($scope.SellsOnDB, function(sell, key) {
                    total = total + sell.total;
                    sell.date = moment(sell.date).format('YYYY-MM-DD');
                });
                $scope.TotalSells = total;
                
                $ionicLoading.hide();
            
            }else{
                $ionicLoading.hide();
            }
        }).error(function(data){
            $ionicLoading.hide();
        });    
    }

    ReloadData();


    // Create the login modal that we will use later
    $ionicModal.fromTemplateUrl('templates/historial.html', {
        scope: $scope
    }).then(function(modal) {
        $scope.ModalHistory = modal;
    });

    // Triggered in the login modal to close it
    $scope.CloseModalHistory = function() {
        $scope.ModalHistory.hide();
    };

    // Open the login modal
    $scope.OpenHistory = function() {
        $scope.ModalHistory.show();
    };

    $scope.LogOut = function() {
        
        Auth.LogOut();
        $localStorage.setObject('UserFC',{});

        FCVars.DeleteFinalOrder();
        FCVars.DeleteCoords();
        FCVars.SetIsReadyForProcessing(false);
        
        $state.go("Login");
    };


});
