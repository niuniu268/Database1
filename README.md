# Ett streaming-företag har tänkt sig att lägga information om sin filmuthyrning i en databas och har till att börja med tänkt sig följande sex relationer: 
				
- GENRE = {genrenr, genrenamn}
Candidate key: {genrenr}
Primary key: {genrenr}

- FILM = {filmnr, titel, pris, genrenr}
Candidate key: {filmnr}
Primary key: {filmnr}
Foreign key: {genrenr} (from GENRE)

- CUSTOMERS = {kundnr, namn, adress, telefonnr}
Candidate key: {kundnr}
Primary key: {kundnr}

- RENTED_MOVIES = {filmnr, kundnr, datum, tid}
Candidate key: {filmnr, kundnr, datum, tid}
Primary key: {filmnr, kundnr}
Foreign keys: {filmnr} (from FILM), {kundnr} (from CUSTOMERS)

- ACTORS = {actornr, namn}
Candidate key: {actornr},{namn}
Primary key: {actornr}

- ACTORS_MOVIES = {actornr, filmnr}
Candidate key: {actornr, filmnr}
Primary key: {actornr, filmnr}
Foreign keys: {actornr} (from ACTORS), {filmnr} (from FILM)	

# Specificera följande frågor mot databasen i figuren ovan med hjälp av relationsalgebra:

1. 

```
SELECT CourseName, CourseNumber
FROM COURSE
WHERE CreditHours > 3;
```

2. 

```
SELECT CourseNumber
FROM SECTION
WHERE Semester = 'Fall' AND Year = 98;
```

3. 

```
SELECT s.Name, g.Grade
FROM STUDENT s
JOIN GRADE_REPORT gr ON s.StudentNumber = gr.StudentNumber
JOIN SECTION sec ON gr.SectionIdentifier = sec.SectionIdentifier
JOIN COURSE c ON sec.CourseNumber = c.CourseNumber
WHERE c.CourseName = 'Data Structures';
```

4.

```
SELECT s.Name AS StudentName, sec.CourseNumber
FROM STUDENT s
JOIN GRADE_REPORT gr ON s.StudentNumber = gr.StudentNumber
JOIN SECTION sec ON gr.SectionIdentifier = sec.SectionIdentifier
WHERE (sec.Semester = 'Fall' AND sec.Year = 98) OR (sec.Semester = 'Spring' AND sec.Year = 99);
```

# Implementera databasen Suppliers&Parts och skriv SQL-frågor som svarar på nedanstående frågor på engelska. Bara frågorna 12-21 behöver skickas in i Canvas.

12. How many suppliers in London supply cams?

```
SELECT COUNT(DISTINCT suppliers.SNR) AS NumSuppliers
FROM suppliers
JOIN parts ON suppliers.PNR = parts.PNR
WHERE parts.PNAME = 'Cam' AND parts.CITY = 'London';

```

![image1](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.07.24.png?raw=true)

13. Where do suppliers in London get bolts from?

```
SELECT DISTINCT suppliers.SNR
FROM suppliers
JOIN shipments ON suppliers.SNR = shipments.SNR
JOIN parts ON shipments.PNR = parts.PNR
WHERE parts.PNAME = 'Bolt' AND parts.CITY != 'London';

```
![image2](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.09.39.png?raw=true)

14. What is the total quantity of parts supplied by Jones?

```
SELECT SUM(shipments.QTY) AS TotalQuantity
FROM suppliers
JOIN shipments ON suppliers.SNR = shipments.SNR
WHERE suppliers.SNAME = 'Jones';
```
![image3](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.15.05.png?raw=true)

15. Colors for parts supplied by Smith?

```
SELECT DISTINCT parts.COLOR
FROM suppliers
JOIN shipments ON suppliers.SNR = shipments.SNR
JOIN parts ON shipments.PNR = parts.PNR
WHERE suppliers.SNR = 'Smith';
```
![image4](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.20.34.png?raw=true)

16. What is the quantity of blue parts supplied by each supplier?

```
SELECT suppliers.SNR, SUM(shipments.QTY) AS TotalQuantity
FROM suppliers
JOIN shipments ON suppliers.SNR = shipments.SNR
JOIN parts ON shipments.PNR = parts.PNR
WHERE parts.COLOR = 'Blue'
GROUP BY suppliers.SNR;
```

![image5](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.23.26.png?raw=true)

17. The names of the London suppliers supplying 200 or more parts outside of London?

```
SELECT DISTINCT suppliers.SNR
FROM suppliers
JOIN shipments ON suppliers.SNR = shipments.SNR
JOIN parts ON shipments.PNR = parts.PNR
WHERE parts.CITY != 'London'
GROUP BY suppliers.SNR
HAVING SUM(shipments.QTY) >= 200;
```

![image6](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.30.45.png?raw=true)

18. The quantity of each part supplied locally in each city and listed alphabetically by city?

```
SELECT parts.CITY, parts.PNAME, SUM(shipments.QTY) AS TotalQuantity
FROM shipments
JOIN parts ON shipments.PNR = parts.PNR
GROUP BY parts.CITY, parts.PNAME
ORDER BY parts.CITY ASC, parts.PNAME ASC;
```
![image7](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.31.21.png?raw=true)

19. Of which parts are there more than 500?

```
SELECT PNAME
FROM parts
WHERE PNR IN (
    SELECT PNR
    FROM shipments
    GROUP BY PNR
    HAVING SUM(QTY) > 500
);

```
![image8](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.37.19.png?raw=true)

20. All pairs of supplier numbers such that the two suppliers concerned are not colocated?

```
SELECT DISTINCT A.SNR, B.SNR
FROM suppliers A, suppliers B
JOIN parts PA ON A.PNR = PA.PNR
JOIN parts PB ON B.PNR = PB.PNR
WHERE A.SNR < B.SNR AND PA.CITY != PB.CITY;
```
![image9](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.54.35.png?raw=true)

21. A table giving the average weight of each part supplied, by part name?
```
SELECT PNAME, AVG(WEIGHT) AS AvgWeight
FROM parts
GROUP BY PNAME;
```
![image10](https://github.com/niuniu268/Database1/blob/master/imgs/Screenshot%202024-02-08%20at%2016.54.58.png?raw=true)