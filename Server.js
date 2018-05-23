var fs = require('fs');
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var http = require('http').Server(app);

var io = require('socket.io')(http);

//database setup and connection
var mysql = require('mysql');

var con = mysql.createConnection({
	host: "hostname",
	user: "username",
	password: "password"
});

con.connect(function(err) {
	if(err) throw err;
	console.log("Connected to Database");
});


//server startup
http.listen(process.env.PORT || 8080, function(){
	console.log("server running on port " + this.address().port);
});
app.get('/', function(req, res){
	res.sendFile(__dirname + '/public/index.html');
});
app.get('/donate/book', function(req, res){
	res.sendFile(__dirname + '/public/donateBook.html');
});
app.use(express.static('public')); //serves index.html

//receive client events
io.on('connection', function(socket){
	console.log("a user connected");
});