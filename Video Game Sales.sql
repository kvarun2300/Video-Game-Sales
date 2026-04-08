use video_game_sales;

select count(*) from games;
select * from games;
select * from vgsales;
select count(*) from vgsales;

ALTER TABLE games
RENAME COLUMN MyUnknownColumn TO id;

select count(distinct(name)) from vgsales;
select count(distinct(title)) from games;


select * from vgsales where name like '%hades%';

SELECT title, COUNT(*) AS cnt
FROM games
GROUP BY title
HAVING COUNT(*) > 1;

select * from games where title='FIFA 13';
select * from games where title='Among Us';
select * from games where title='Doom';

SELECT Title, `Release Date`,Team, Rating, `Times Listed`, `Number of Reviews`, Genres, Plays, Playing, Backlogs, Wishlist,
       COUNT(*) AS cnt
FROM games
GROUP BY Title, `Release Date`,Team, Rating, `Times Listed`, `Number of Reviews`, Genres, Plays, Playing, Backlogs, Wishlist
HAVING COUNT(*) > 1;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Title, `Release Date`, Team, Rating, 
               `Times Listed`, `Number of Reviews`, Genres, 
               Plays, Playing, Backlogs, Wishlist
               ORDER BY Title
           ) AS rn
    FROM games
) t
WHERE rn > 1;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Title
               ORDER BY Title
           ) AS rn
    FROM games
) t
WHERE rn > 1;

SELECT *
FROM games g1
JOIN games g2
ON g1.Title = g2.Title
AND g1.`Release Date` = g2.`Release Date`
AND g1.Team = g2.Team
AND g1.Rating = g2.Rating
AND g1.`Times Listed` = g2.`Times Listed`
AND g1.`Number of Reviews` = g2.`Number of Reviews`
AND g1.Genres = g2.Genres
AND g1.Plays = g2.Plays
AND g1.Playing = g2.Playing
AND g1.Backlogs = g2.Backlogs
AND g1.Wishlist = g2.Wishlist;

SELECT *
FROM games g1
JOIN games g2
ON g1.Title = g2.Title;

DELETE FROM games
WHERE id IN (
    SELECT id FROM (
        SELECT id,
               ROW_NUMBER() OVER (
                   PARTITION BY Title, `Release Date`, Team, Rating, 
                   `Times Listed`, `Number of Reviews`, Genres, 
                   Plays, Playing, Backlogs, Wishlist
                   ORDER BY id
               ) AS rn
        FROM games
    ) t
    WHERE rn > 1
);

select max(`release date`) from games;
SELECT date_format(STR_TO_DATE(`release date`, '%b %d, %Y'),'%b')
FROM games;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY `Rank`, `Name`, Platform, `Year`, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales
               ORDER BY `Name`
           ) AS rn
    FROM vgsales
) t
WHERE rn > 1;

select distinct(`Name`) from vgsales order by `name`;
select distinct(Platform) from vgsales;
select distinct(Publisher) from vgsales group by Publisher;
select distinct(Genre) from vgsales;

UPDATE vgsales
SET `Name` = REPLACE(`Name`, '007: ', '')
WHERE `Name` LIKE '007:%';

UPDATE vgsales
SET `Name` = TRIM(SUBSTRING(`Name`, LOCATE('//', `Name`) + 2))
WHERE `Name` LIKE '.hack%';

DELETE FROM vgsales
WHERE `Name` = '[Prototype]';

select `Number of Reviews`
from games order by `Number of Reviews` asc;

