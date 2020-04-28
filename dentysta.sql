CREATE SCHEMA dentysta;
CREATE TABLE dentysta.pracownicy (Id_pracownika VARCHAR(5) PRIMARY KEY NOT NULL, nazwisko VARCHAR(50), imie VARCHAR(50));
CREATE TABLE dentysta.pacjenci (Id_pacjenta VARCHAR(5) PRIMARY KEY NOT NULL, nazwisko VARCHAR(50), imie VARCHAR(50));
CREATE TABLE dentysta.zabiegi (Id_zabiegu VARCHAR(5) PRIMARY KEY NOT NULL, nazwa_zabiegu VARCHAR(50));
CREATE TABLE dentysta.wizyty (Id_wizyty VARCHAR(5) PRIMARY KEY NOT NULL, Id_zabiegu VARCHAR(5) REFERENCES dentysta.zabiegi(Id_zabiegu), Id_pracownika VARCHAR(5) REFERENCES dentysta.pracownicy(Id_pracownika), Id_pacjenta VARCHAR(5) REFERENCES dentysta.pacjenci(Id_pacjenta), data_wizyty DATE, godzina_wizyty TIME);

INSERT INTO dentysta.pacjenci VALUES('P100', 'Jeleń', 'Anna');
INSERT INTO dentysta.pacjenci VALUES('P105', 'Nicpoń', 'Jarosław');
INSERT INTO dentysta.pacjenci VALUES('P108', 'Nosek', 'Joanna');
INSERT INTO dentysta.pacjenci VALUES('P120', 'Kałuża', 'Jan');
INSERT INTO dentysta.pacjenci VALUES('P130', 'Lis', 'Jerzy');
INSERT INTO dentysta.pacjenci VALUES('P123', 'Nowacka', 'Olga');

INSERT INTO dentysta.pracownicy VALUES('S1011', 'Nowak', 'Maria');
INSERT INTO dentysta.pracownicy VALUES('S1024', 'Kowalski', 'Jan');
INSERT INTO dentysta.pracownicy VALUES('S1045', 'Jabłońska', 'Anna');
INSERT INTO dentysta.pracownicy VALUES('S1034', 'Potocki', 'Marek');

INSERT INTO dentysta.zabiegi VALUES('Z500', 'Borowanie');
INSERT INTO dentysta.zabiegi VALUES('Z496', 'Lakowanie');
INSERT INTO dentysta.zabiegi VALUES('Z503', 'Usuwanie kamienia');

INSERT INTO dentysta.wizyty VALUES('1', 'Z500', 'S1011', 'P100', '12.03.2020', '10:00');
INSERT INTO dentysta.wizyty VALUES('2', 'Z496', 'S1011', 'P105', '12.03.2020', '13:00');
INSERT INTO dentysta.wizyty VALUES('3', 'Z500', 'S1011', 'P108', '14.03.2020', '10:00');
INSERT INTO dentysta.wizyty VALUES('4', 'Z503', 'S1024', 'P108', '16.03.2020', '17:00');
INSERT INTO dentysta.wizyty VALUES('5', 'Z500', 'S1045', 'P120', '18.03.2020', '09:00');
INSERT INTO dentysta.wizyty VALUES('6', 'Z496', 'S1034', 'P130', '20.03.2020', '08:00');
INSERT INTO dentysta.wizyty VALUES('7', 'Z503', 'S1034', 'P123', '12.03.2020', '15:00');

SELECT * FROM dentysta.pacjenci;



