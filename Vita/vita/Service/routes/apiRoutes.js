 'use strict';

//  Module dependencies.
var UserFunctions = require("../controllers/userController");

var AuthenticateFunctions = require("../controllers/authController");
var MiddleAuth = require('./../middlewares/auth');

module.exports = function(server) {

    //  Redirect request to controller
    server.post('/authenticate',AuthenticateFunctions.AuthByUser);

    //the routes put before the middleware does not is watched.
    server.use(MiddleAuth.isAuthenticated);
    server.get('/authenticate/me',AuthenticateFunctions.InfoUser);

	//USERS ROUTESkey: "value",
	server.post('/user',UserFunctions.AddNewUser);

	server.get('/user/:user_id',UserFunctions.SearchUserById);
	server.put('/user/:user_id',UserFunctions.UpdateUserById);
	server.del('/user/:user_id',UserFunctions.DeleteUserById);
	server.post('/user/tokenme',UserFunctions.InfoUserByToken);
	server.get('/users',UserFunctions.AllUsers);

};
