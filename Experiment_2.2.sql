create table Year_tbl (
	ID INT,
	YEAR INT,
	NPV INT,
)


CREATE TABLE Queries_tbl(
	ID INT,
	YEAR INT,
)

INSERT INTO Year_tbl(ID, YEAR, NPV) 
values
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

INSERT INTO Queries_tbl(ID, YEAR) 
values
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

select q.ID, q.YEAR, ISNULL( y.NPV, 0) AS NPV
from Year_tbl as y
right outer join Queries_tbl as q
on
y.ID = q.ID and q.YEAR = y.YEAR;


