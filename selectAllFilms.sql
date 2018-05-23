SELECT *
From Media M, Film F
WHERE M.mediaID = F.mediaID
GROUP BY M.mediaID;