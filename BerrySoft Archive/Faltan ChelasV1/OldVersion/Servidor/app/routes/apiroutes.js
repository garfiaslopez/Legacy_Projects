	
var AuthMidd = require("../middlewares/auth");

var UserAdminFunctions = require("../controllers/useradmincontroller");
var VendorFunctions = require("../controllers/vendorcontroller");
var ConfigFunctions = require("../controllers/configcontroller");
var ProductFunctions = require("../controllers/productcontroller");
var UserFunctions = require("../controllers/usercontroller");
var PayFunctions = require("../controllers/paycontroller");
var SellFunctions = require("../controllers/sellcontroller");

var express = require("express");
var ApiRouter = express.Router();


//avoid the middlewaretoken for register:
ApiRouter.route("/user")		.post(UserFunctions.Create);


ApiRouter.use(AuthMidd.AuthToken);


ApiRouter.route("/useradmin")	.post(UserAdminFunctions.AddNewUserAdmin)
								.get(UserAdminFunctions.AllUsersAdmin);

ApiRouter.route("/useradmin/:useradmin_id")	.get(UserAdminFunctions.SearchUserAdminById)
											.put(UserAdminFunctions.UpdateUserAdminById)
											.delete(UserAdminFunctions.DeleteUserAdminById);


ApiRouter.route("/vendor")		.post(VendorFunctions.AddNewVendor)
								.get(VendorFunctions.AllVendors);

ApiRouter.route("/vendor/:vendor_id")		.get(VendorFunctions.SearchVendorById);

ApiRouter.route("/vendor/bylocation")		.post(VendorFunctions.SearchVendorsByLoc);

ApiRouter.route("/vendor/bystatus")			.post(VendorFunctions.SearchVendorsByStatus);


ApiRouter.route("/user")		.get(UserFunctions.All);

ApiRouter.route("/user/:user_id")		.get(UserFunctions.ById) 
										.put(UserFunctions.UpdateById)
										.delete(UserFunctions.DeleteById);
										


ApiRouter.route("/config")		.post(ConfigFunctions.Create)
								.get(ConfigFunctions.All);

ApiRouter.route("/config/:config_id")		.put(ConfigFunctions.UpdateById)
											.delete(ConfigFunctions.DeleteById);

ApiRouter.route("/product")		.post(ProductFunctions.Create)
								.get(ProductFunctions.All);

ApiRouter.route("/product/bytype") .post(ProductFunctions.AllByType);

							
ApiRouter.route("/product/:product_id")		.put(ProductFunctions.UpdateById)
											.delete(ProductFunctions.DeleteById);
							
ApiRouter.route("/sell/all")						.post(SellFunctions.All);
ApiRouter.route("/sell/bydate")						.post(SellFunctions.AllByDate);
ApiRouter.route("/sell/byvendor/:vendor_id")		.post(SellFunctions.AllByVendorDate);
ApiRouter.route("/sell/byuser/:user_id")			.post(SellFunctions.AllByUserDate);
ApiRouter.route("/sell/pendinguserorders/:user_id")	.post(SellFunctions.AllByUserPending);
ApiRouter.route("/sell/pendingvendororders/:vendor_id")	.post(SellFunctions.AllByVendorPending);
ApiRouter.route("/sell/:sell_id")					.get(SellFunctions.ById)
													.delete(SellFunctions.DeleteById);







module.exports = ApiRouter;