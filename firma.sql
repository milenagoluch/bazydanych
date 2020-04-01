CREATE SCHEMA firma;
CREATE TABLE firma.pracownicy (Id_pracownika INT PRIMARY KEY NOT NULL, imie VARCHAR(50), nazwisko VARCHAR(50), adres VARCHAR(50), telefon VARCHAR(12));
CREATE TABLE firma.godziny (Id_godziny INT PRIMARY KEY NOT NULL, data DATE, liczba_godzin INT, Id_pracownika INT NOT NULL);
CREATE TABLE firma.pensje (Id_pensji INT PRIMARY KEY NOT NULL, stanowisko VARCHAR(50), kwota MONEY, Id_premii INT NOT NULL);
CREATE TABLE firma.premie (Id_premii INT PRIMARY KEY NOT NULL, rodzaj VARCHAR(50), kwota MONEY);
SELECT * FROM firma.pracownicy
SELECT * FROM firma.premie
ALTER TABLE firma.godziny ADD FOREIGN KEY (Id_pracownika) REFERENCES firma.pracownicy (Id_pracownika);
ALTER TABLE firma.pensje ADD FOREIGN KEY (Id_premii) REFERENCES firma.premie(Id_premii);

INSERT INTO firma.pracownicy VALUES(1, 'Maria', 'Zawadzińska', 'Lipowa 33', '+48123456789');
INSERT INTO firma.pracownicy VALUES(2, 'Jan', 'Zawadziński', 'Lipowa 33', '+48123456788');
INSERT INTO firma.pracownicy VALUES(3, 'Joanna', 'Mrożek-Król', 'Różana 2', '+48123456777');
INSERT INTO firma.pracownicy VALUES(4, 'Tomasz', 'Zielonka', 'Nowa 4A', '+48123412344');
INSERT INTO firma.pracownicy VALUES(5, 'Marek', 'Czarnecki', 'Leśna 14', '+48987654321');
INSERT INTO firma.pracownicy VALUES(6, 'Karolina', 'Biała', 'Leśna 3', '+48345234765');
INSERT INTO firma.pracownicy VALUES(7, 'Jakub', 'Krzak', 'Zielona 12', '+48123432444');
INSERT INTO firma.pracownicy VALUES(8, 'Stanisław', 'Dąb', 'Sosnowa 13', '+48888765676');
INSERT INTO firma.pracownicy VALUES(9, 'Maria', 'Kapusta', 'Królowej Jadwigi 11', '+48965735455');
INSERT INTO firma.pracownicy VALUES(10, 'Piotr', 'Molenda', 'Mickiewicza 4', '+48119845732');

INSERT INTO firma.godziny VALUES(1, '2020-01-17', 30, 1);
INSERT INTO firma.godziny VALUES(2, '2020-01-17', 35, 4);
INSERT INTO firma.godziny VALUES(3, '2020-01-17', 34, 3);
INSERT INTO firma.godziny VALUES(4, '2020-01-17', 30, 7);
INSERT INTO firma.godziny VALUES(5, '2020-01-17', 35, 2);
INSERT INTO firma.godziny VALUES(6, '2020-01-17', 33, 5);
INSERT INTO firma.godziny VALUES(7, '2020-01-17', 35, 6);
INSERT INTO firma.godziny VALUES(8, '2020-01-17', 35, 9);
INSERT INTO firma.godziny VALUES(9, '2020-01-17', 28, 8);
INSERT INTO firma.godziny VALUES(10, '2020-01-17', 30, 10);

INSERT INTO firma.premie VALUES(1, 'Premia uznaniowa', 500.00);
INSERT INTO firma.premie VALUES(2, 'Dodatkowe wynagrodzenie roczne', 2500.00);
INSERT INTO firma.premie VALUES(3, 'Premia motywacyjna', 500.00);
INSERT INTO firma.premie VALUES(4, 'Premia regulaminowa', 300.00);
INSERT INTO firma.premie VALUES(5, 'Premia regulaminowa', 300.00);
INSERT INTO firma.premie VALUES(6, 'Premia zespołowa', 600.00);
INSERT INTO firma.premie VALUES(7, 'Dodatkowe wynagrodzenie roczne', 1500.00);
INSERT INTO firma.premie VALUES(8, 'Premia kwartalna', 650.00);
INSERT INTO firma.premie VALUES(9, 'Premia regulaminowa', 300.00);
INSERT INTO firma.premie VALUES(10, 'Premia uznaniowa', 500.00);

INSERT INTO firma.pensje VALUES(1, 'Dyrektor departamentu administracji', 7000.00,1);
INSERT INTO firma.pensje VALUES(2, 'Wiceprezes', 10000.00,3);
INSERT INTO firma.pensje VALUES(3, 'Dyrektor ds. Rachunkowości', 7000.00,2);
INSERT INTO firma.pensje VALUES(4, 'Ankieter', 3000.00,4);
INSERT INTO firma.pensje VALUES(5, 'Dziennikarz', 4200.00,5);
INSERT INTO firma.pensje VALUES(6, 'Kierownik biura reklamy', 6000.00,6);
INSERT INTO firma.pensje VALUES(7, 'Młodszy specjalista ds. marketingu', 5000.00,8);
INSERT INTO firma.pensje VALUES(8, 'Dziennikarz', 4000.00,7);
INSERT INTO firma.pensje VALUES(9, 'Młodszy kierownik ds. marki ', 4700.00,10);
INSERT INTO firma.pensje VALUES(10, 'Ankieter', 3000.00,9);

