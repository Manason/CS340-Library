module.exports = {
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
		if(data.type=="book"){ getMediaInfo = "SELECT M.mediaID,M.title,M.type,B.author,M.description,M.imageURL,COUNT(*) AS copies FROM Media M, Book B WHERE M.mediaID=B.mediaID AND M.title=? AND B.author=? GROUP BY M.mediaID"; }
		if(data.type=="film"){ getMediaInfo = "SELECT M.mediaID,M.title,M.type,F.director,M.description,M.imageURL,COUNT(*) AS copies FROM Media M, Film F WHERE M.mediaID=F.mediaID AND M.title=? AND F.director=? GROUP BY M.mediaID"; }
		con.query(getMediaInfo,[data.title,data.creator],function(err,res){
			if(err) throw err;
			output['mediaID']=res[0].mediaID;
			output['title']=res[0].title;
			output['creator']=res[0].author;
			if(res[0].author==null){ output['creator']=res[0].director; }
			output['description']=res[0].description;
			output['copies']=res[0].copies;
			output['type']=res[0].type;
			output['imageURL']=res[0].imageURL;
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
			else
				console.log("logged in");
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
	}
};