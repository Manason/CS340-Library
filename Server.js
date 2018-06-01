var fs = require('fs');
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var http = require('http').Server(app);
var config = require('./config.json');
var io = require('socket.io')(http);
var sqlQueries = require('./sqlQueries.js');

//database setup and connection
var mysql = require('mysql');

/*
var con = mysql.createConnection({
	host: config.dbhost,
	user: config.dbuser,
	password: config.dbpass,
	database: "cs340_edwarda3"
});

con.connect(function(err) {
	if(err) throw err;
	console.log("Connected to Database");
});
*/

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
app.get('/donate/film', function(req, res){
	res.sendFile(__dirname + '/public/donateFilm.html');
});
app.get('/signup', function(req, res){
	res.sendFile(__dirname + '/public/signup.html');
});
app.get('/postreview', function(req, res){
	res.sendFile(__dirname + '/public/postReview.html');
});
app.use(express.static('public')); //serves index.html

//receive client events
io.on('connection', function(socket){
	console.log("a user connected");
	/*socket.on('getCatalog',function(data){ sqlQueries.getCatalog(data,con,socket); });
	socket.on('getMedia',function(data){ sqlQueries.getMedia(data,con,socket); });
	socket.on('getInfo',function(data){ sqlQueries.getInfo(data,con,socket); });
	socket.on('getUsers',function(data){ sqlQueries.getUsers(data,con,socket); });
	socket.on('bookdonate', function(data){ sqlQueries.insertBook(data,con); });
	socket.on('filmdonate', function(data){ sqlQueries.insertFilm(data,con); });
	socket.on('signup', function(data){ sqlQueries.createUser(data,con,socket); });
	socket.on('postReview', function(data){ sqlQueries.postReview(data,con,socket); });*/
});