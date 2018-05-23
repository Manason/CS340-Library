SELECT *
From Media M, Book B
WHERE M.mediaID = B.mediaID
GROUP BY M.mediaID;
SELECT *
From Media M, Film F
WHERE M.mediaID = F.mediaID
GROUP BY M.mediaID;
