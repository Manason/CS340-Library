var fs = require('fs');
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var http = require('http').Server(app);
var config = require('./config.json');
var io = require('socket.io')(http);
var insertion = require('./insertion.js');

//database setup and connection
var mysql = require('mysql');

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
app.use(express.static('public')); //serves index.html

//receive client events
io.on('connection', function(socket){
	console.log("a user connected");
	socket.on('getCatalog',function(data){
		var getCatalog = "SELECT DISTINCT M.title, B.author, M.sectionName, M.type FROM Media M, Book B WHERE M.mediaID=B.mediaID ORDER BY M.mediaID DESC LIMIT 7";
		con.query(getCatalog,function(err,res){
			socket.emit('catalog',res)
		});
	});
	socket.on('bookdonate', function(data){ insertion.insertBook(data,con) });
	socket.on('filmdonate', function(data){ insertion.insertFilm(data,con) });
	
});