USE MOVIES

--1. Напишете заявка, която извежда името на продуцента и имената на
--филмите, продуцирани от продуцента на филма ‘Star Wars’.
SELECT NAME, TITLE
FROM MOVIE JOIN MOVIEEXEC ON PRODUCERC# = CERT#
WHERE CERT# = (SELECT PRODUCERC#
               FROM MOVIE
               WHERE TITLE = 'Star Wars');


--2. Напишете заявка, която извежда имената на продуцентите на филмите, в
--които е участвал ‘Harrison Ford’.
SELECT DISTINCT NAME
FROM MOVIEEXEC JOIN MOVIE ON PRODUCERC# = CERT#
                JOIN STARSIN ON TITLE = MOVIETITLE
WHERE TITLE IN (SELECT MOVIETITLE
                FROM STARSIN
                WHERE STARNAME = 'Harrison Ford');

--3. Напишете заявка, която извежда името на студиото и имената на
--актьорите, участвали във филми, произведени от това студио, подредени
--по име на студио.
SELECT DISTINCT STUDIONAME, STARNAME
FROM MOVIE JOIN STARSIN ON TITLE = MOVIETITLE
ORDER BY STUDIONAME;


--4. Напишете заявка, която извежда имената на актьорите, участвали във
--филми на продуценти с най-големи нетни активи.
SELECT STARNAME
FROM MOVIEEXEC JOIN MOVIE ON CERT# = PRODUCERC#
                JOIN STARSIN ON TITLE = MOVIETITLE
WHERE NETWORTH >= ALL (SELECT NETWORTH
                       FROM MOVIEEXEC);


--5. Напишете заявка, която извежда имената на актьорите, които не са
--участвали в нито един филм.
SELECT NAME
FROM STARSIN RIGHT JOIN MOVIESTAR ON NAME = STARNAME
WHERE MOVIETITLE IS NULL;
