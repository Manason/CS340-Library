module.exports = {
	insertBook : function(data,con){
		console.log(data);
		var check = "SELECT COUNT(*) AS entries FROM Media M, Book B WHERE M.mediaID=B.mediaID AND M.title=? AND B.author=?";
		con.query(check,[data.title,data.author],function(err,res){
			console.log(res[0].entries)
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
		console.log(check)
		con.query(check,[data.title,data.director],function(err,res){
			if(err) throw err;
			console.log(res[0].entries)
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
		
	}
};