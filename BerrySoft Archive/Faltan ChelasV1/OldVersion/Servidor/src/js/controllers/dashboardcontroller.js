angular.module('DashCtrl',[]).controller('DashboardController',function($scope,Socket){

	var vc = this;
	
	Socket.on('news', function (data) {
		console.log(data);
		Socket.emit('my other event', { my: 'data' });
	});

    vc.conectar = function(){
    	console.log("SEND");
        //Socket.emit('my other event',{info: 'DATA'});

        Socket.emit('search',{info: 'DATA'});


    }

    Socket.on('pedido', function (data) {
		console.log(data);
		alert(data);
	});


    vc.Add = function(){

    	var ID = Math.random();

        Socket.emit('AddTiendero',{name: 'Jose Garfias - ' + ID});
    }


    vc.Aceptar = function(){

        Socket.emit('Aceptar',{name: 'Jose Garfias'});
    }



});
