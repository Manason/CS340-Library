module.exports = {
	getCurrentUsername : function(data,con,socket){
		socket.emit('username',socket.handshake.session.userID)
	},
	checkoutMedia : function(data,con,socket){
		var checkBookAvailable = "";
		if(data.type=="book") checkBookAvailable = "SELECT MIN(bookID) as 'check' FROM Book WHERE mediaID=? AND userID IS NULL";
		if(data.type=="film") checkBookAvailable = "SELECT MIN(filmID) as 'check' FROM Film WHERE mediaID=? AND userID IS NULL";
		con.query(checkBookAvailable,[data.mediaID],function(err,res){
			if(err) console.log(err);
			var checkoutBook = "";
			if(data.type=="book") checkoutBook = "UPDATE Book SET userID=? WHERE bookID=?";
			if(data.type=="film") checkoutBook = "UPDATE Film SET userID=? WHERE filmID=?";
			con.query(checkoutBook,[data.user,res[0].check],function(err2, res2){
				if(err2) console.log("checkout failed");
				else socket.emit('checkoutSuccess')
			});
		});
	},
	insertBook : function(data,con){
		var check = "SELECT COUNT(*) AS entries FROM Media M, Book B WHERE M.mediaID=B.mediaID AND M.title=? AND B.author=?";
		con.query(check,[data.title,data.author],function(err,res){
			if(res[0].entries==0){
				var ins = "INSERT INTO Media(title,description,type,sectionName,imageURL) VALUES(?,?,'book',?,NULL)"
				con.query(ins,[data.title,data.desc,data.section],function(err,res){
					if(err) throw err;
				});
				ins = "INSERT INTO Book(author,numPages,mediaID,userID) VALUES(?,?,(SELECT MAX(mediaID) FROM Media),NULL)"
				con.query(ins,[data.author,data.pages],function(err,res){
					if(err) throw err;
					console.log("Added "+data.title+" by " +data.author+ " to the database");
				});
			} else {
				var ins = "INSERT INTO Book(author,numPages,mediaID,userID) VALUES(?,?,(SELECT DISTINCT M.mediaID FROM Media M,Book B WHERE M.mediaID=B.mediaID AND M.title=? AND B.author=?),NULL)"
				con.query(ins,[data.author,data.pages,data.title,data.author],function(err,res){
					if(err) throw err;
					console.log("Added a copy of "+data.title+" by " +data.author+ " to the database");
				});
			}
		});
	},
	insertFilm : function(data,con){
		console.log(data);
		var check = "SELECT COUNT(*) AS entries FROM Media M, Film F WHERE M.mediaID=F.mediaID AND M.title=? AND F.director=?";
		con.query(check,[data.title,data.director],function(err,res){
			if(err) throw err;
			if(res[0].entries==0){
				var ins = "INSERT INTO Media(title,description,type,sectionName,imageURL) VALUES(?,?,'film',?,NULL)"
				con.query(ins,[data.title,data.desc,data.section],function(err,res){
					if(err) throw err;
				});
				ins = "INSERT INTO Film(director,length,mediaID,userID) VALUES(?,?,(SELECT MAX(mediaID) FROM Media),NULL)"
				con.query(ins,[data.director,data.length],function(err,res){
					if(err) throw err;
					console.log("Added "+data.title+" by " +data.director+ " to the database");
				});
			} else {
				var ins = "INSERT INTO Film(director,length,mediaID,userID) VALUES(?,?,(SELECT DISTINCT M.mediaID FROM Media M,Film F WHERE M.mediaID=F.mediaID AND M.title=? AND F.director=?),NULL)"
				con.query(ins,[data.director,data.length,data.title,data.director],function(err,res){
					if(err) throw err;
					console.log("Added a copy of "+data.title+" by " +data.director+ " to the database");
				});
			}
		});
		
	},
	getMedia : function(data,con,socket){
		if(data.type=="book"){
			var getMedia = "SELECT DISTINCT M.mediaID, M.title, B.author, M.sectionName, M.type, M.imageURL FROM Media M, Book B WHERE M.mediaID=B.mediaID AND M.mediaID=?";
			con.query(getMedia,[data.mediaID],function(err,res){
				socket.emit('media',res);
			});
		}
		else if(data.type=="film"){
			var getMedia = "SELECT DISTINCT M.mediaID, M.title, F.director, M.sectionName, M.type, M.imageURL FROM Media M, Film F WHERE M.mediaID=F.mediaID AND M.mediaID=?";
			con.query(getMedia,[data.mediaID],function(err,res){
				socket.emit('media',res);
			});
		}
	},
	getInfo : function(data,con,socket){
		var output = {}
		var getMediaInfo = "";
		if(data.type=="book"){ getMediaInfo = "SELECT M.mediaID,M.title,M.type,B.author,M.description,M.imageURL FROM Media M, Book B WHERE M.mediaID=B.mediaID AND M.title=? AND B.author=? GROUP BY M.mediaID"; }
		if(data.type=="film"){ getMediaInfo = "SELECT M.mediaID,M.title,M.type,F.director,M.description,M.imageURL FROM Media M, Film F WHERE M.mediaID=F.mediaID AND M.title=? AND F.director=? GROUP BY M.mediaID"; }
		con.query(getMediaInfo,[data.title,data.creator],function(err,res){
			if(err) throw err;
			output['mediaID']=res[0].mediaID;
			output['title']=res[0].title;
			output['creator']=res[0].author;
			if(res[0].author==null){ output['creator']=res[0].director; }
			output['description']=res[0].description;
			output['type']=res[0].type;
			output['imageURL']=res[0].imageURL;
			var getAvailCopies = "";
			if(data.type=='book') getAvailCopies = "SELECT COUNT(*) AS copies FROM Book WHERE mediaID=? AND userID IS NULL";
			if(data.type=='film') getAvailCopies = "SELECT COUNT(*) AS copies FROM Film WHERE mediaID=? AND userID IS NULL";
			con.query(getAvailCopies,[output.mediaID],function(err3,res3){
				if(err) console.log('copies err');
				output['copies']=res3[0].copies;
			});
			var getReviews = "SELECT userID,rating,description From Review WHERE mediaID=?";
			con.query(getReviews,[output.mediaID],function(err2, res2){
				output['reviews']=res2;
				socket.emit('mediaInfo',output);
			});
		});
	},
	getCatalog : function(data,con,socket){
		var getCatalog = "SELECT DISTINCT M.mediaID, M.type FROM Media M";
		con.query(getCatalog,function(err,res){
			socket.emit('catalog',res);
		});
	},
	createUser : function(data,con,socket){
		var checkUser = "SELECT COUNT(*) AS dup FROM User WHERE userID=? GROUP BY userID";
		con.query(checkUser,[data.userID],function(err,res){
			if(res.length==0){
				var ins = "INSERT INTO User(userID,password) VALUES (?,?)"
				con.query(ins,[data.userID,data.password],function(err2,res2){
					if(err) console.log("Unable to create user "+data.userID);
					console.log("Created User "+data.userID);
					socket.handshake.session.userID = data.userID;
					socket.handshake.session.save();
					console.log("Logged in as " + socket.handshake.session.userID);
					socket.emit('loginSuccess');
				});
			} else {
				socket.emit('dupUserID');
			}
		});
	},
	checkLogin : function(data, con, socket){
		var checkLogin = "SELECT DISTINCT userID FROM User WHERE userID=? AND password=?";
		con.query(checkLogin, [data.userID, data.password],function(err, res){
			if(!res.length)
				socket.emit('badPassword');
			else{
				socket.handshake.session.userID = data.userID;
				socket.handshake.session.save();
				console.log("logged in as " + socket.handshake.session.userID);
				socket.emit('loginSuccess');
			}
		});
	},
	getUsers : function(data,con,socket){
		var getCatalog = "SELECT DISTINCT userID FROM User";
		con.query(getCatalog,function(err,res){
			socket.emit('users',res);
		});
	},
	postReview : function(data,con,socket){var date = new Date();
		var yr = date.getFullYear();
		var mo = ('0'+(date.getMonth()+1)).slice(-2);
		var day = ('0' + date.getDate()).slice(-2);
		var today = yr+'-'+mo+'-'+day;
		console.log(today)
		var post = "INSERT INTO Review(mediaID,userID,rating,description,date) VALUES(?,?,?,?,?)";
		con.query(post,[data.mediaID,data.userID,data.rating,data.desc,today],function(err,res){
			if(err){ socket.emit('reviewFailed'); }
			else socket.emit('reviewPosted');
		});
	},
	getCheckedMedia : function(data,con,socket){
		var checkedMedia = [];
		var bookQ = "SELECT M.mediaID, B.bookID, M.title, B.author, M.imageURL, M.type FROM Media M, Book B WHERE M.mediaID=B.mediaID AND B.userID=?";
		var filmQ = "SELECT M.mediaID, F.filmID, M.title, F.director, M.imageURL, M.type FROM Media M, Film F WHERE M.mediaID=F.mediaID AND F.userID=?";
		con.query(bookQ,[data],function(err,res){
			res.forEach(function(book){
				checkedMedia.push(book);
			});
			con.query(filmQ,[data],function(err2,res2){
				res2.forEach(function(film){
					checkedMedia.push(film);
				});
				socket.emit('checkedMedia',checkedMedia);
			});
		});
	},
	returnMedia : function(data,con,socket){
		var checkin = "";
		if(data.type=="book") checkin = "UPDATE Book SET userID=NULL WHERE bookID=?";
		if(data.type=="film") checkin = "UPDATE Film SET userID=NULL WHERE filmID=?";
		con.query(checkin,[data.ID],function(err,res){
			if(err) console.log("return error");
			else socket.emit('refresh');
		});
	},
	getFavoriteMedia : function(data,con,socket){
		var q = "SELECT favoriteBook, favoriteFilm FROM User WHERE userID=?"
		con.query(q,[data],function(err,res){
			if(err) console.log("error getting favorites");
			socket.emit('favMedia',res);
		});
	},
	updateFav : function(data,con,socket){
		var query = "";
		if(data.type=="book") query="UPDATE User SET favoriteBook=? WHERE userID=?";
		if(data.type=="film") query="UPDATE User SET favoriteFilm=? WHERE userID=?";
		con.query(query,[data.value, data.userID],function(err,res){
			if(err) console.log(query,data.value, data.userID);
			socket.emit('updateSuccess',res);
		});
	}

};