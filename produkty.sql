CREATE SCHEMA produkty;
CREATE TABLE produkty.produkty (Id_produktu VARCHAR(2) PRIMARY KEY NOT NULL, nazwa_produktu VARCHAR(50), cena_netto MONEY, cena_brutto MONEY);
CREATE TABLE produkty.miasto (Kod_pocztowy VARCHAR(10) PRIMARY KEY NOT NULL, miasto VARCHAR(20));
CREATE TABLE produkty.dostawcy (Id_dostawcy VARCHAR(4) PRIMARY KEY NOT NULL, nazwa_dostawcy VARCHAR(50), kod_pocztowy VARCHAR(10) REFERENCES produkty.miasto(Kod_pocztowy), ulica VARCHAR(50), numer VARCHAR(10));
CREATE TABLE produkty.zamowienia (Id_zamowienia INT PRIMARY KEY NOT NULL, Id_produktu VARCHAR(2) REFERENCES produkty.produkty(Id_produktu), Id_dostawcy VARCHAR(4) REFERENCES produkty.dostawcy(Id_dostawcy));

INSERT INTO produkty.produkty VALUES('MN', 'Makaron Nitki', '130', '150');
INSERT INTO produkty.produkty VALUES('KP', 'Keczup pikantny', '200', '220');
INSERT INTO produkty.produkty VALUES('SP', 'Sos pomidorowy', '89', '110');

INSERT INTO produkty.miasto VALUES('31-435','Kraków');
INSERT INTO produkty.miasto VALUES('04-242', 'Lublin');
INSERT INTO produkty.miasto VALUES('31-342','Kraków');
INSERT INTO produkty.miasto VALUES('30-243', 'Tarnów');
INSERT INTO produkty.miasto VALUES('35-434', 'Nowy Targ');

INSERT INTO produkty.dostawcy VALUES('MakP', 'Makarony Polskie', '31-435', 'Turystyczna', '40');
INSERT INTO produkty.dostawcy VALUES('LubM', 'Lubelski Makaron', '04-242', 'Piłsudskiego', '332a');
INSERT INTO produkty.dostawcy VALUES('PolP', 'Polskie przetwory', '31-342', 'Wojska Polskiego', '44a');
INSERT INTO produkty.dostawcy VALUES('PrzP', 'Przetwory pomidorowe', '30-243', 'Rolnicza', '22/4');
INSERT INTO produkty.dostawcy VALUES('MalS', 'Małopolskie smaki', '35-434', 'Mickiewicza', '223/77');

INSERT INTO produkty.zamowienia VALUES('1', 'MN', 'MakP');
INSERT INTO produkty.zamowienia VALUES('2', 'MN', 'LubM');
INSERT INTO produkty.zamowienia VALUES('3', 'KP', 'PolP');
INSERT INTO produkty.zamowienia VALUES('4', 'KP', 'PrzP');
INSERT INTO produkty.zamowienia VALUES('5', 'SP', 'PolP');
INSERT INTO produkty.zamowienia VALUES('6', 'SP', 'MalS');

SELECT * FROM produkty.dostawcy;

