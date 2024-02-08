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

12. 

```
SELECT COUNT(DISTINCT suppliers.SNR) AS NumSuppliers
FROM suppliers
JOIN parts ON suppliers.PNR = parts.PNR
WHERE parts.PNAME = 'Cam' AND parts.CITY = 'London';

```