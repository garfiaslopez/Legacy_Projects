module.exports = function(root,app,express){
	

	function AdministerPage(req,res){
        var config = require('../../config/config');
        res.render('index', {config: config});
	}

	function LoginPage(req,res){
    	var config = require('../../config/config');
    	res.render('login', {config: config});
	}

	function OtherPage(req,res){
        var config = require('../../config/config');
        res.render('index', {config: config});
	}

	app.get("/login",LoginPage);

	//put the index to homepage
	app.get("/",AdministerPage);



	var Apiroutes = require("./apiroutes");
	var Authroutes = require("./authroutes")(app,express);

	//STATIC ROUTES:
	app.use("/src", express.static(root + "/src"));
	app.use("/bower_components", express.static(root + "/bower_components"));

	//register the auth routes to app
	app.use("/authenticate",Authroutes);

	//register the api routes to app
	app.use("/api",Apiroutes);

	app.get("*",OtherPage);

}