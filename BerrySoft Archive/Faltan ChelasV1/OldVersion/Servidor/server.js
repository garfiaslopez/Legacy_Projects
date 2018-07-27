
var express = require("express");
var app = express();
var cors = require('cors');
var bodyParser = require("body-parser");
var morgan = require("morgan");
var mongoose = require("mongoose");
var path = require('path');
var swig = require('swig');
swig.setDefaults({ varControls: ['{[{', '}]}'] });

process.env.NODE_ENV = process.env.NODE_ENV || 'development';
var Config = require('./config/config');

var port = process.env.PORT || Config.port;

// view engine setup
app.set('view engine', 'html');
app.set('views', path.join(__dirname, 'src/pages'));
app.engine('.html', swig.renderFile);
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
app.use(cors());
app.use(morgan("dev"));

//MONGOSSE CONNECTION TO MONGO
//  command: export LC_ALL=C     error: BadValue Invalid
//  command: sudo mkdir -p /data/db       |      sudo chmod 0755 /data/db     |    sudo chown mongod:mongod /data/db

mongoose.connect(Config.mongodb);

//SET THE ROUTES OF ALL:
require("./app/routes/setroutes")(__dirname,app,express);

var server = require('http').Server(app);

require('./app/routes/sockets.js').initialize(server);


//START SERVER: 
server.listen(Config.port);
//app.listen(Config.port);
console.log("Server started at port: " + Config.port);