SELECT COUNT(*) FROM flights;
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier;
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier ORDER BY Count DESC;
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier ORDER BY Count DESC LIMIT 5;
SELECT carrier, COUNT(*) FROM flights WHERE distance >= 1000 GROUP BY carrier ORDER BY Count DESC LIMIT 5;
/*  
Show top 10 airlines with the best average for on time arrivals
ordered from least to most average delay 
*/
SELECT carrier, AVG(arr_delay) FROM flights GROUP BY carrier ORDER BY AVG(arr_delay) LIMIT 10;