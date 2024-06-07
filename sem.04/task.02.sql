USE PC

--1. Напишете заявка, която извежда производител, модел и тип на продукт
--за тези производители, за които съответният продукт не се продава
--(няма го в таблиците PC, Laptop или Printer)
SELECT MAKER, MODEL, TYPE
FROM PRODUCT
WHERE PRODUCT.MODEL NOT IN (SELECT LAPTOP.MODEL FROM LAPTOP)
  AND PRODUCT.MODEL NOT IN (SELECT PC.MODEL FROM PC)
  AND PRODUCT.MODEL NOT IN (SELECT PRINTER.MODEL FROM PRINTER);


--2. Намерете всички производители, които правят както лаптопи, така и
--принтери.
SELECT MAKER
FROM PRODUCT JOIN LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL

INTERSECT

SELECT MAKER
FROM PRODUCT JOIN PRINTER ON PRINTER.MODEL = PRODUCT.MODEL;

--3. Намерете размерите на тези твърди дискове, които се появяват в два
--или повече модела лаптопи.
SELECT DISTINCT L1.HD
FROM LAPTOP AS L1 JOIN LAPTOP AS L2 ON L1.HD = L2.HD
WHERE L2.MODEL != L1.MODEL;


--4. Намерете всички модели персонални компютри, които нямат регистриран
--производител.
SELECT *
FROM PC LEFT JOIN PRODUCT ON PC.MODEL = PRODUCT.MODEL
WHERE MAKER IS NULL;
