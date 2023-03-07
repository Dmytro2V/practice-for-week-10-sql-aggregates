.print ----------- check DBs ----------
SELECT  *
    FROM cats JOIN toys ON (cats.id = toys.cat_id)
;
.print ---- Step 1: COUNT Cats
SELECT  count(*) FROM cats
;
.print--------Step 2: MIN / MAX
.print -   Write a query for the oldest cat, and the year it was born.
SELECT  id, name, max(birth_year) FROM cats;

.print Write a query for the youngest cat, and the year it was born.
SELECT  * FROM cats WHERE birth_year = (SELECT min(birth_year) FROM cats);

.print Can you query for both cats in one simple SELECT?
SELECT  min(birth_year), max(birth_year) FROM cats;
SELECT  * FROM cats WHERE birth_year IN ((SELECT min(birth_year) FROM cats),
                                        (SELECT max(birth_year) FROM cats))
;
.print === BONUS =======Step 1: GROUP BY
.print ----- Write a query to list the number of toys per cat.

SELECT  name, count(toys.id) 
    FROM cats JOIN toys ON (cats.id = toys.cat_id)
    GROUP BY (cat.id)
;
