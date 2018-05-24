-- run like: CALL selectCheckedOutFor('testuser01');
DELIMITER $$
CREATE /*DEFINER=`cs340_camposdl`@`%`*/ PROCEDURE `selectCheckedOutFor`(IN `uid` VARCHAR(32))
    NO SQL
BEGIN
	SELECT DISTINCT M.title 
    FROM Media M, Book B, Film F
    WHERE (F.userID = uid AND M.mediaID = F.mediaID ) OR (M.mediaID = B.mediaID AND B.userID = uid);
END$$
DELIMITER ;