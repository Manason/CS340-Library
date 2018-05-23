--used on user page to display favorite media
SELECT U.favoriteBook, U.favoriteFilm
FROM User U
WHERE U.userID = "testUser01" --replace with current userID