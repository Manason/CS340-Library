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

var pool = mysql.createPool({
	connectionLimit: 100,
	host: config.dbhost,
	user: config.dbuser,
	password: config.dbpass,
	database: "cs340_edwarda3"
});

//server startup
http.listen(parseInt(process.argv[2]), function(){
	console.log("server running on port " + this.address().port);
});

//routings
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
	socket.on('getCatalog',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.getCatalog(data,con,socket);
			con.release();
		});
	});
		
	socket.on('getMedia',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.getMedia(data,con,socket);
			con.release();
		});
	});

	socket.on('getInfo',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.getInfo(data,con,socket);
			con.release();
		});
	});

	socket.on('getUsers',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.getUsers(data,con,socket);
			con.release();
		});
	});
	
	socket.on('bookdonate',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.insertBook(data,con); 
			con.release();
		});
	});
	
	socket.on('filmdonate',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.insertFilm(data,con);
			con.release();
		});
	});
	
	socket.on('signup',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.createUser(data,con,socket);
			con.release();
		});
	});
	
	socket.on('postReview',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.postReview(data,con,socket);
			con.release();
		});
	});
});