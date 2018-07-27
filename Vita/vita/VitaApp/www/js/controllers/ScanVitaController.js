angular.module('ScanVitaCtrl',[]).controller('ScanVitaController',function($scope,$cordovaBarcodeScanner){
    $scope.Url = "No Code Already Scanned.";
    $scope.$on("$ionicView.enter", function() {
        $cordovaBarcodeScanner.scan().then(function(barcodeData) {
            console.log("Barcode Format -> " + barcodeData.format);
            console.log("Cancelled -> " + barcodeData.cancelled);
            console.log("TEXT -> " + barcodeData.text);
            $scope.Url = barcodeData.text;
          }, function(error) {
            // An error occurred
            console.log('ERROR');
            console.log(error);
          });
    });
});
