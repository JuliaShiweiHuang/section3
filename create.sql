CREATE TABLE bookshelfAmazon (
	id SERIAL PRIMARY KEY,
	isbn VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	author VARCHAR NOT NULL,
	year INTEGER NOT NULL
);



Data types: INTEGER, DECIMAL, SERIAL, VARCHAR, TIMESTAMP, BOOLEAN, ENUM
PRIMARY KEY: meaning one and only one;

Constraints: NOT NULL, UNIQUE, PRIMARY KEY, DEFAULT, CHECK


WE DID CREATE
INSERT
AND NOW SELECT

FOR EXAMPLE:
SELECT * FROM flights;
SELECT origin, destination FROM flights;
SELECT * FROM flights WHERE id = 3;
SELECT * FROM flights WHERE origin = 'New York';
SELECT * FROM flights WHERE destination = 'Paris';
SELECT * FROM flights WHERE duration > 500;
SELECT * FROM flights WHERE destinatino = 'Paris' AND duration > 500;
SELECT * FROM flights WHERE destinatino = 'Paris' OR duration > 500;
SELECT AVG(duration) FROM flights; //average duration of flights;
SELECT AVG(duration) FROM flights WHERE origin = 'New York'; //average duration of flights;
COUNT Function:
SELECT COUNT(*) FROM flights;
SELECT COUNT(*) FROM flights WHERE origin = 'New York';
SELECT MIN(duration) FROM flights;
SELECT * FROM flights WHERE duration = 245;
SELECT * FROM flights WHERE origin IN ('New York', 'Lima');
SELECT * FROM flights WHERE origin LIKE '%a%'; //where origin has 'a' alphabet

UPDATE:
UPDATE flights SET duration = 430
WHERE origin = 'New York'
AND destination = 'London';

DELETE:
DELETE FROM flights WHERE destination = 'Tokyo';

SELECT:
SELECT * FROM flights LIMIT 2; //maxium 2 rows;
SELECT * FROM flights ORDER BY duration ASC; //duration assending;
SELECT * FROM flights ORDER BY duration DESC; //duration desending;

SELECT origin, COUNT(*) FROM flights GROUP BY origin; //take all the rows and put them in groups by origin
// count them up how many of them are there;

SELECT origin, COUNT(*) FROM flights GROUP BY origin HAVING COUNT(*) > 1; // only select flights where count is greater than 1
















