INSERT INTO User(userID,password) VALUES(newUsername, newPassoword)

/* Add Favorites */
/* Book */
UPDATE User SET favoriteBook=newFavBook WHERE userID=currentUserID
/* Film */
UPDATE User SET favoriteFilm=newFavFilm WHERE userID=currentUserID