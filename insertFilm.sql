/* Need to check if mediaID already exists in table.*/
/* IF this returns 0*/
SELECT COUNT(*) FROM Media M, Film B WHERE M.title=newTitle AND B.director=newDirector
/* THEN */
INSERT INTO Media(title,description,type,sectionName,imageURL) VALUES(newTitle,newDesc,'Film',newSection,newImage)
INSERT INTO Film(director,duration,mediaID,userID) VALUES(newDirector,newDuration,(SELECT MAX(mediaID) FROM Media),NULL)

/* Otherwise */
INSERT INTO Film(director,duration,mediaID,userID) VALUES(newDirector,newDuration,(SELECT M.mediaID FROM Media M,Film B WHERE M.title=newTitle AND B.director=newDirector),NULL)