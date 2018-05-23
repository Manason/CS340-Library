SELECT *
From Media M, Book B
WHERE M.mediaID = B.mediaID
GROUP BY M.mediaID; -- remove if we want all copies