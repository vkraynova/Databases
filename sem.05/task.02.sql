USE SHIPS

--1. Напишете заявка, която извежда броя на класовете бойни кораби.
SELECT COUNT(TYPE)
FROM CLASSES
GROUP BY TYPE
HAVING TYPE = 'bb'

--2. Напишете заявка, която извежда средния брой оръдия за всеки клас боен кораб.
SELECT CLASS, AVG(NUMGUNS) AS AvgGuns
FROM CLASSES
GROUP BY CLASS, TYPE
HAVING TYPE ='bb'

--3. Напишете заявка, която извежда средния брой оръдия за всички бойни кораби.
SELECT AVG(NUMGUNS) AS AvgGuns
FROM CLASSES
GROUP BY TYPE
HAVING TYPE = 'bb'

--4. Напишете заявка, която извежда за всеки клас първата и последната година, в
--която кораб от съответния клас е пуснат на вода.
SELECT CLASSES.CLASS, MIN(LAUNCHED) AS FirstYear, MAX(LAUNCHED) AS LastYear
FROM CLASSES JOIN SHIPS
                  ON CLASSES.CLASS = SHIPS.CLASS
GROUP BY CLASSES.CLASS

--5. Напишете заявка, която извежда броя на корабите, потънали в битка според
--класа.
SELECT CLASSES.CLASS, COUNT(NAME)
FROM CLASSES JOIN SHIPS
                  ON CLASSES.CLASS = SHIPS.CLASS
             JOIN OUTCOMES ON
        OUTCOMES.SHIP = SHIPS.NAME
WHERE RESULT = 'sunk'
GROUP BY CLASSES.CLASS

--6. Напишете заявка, която извежда броя на корабите, потънали в битка според
--класа, за тези класове с повече от 2 кораба.
SELECT COUNT( SHIPS.NAME), SHIPS.CLASS
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME=OUTCOMES.SHIP
WHERE OUTCOMES.RESULT='sunk' AND SHIPS.CLASS IN (SELECT SHIPS.CLASS FROM  SHIPS GROUP BY SHIPS.CLASS HAVING COUNT(SHIPS.NAME)>2)
GROUP BY SHIPS.CLASS

--7. Напишете заявка, която извежда средния калибър на оръдията на корабите за
--всяка страна.
SELECT CLASSES.COUNTRY, AVG(CLASSES.BORE)
FROM CLASSES JOIN SHIPS ON SHIPS.CLASS = CLASSES.CLASS
GROUP BY CLASSES.COUNTRY