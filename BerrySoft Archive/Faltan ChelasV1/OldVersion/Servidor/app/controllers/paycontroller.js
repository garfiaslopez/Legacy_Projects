//MODELS

module.exports = {

	GettingToken: function(req,res){

		console.log(req.body);

		res.json({success: true , body: req.body });


	}


}