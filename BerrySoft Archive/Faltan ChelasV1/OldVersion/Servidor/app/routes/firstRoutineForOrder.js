

			var index=0;
	  		
			var intervalo = setInterval(function hello() {
			  	//remove listener 

			  	if(index >= Tienderos.length){
  					console.log("NO HUBO TIENDEROS");

  					UserRequest.socket.emit('Rechazada', {msg: "ORDER ID: XXXXXXXXXX"});
  					clearInterval(intervalo);

  				}else{

  					function VendorAccept(data){

			  		console.log("TIENDERO ACEPTO" + tiendero.vendor);
  					console.log(data);
  					UserRequest.socket.emit('Aceptada', {msg: "ORDER ID: XXXXXXXXXX"});
  					clearInterval(intervalo);


				  	}

				  	console.log("INDEX" + index);

				  	if(index > 0){
				  		console.log("removiendo anterior");
				  		var TienderoBefore = Tienderos[index-1];
				  		TienderoBefore.socket.removeAllListeners('Aceptar');
				  	}

					var tiendero = Tienderos[index];
	  				console.log('SEARCHING:...' + tiendero.socket);

	  				tiendero.socket.emit('pedido', {msg: "TEST JUST FOR ONE"});

	  				tiendero.socket.on('Aceptar',VendorAccept);

	  				index += 1;
  				}

			  	// if(index == 3){
			  	// 	clearInterval(intervalo);
			  	// }

			  return hello;
			}(), 30000);