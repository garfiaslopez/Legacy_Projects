var AuthenticateFunctions = require("../controllers/authcontroller");

module.exports = function(app, express){

	//routes for the api
	var AuthRouter = express.Router();

	AuthRouter.post("/",AuthenticateFunctions.AuthByUser);
	AuthRouter.post("/admin",AuthenticateFunctions.AuthByUserAdmin);
	AuthRouter.post("/vendor",AuthenticateFunctions.AuthByVendor);

	return AuthRouter;

}