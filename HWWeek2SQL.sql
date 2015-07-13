/* Question 1 */

SELECT f.year, f.month, f.day, AVG(f.dep_delay), AVG(w.wind_gust)
FROM flights f
JOIN weather w
ON f.year = w.year AND f.month = w.month AND f.day = w.day
GROUP BY f.year, f.month, f.day
ORDER BY AVG(f.dep_delay) DESC LIMIT 20;

/* Question 2 */

SELECT p.year AS "Year plane built", 
COUNT(*) AS "flights",
SUM(CASE f.dep_delay >= 1 WHEN TRUE THEN 1 ELSE 0 END) AS "delays",
(SUM(CASE f.dep_delay >= 1 WHEN TRUE THEN 1 ELSE 0 END)) * 100/ COUNT(*) AS "delay_rate"
FROM flights f
JOIN planes p
ON f.tailnum = p.tailnum
GROUP BY p.year ORDER BY "delays" DESC;

/* Question 3

What carriers are associated with the 5 longest delays for planes 
built in 2010 or later?  */

SELECT p.year AS "Year plane built", f.carrier, f.dep_delay
FROM flights f
JOIN planes p
ON f.tailnum = p.tailnum
WHERE p.year >= 2010 AND f.dep_delay > 1
ORDER BY f.dep_delay DESC LIMIT 5;
