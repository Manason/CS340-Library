/* Need to check if mediaID already exists in table.*/
/* IF this returns 0*/
SELECT COUNT(*) FROM Media M, Book B WHERE M.title=newTitle AND B.author=newAuthor
/* THEN */
INSERT INTO Media(title,description,type,sectionName,imageURL) VALUES(newTitle,newDesc,'book',newSection,newImage)
INSERT INTO Book(author,numPages,mediaID,userID) VALUES(newAuthor,newNumPages,(SELECT MAX(mediaID) FROM Media),NULL)

/* Otherwise */
INSERT INTO Book(author,numPages,mediaID,userID) VALUES(newAuthor,newNumPages,(SELECT M.mediaID FROM Media M,Book B WHERE M.title=newTitle AND B.author=newAuthor),NULL)