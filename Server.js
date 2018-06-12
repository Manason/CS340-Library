var fs = require('fs');
var express = require('express');
var bodyParser = require('body-parser');
var config = require('./config.json');
var sqlQueries = require('./sqlQueries.js');
var mysql = require('mysql');

var app = require('express')(),
	http = require('http').Server(app),
	io = require('socket.io')(http),
	session = require('express-session')({
		secret: '1-jX+k83mJ5EL=%C^1XVasYBPhgZ81-h',
		resave: true,
		saveUninitialized: true
	}),
	sharedsession = require('express-socket.io-session');

app.use(session)
io.use(sharedsession(session,{
	autoSave:true
}));

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
app.get('/login', function(req, res){
	res.sendFile(__dirname + '/public/login.html');
});
app.get('/profile', function(req, res){
	res.sendFile(__dirname + '/public/profile.html');
});
app.get('/profile/:profileID', function(req, res){
        var profileID = req.params.profileID;
		app.set('view engine', 'ejs');
        res.render('profile2.ejs', {profileID: profileID});
});
app.use(express.static('public')); //serves index.html



//receive client events
io.on('connection', function(socket){
	console.log("a user connected");
	
	console.log(socket.handshake.session.userID);
	
	socket.on('getCurUser', function(data){
		pool.getConnection(function (err, con){
			if(err)
				con.release();
			sqlQueries.getCurrentUsername(data, con, socket);
			con.release();
		});
	});
	socket.on('getFavoriteMedia', function(data){
		pool.getConnection(function (err, con){
			if(err)
				con.release();
			sqlQueries.getFavoriteMedia(data, con, socket);
			con.release();
		});
	});
	socket.on('updateFav', function(data){
		pool.getConnection(function (err, con){
			if(err)
				con.release();
			sqlQueries.updateFav(data, con, socket);
			con.release();
		});
	});
	socket.on('checkout', function(data){
		pool.getConnection(function (err, con){
			if(err)
				con.release();
			sqlQueries.checkoutMedia(data, con, socket);
			con.release();
		});
	});
	socket.on('loginAttempt', function(data){
		pool.getConnection(function (err, con){
			if(err)
				con.release();
			sqlQueries.checkLogin(data, con, socket);
			con.release();
		});
	});
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
      
    socket.on('getReviewsUser',function(data){
        pool.getConnection(function(err, con){
            if(err)
                con.release();
            sqlQueries.getReviewsUser(data,con,socket);
            con.release();
        });
    });
	socket.on('getCheckedMedia',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.getCheckedMedia(data,con,socket);
			con.release();
		});
	});
	socket.on('returnMedia',function(data){ 
		pool.getConnection(function(err, con){
			if(err)
				con.release();
			sqlQueries.returnMedia(data,con,socket);
			con.release();
		});
	});
});