SELECT 
REPLACE(REPLACE(REPLACE(Genres, '[', ''), ']', ''), '''', '') AS clean_genres
FROM games;

UPDATE games
SET Genres = REPLACE(REPLACE(REPLACE(Genres, '[', ''), ']', ''), '''', '')
WHERE Genres LIKE '%[%]%';

UPDATE games
SET Team = REPLACE(REPLACE(REPLACE(Team, '[', ''), ']', ''), '''', '')
WHERE Team LIKE '%[%]%';


SELECT 
CAST(
    CASE 
        WHEN Plays LIKE '%K'
        THEN CAST(REPLACE(Plays, 'K', '') AS DECIMAL(10,2)) * 1000
        ELSE CAST(Plays AS DECIMAL(10,2))
    END
AS UNSIGNED) AS plays_clean
FROM games;

UPDATE games
SET Plays = CAST(
    CASE 
        WHEN Plays LIKE '%K'
        THEN CAST(REPLACE(Plays, 'K', '') AS DECIMAL(10,2)) * 1000
        ELSE CAST(Plays AS DECIMAL(10,2))
    END
AS UNSIGNED);

UPDATE games
SET Playing = CAST(
    CASE 
        WHEN Playing LIKE '%K'
        THEN CAST(REPLACE(Playing, 'K', '') AS DECIMAL(10,2)) * 1000
        ELSE CAST(Playing AS DECIMAL(10,2))
    END
AS UNSIGNED);

UPDATE games
SET Backlogs = CAST(
    CASE 
        WHEN Backlogs LIKE '%K'
        THEN CAST(REPLACE(Backlogs, 'K', '') AS DECIMAL(10,2)) * 1000
        ELSE CAST(Backlogs AS DECIMAL(10,2))
    END
AS UNSIGNED);

UPDATE games
SET Wishlist = CAST(
    CASE 
        WHEN Wishlist LIKE '%K'
        THEN CAST(REPLACE(Wishlist, 'K', '') AS DECIMAL(10,2)) * 1000
        ELSE CAST(Wishlist AS DECIMAL(10,2))
    END
AS UNSIGNED);

UPDATE games
SET `Number of Reviews` = CAST(
    CASE 
        WHEN `Number of Reviews` LIKE '%K'
        THEN CAST(REPLACE(`Number of Reviews`, 'K', '') AS DECIMAL(10,2)) * 1000
        ELSE CAST(`Number of Reviews` AS DECIMAL(10,2))
    END
AS UNSIGNED);

UPDATE games
SET `Times Listed` = CAST(
    CASE 
        WHEN `Times Listed` LIKE '%K'
        THEN CAST(REPLACE(`Times Listed`, 'K', '') AS DECIMAL(10,2)) * 1000
        ELSE CAST(`Times Listed` AS DECIMAL(10,2))
    END
AS UNSIGNED);

select * from games where Title like 'Wii Sports';

ALTER TABLE games MODIFY `Times Listed` INT;
ALTER TABLE games MODIFY `Number of Reviews` INT;
ALTER TABLE games MODIFY Plays INT;
ALTER TABLE games MODIFY Playing INT;
ALTER TABLE games MODIFY Backlogs INT;
ALTER TABLE games MODIFY Wishlist INT;

select * from vgsales;
select distinct(Publisher) from vgsales order by Publisher;
select * from vgsales where `Name` like '%Fallout ';

SELECT 
    g.title,
    g.genres,
	v.name,
    v.genre
FROM games g
INNER JOIN vgsales v
ON g.title=v.Name
order by g.title;

with cte as (SELECT 
    g.title,
    g.genres,
	v.name,
    v.genre
FROM games g
LEFT JOIN vgsales v
ON g.title=v.Name
order by g.title)
select count(*) from cte;

SELECT 
    g.Team,
    v.Publisher
FROM games g
INNER JOIN vgsales v
ON g.Team=v.Publisher;

select * from games order by title;
UPDATE games
SET Title = REPLACE(Title, 'PokÃ©mon', 'Pokemon')
WHERE Title LIKE '%PokÃ©mon%';

UPDATE games
SET Title = REPLACE(Title, 'PokÃƒÂ©mon', 'Pokemon')
WHERE Title LIKE '%PokÃƒÂ©mon%';

UPDATE vgsales
SET Name = REPLACE(Name, 'PokÃ©mon', 'Pokemon')
WHERE Name LIKE '%PokÃ©mon%';

UPDATE games
SET Title = REPLACE(Title, 'RagnarÃ¶k', 'Ragnarok')
WHERE Title LIKE '%RagnarÃ¶k%';

SELECT COUNT(*) AS rows_with_nulls
FROM games
WHERE id IS NULL
   OR Title IS NULL
   OR `Release Date` IS NULL
   OR Team IS NULL
   OR Rating IS NULL
   OR Plays IS NULL;
   
SELECT *
FROM games
WHERE Title = '' OR Title IS NULL;

SELECT *
FROM vgsales
WHERE Name = '' OR Name IS NULL;

SELECT *
FROM vgsales where publisher='N/A';

DELETE
FROM vgsales where publisher='N/A';

select * from games where `Release Date` like 'releases on TBD';
DELETE FROM games
WHERE `Release Date` = 'releases on TBD';

ALTER TABLE games
ADD COLUMN year INT;

UPDATE games
SET year = YEAR(STR_TO_DATE(`Release Date`, '%b %d, %Y'));
