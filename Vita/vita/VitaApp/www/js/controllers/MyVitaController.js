angular.module('MyVitaCtrl',[]).controller('MyVitaController',function($scope,$cordovaBarcodeScanner,$cordovaFile){
    console.log('MyVitaCtrl');
    $scope.$on("$ionicView.enter", function() {
        $cordovaBarcodeScanner.encode(cordova.plugins.barcodeScanner.Encode.TEXT_TYPE, "http://vita.com/profile/id=52192820287292/").then(function(image) {
            console.log('img');
            console.log(image);
            var path = image.file.substr(9,image.file.length);
            console.log(path);
            $cordovaFile.readAsDataURL(cordova.file.dataDirectory, path).then(function(ObjectImage) {
                console.log('objimg');
                $scope.Url = ObjectImage;
            }, function (err) {
                console.log(err);
              });
        }, function(error) {
            console.log(error);
        });
    });

});
