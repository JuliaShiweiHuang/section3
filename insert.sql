INSERT INTO bookshelfamazon (isbn, title, author, year) VALUES (0380795272, 'Krondor: The Betrayal', 'Raymond E. Feist', 1998);
INSERT INTO bookshelfamazon (isbn, title, author, year) VALUES (1416949658, 'The Dark Is Rising', 'Susan Cooper', 1973);
INSERT INTO bookshelfamazon (isbn, title, author, year) VALUES (1857231082, 'The Black Unicorn', 'Terry Brooks', 1987);

SELECT * FROM bookshelfamazon ORDER BY year ASC




INSERT INTO passengerA (name, flight_id) VALUES ('Alice', 1);
INSERT INTO passengerA (name, flight_id) VALUES ('Bob', 1);
INSERT INTO passengerA (name, flight_id) VALUES ('Charlie', 2);
INSERT INTO passengerA (name, flight_id) VALUES ('Dave', 2);
INSERT INTO passengerA (name, flight_id) VALUES ('Erin', 4);
INSERT INTO passengerA (name, flight_id) VALUES ('Frank', 6);
INSERT INTO passengerA (name, flight_id) VALUES ('Grace', 6);

SELECT * FROM flights WHERE id = 1;

SELECT origin, destination, name FROM flights JOIN passengerA ON passengerA.flight_id = flights.id;
SELECT origin, destination, name FROM flights LEFT JOIN passengerA ON passengerA.flight_id = flights.id;// select things from the left table

SELECT origin, destination, name FROM flights JOIN passengerA ON passengerA.flight_id = flights.id WHERE name = 'Alice';

SELECT flight_id FROM passengerA GROUP BY flight_id HAVING COUNT(*) > 1; // Only secting flight id where flight has more passengers on it;

SQL Injection:
Username: 
Password:

SELECT * FROM users WHERE (username = username) AND (password = password);



isbn,title,author,year
0380795272,Krondor: The Betrayal,Raymond E. Feist,1998
1416949658,The Dark Is Rising,Susan Cooper,1973
1857231082,The Black Unicorn ,Terry Brooks,1987
0553803700,"I, Robot",Isaac Asimov,1950
080213825X,Four Blondes,Candace Bushnell,2000
0375913750,"Love, Stargirl",Jerry Spinelli,2007
074349671X,The Tenth Circle,Jodi Picoult,2006
0743454553,Vanishing Acts,Jodi Picoult,2005
0765317508,Aztec,Gary Jennings,1980

