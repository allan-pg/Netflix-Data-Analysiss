use netflix;

-- view all record from our database
SELECT * FROM netflix_store;

-- Check how many rows there are in our dataset
-- 264 rows and 10 columns
SELECT count(show_id)
FROM netflix_store;

-- select number of movies from united states

SELECT count(show_id) as no_of_movies
FROM netflix_store
WHERE country = "United States";

-- select records with directors named mike in their first name
select * from netflix_store
WHERE director LIKE "Mike%";

-- select records from india, brazil and France
SELECT *
FROM netflix_store
WHERE country in ("Brazil", "France", "India");

-- select record released in the yr 2020 or 2021
SELECT *
from netflix_store
WHERE release_year = 2020 or 2021;

-- select movies released in 2019 
SELECT *
FROM netflix_store
WHERE show_type = "movie" and 
		release_year = 2019;
        
-- retrieve all record added in 2019 from jan to dec
-- only 2  movies were added
SELECT * 
FROM netflix_store
WHERE date_added BETWEEN "2019-01-01" AND "2019-12-31";

-- all countries in our data set
SELECT DISTINCT(country) as countries
from netflix_store;

-- retrieve directors whose names has six characters followed letter `G`
-- use wildcards
SELECT * 
FROM netflix_store
WHERE director like "______G%";

-- extract all record with directors having a name cotaining `gen`
SELECT *
FROM netflix_store
WHERE director LIKE "%gen%";

-- extract all records not where director name dont contain "ike" 
SELECT *
FROM netflix_store
WHERE director not LIKE "%ike%";

-- extract movies startin WITH `the` keyword
SELECT *
FROM netflix_store
WHERE show_type = "Movie" 
AND title LIKE "The%";

-- retrieve records WITH release year below 2000
SELECT*
FROM netflix_store
WHERE release_year < 2000;

-- extract records not released in 2010
SELECT *
FROM netflix_store
WHERE release_year <> 2010;

-- extract all records WITH director `not given`
select *
FROM netflix_store
WHERE director = "not given";

-- identify countries whre director is not given
select count(country)
FROM netflix_store
WHERE director = "not given";
-- all countries are 124

select DISTINCT(country),
		count(country) as no_of_movies
FROM netflix_store
WHERE director = "not given"
GROUP BY country;

-- pakistan tops the list with most movies not havin director
--  find the number of movies and tv shows 
SELECT show_type,
		count(show_id) as total_number
		
FROM netflix_store
GROUP BY show_type;

-- obtain a list of all movies released per year
SELECT release_year,
		count(show_id) as no_of_shows
FROM netflix_store
GROUP BY release_year
ORDER BY count(show_id) desc , release_year desc;

-- get records added first and that was added last use "date_added"
SELECT max(date_added) as latest_record,
		min(date_added) as earliest_record
from netflix_store;

-- get directors who appear more than once
SELECT director
FROM netflix_store
GROUP BY director
HAVING count(*) > 1;

-- show only first ten records
SELECT *
FROM netflix_store
LIMIT 10;

-- select ten records but skip the first 3 rows
SELECT *
FROM netflix_store
LIMIT 10 OFFSET 3;

-- COMMIT AND ROLLBACK
-- set autocomit to 0
SET sql_safe_updates = 0;
SET autocommit = 0;

-- update row WITH id s10 set show type to TV show
UPDATE netflix_store
set show_type = "TV Show"
WHERE show_id = "s10";

-- we can rollback the update if we notice we didnt update the right row
ROLLBACK;

-- delete row s14 and rollback
DELETE FROM netflix_store
WHERE show_id = "s14";
-- if you roll back the delete will be undone
ROLLBACK;

-- using commit
-- update s10 to a `TV Show` then commit
UPDATE netflix_store
SET show_type = "TV Show"
WHERE show_id = "s10";

-- commit it now
COMMIT;
-- if you try to roll it back now it is impossible
-- s10 still remains a tv show as updated
ROLLBACK;

-- change back to autocomit
SET autocommit = 1;

-------------------------- IFNULL ------------------------
-- it takes two arguments 
-- such that if expr1 = expr2 then it sets the value to null
-- But if expr1 <> expr2 then it returns expr1
SELECT * from netflix_store;


SELECT show_id,
		ifnull(director, "Not Given") as director
FROM netflix_store
ORDER BY release_year desc;
-- the above statements if director = not given it sets to null if not it remains as director` 

----------------------------- COALESCE ---------------------------------------------------------
-- coalesce takes more arguments but works like if null
SELECT show_id,
		coalesce(director, "Not Given") as director
FROM netflix_store
ORDER BY release_year desc;

ALTER TABLE netflix_store
RENAME COLUMN title to Title;

DESCRIBE netflix_store;

-- change column datatype
alter TABLE netflix_store
MODIFY show_id VARCHAR(5);

------------------- SQL JOINS ---------------------------------






                      
		

