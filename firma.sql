CREATE SCHEMA ksiegowosc;
CREATE TABLE ksiegowosc.pracownicy (Id_pracownika VARCHAR(4) PRIMARY KEY NOT NULL, imie VARCHAR(50), nazwisko VARCHAR(50), adres VARCHAR(50), telefon VARCHAR(12));
CREATE TABLE ksiegowosc.godziny (Id_godziny VARCHAR(4) PRIMARY KEY NOT NULL, data DATE, liczba_godzin INT, Id_pracownika VARCHAR(4) REFERENCES ksiegowosc.pracownicy(Id_pracownika));
CREATE TABLE ksiegowosc.pensja (Id_pensji VARCHAR(4) PRIMARY KEY NOT NULL, stanowisko VARCHAR(50), kwota MONEY);
CREATE TABLE ksiegowosc.premia (Id_premii VARCHAR(4) PRIMARY KEY NOT NULL, rodzaj VARCHAR(50), kwota MONEY);
CREATE TABLE ksiegowosc.wynagrodzenie (Id_wynagrodzenia VARCHAR(4) PRIMARY KEY NOT NULL, data DATE, Id_pracownika VARCHAR(4) REFERENCES ksiegowosc.pracownicy(Id_pracownika), Id_godziny VARCHAR(4) REFERENCES ksiegowosc.godziny(Id_godziny), Id_pensji VARCHAR(4) REFERENCES ksiegowosc.pensja(Id_pensji), Id_premii VARCHAR(4) REFERENCES ksiegowosc.premia(Id_premii));

INSERT INTO ksiegowosc.pracownicy VALUES(1, 'Maria', 'Zawadzińska', 'Lipowa 33', '+48123456789');
INSERT INTO ksiegowosc.pracownicy VALUES(2, 'Jan', 'Zawadziński', 'Lipowa 33', '+48123456788');
INSERT INTO ksiegowosc.pracownicy VALUES(3, 'Joanna', 'Mrożonka', 'Rana 2', '+48123456777');
INSERT INTO ksiegowosc.pracownicy VALUES(4, 'Tomasz', 'Zielonka', 'Nowa 4A', '+48123412344');
INSERT INTO ksiegowosc.pracownicy VALUES(5, 'Marek', 'Czarnecki', 'Leśna 14', '+48987654321');
INSERT INTO ksiegowosc.pracownicy VALUES(6, 'Karolina', 'Biała', 'Leśna 3', '+48345234765');
INSERT INTO ksiegowosc.pracownicy VALUES(7, 'Jakub', 'Krzak', 'Zielona 12', '+48123432444');
INSERT INTO ksiegowosc.pracownicy VALUES(8, 'Stanisław', 'Dąb', 'Sosnowa 13', '+48888765676');
INSERT INTO ksiegowosc.pracownicy VALUES(9, 'Maria', 'Kapusta', 'Królowej Jadwigi 11', '+48965735455');
INSERT INTO ksiegowosc.pracownicy VALUES(10, 'Piotr', 'Molenda', 'Mickiewicza 4', '+48119845732');

COMMENT ON TABLE ksiegowosc.pracownicy
IS 'Tabela zawierająca dane pracowników firmy';

INSERT INTO ksiegowosc.godziny VALUES('G1', '2020-01-17', 160, 1);
INSERT INTO ksiegowosc.godziny VALUES('G2', '2020-01-17', 160, 2);
INSERT INTO ksiegowosc.godziny VALUES('G3', '2020-01-17', 170, 3);
INSERT INTO ksiegowosc.godziny VALUES('G4', '2020-01-17', 163, 4);
INSERT INTO ksiegowosc.godziny VALUES('G5', '2020-01-17', 160, 5);
INSERT INTO ksiegowosc.godziny VALUES('G6', '2020-01-17', 160, 6);
INSERT INTO ksiegowosc.godziny VALUES('G7', '2020-01-17', 160, 7);
INSERT INTO ksiegowosc.godziny VALUES('G8', '2020-01-17', 165, 8);
INSERT INTO ksiegowosc.godziny VALUES('G9', '2020-01-17', 160, 9);
INSERT INTO ksiegowosc.godziny VALUES('G10', '2020-01-17', 160, 10);

COMMENT ON TABLE ksiegowosc.godziny
IS 'Tabela zawierająca ilość przepracowanych godzin dla każdego pracownika, standardowy czas pracy miesięczny wynosi 160h';

INSERT INTO ksiegowosc.pensja VALUES('S1', 'Dyrektor departamentu administracji', 5000.00);
INSERT INTO ksiegowosc.pensja VALUES('S2', 'Wiceprezes', 7000.00);
INSERT INTO ksiegowosc.pensja VALUES('S3', 'Dyrektor ds. Rachunkowości', 5000.00);
INSERT INTO ksiegowosc.pensja VALUES('S4', 'Ankieter', 1500.00);
INSERT INTO ksiegowosc.pensja VALUES('S5', 'Dziennikarz', 2700.00);
INSERT INTO ksiegowosc.pensja VALUES('S6', 'Kierownik biura reklamy', 4000.00);
INSERT INTO ksiegowosc.pensja VALUES('S7', 'Młodszy specjalista ds. marketingu', 3500.00);
INSERT INTO ksiegowosc.pensja VALUES('S8', 'Dziennikarz', 2900.00);
INSERT INTO ksiegowosc.pensja VALUES('S9', 'Młodszy kierownik ds. marki ', 3200.00);
INSERT INTO ksiegowosc.pensja VALUES('S10', 'Ankieter', 1400.00);

COMMENT ON TABLE ksiegowosc.pensja
IS 'Tabela zawierająca poszczególne stanowiska wraz z ich płacami';

INSERT INTO ksiegowosc.premia VALUES('Pu1', 'Premia uznaniowa', 500.00);
INSERT INTO ksiegowosc.premia VALUES('Pdr2', 'Dodatkowe wynagrodzenie roczne', 2500.00);
INSERT INTO ksiegowosc.premia VALUES('Pm3', 'Premia motywacyjna', 500.00);
INSERT INTO ksiegowosc.premia VALUES('Pr4', 'Premia regulaminowa', 300.00);
INSERT INTO ksiegowosc.premia VALUES('Pr5', 'Premia regulaminowa', 200.00);
INSERT INTO ksiegowosc.premia VALUES('Pz6', 'Premia zespołowa', 600.00);
INSERT INTO ksiegowosc.premia VALUES('Pdr7', 'Dodatkowe wynagrodzenie roczne', 1500.00);
INSERT INTO ksiegowosc.premia VALUES('Pk8', 'Premia kwartalna', 650.00);
INSERT INTO ksiegowosc.premia VALUES('Pr9', 'Premia regulaminowa', 400.00);
INSERT INTO ksiegowosc.premia VALUES('Pb10', 'Brak', 0.00);

COMMENT ON TABLE ksiegowosc.premia
IS 'Tabela zawierająca rodzaje premii wraz z ich kwotami';

INSERT INTO ksiegowosc.wynagrodzenie VALUES('W1', '2020-01-30', 1, 'G1', 'S8', 'Pb10');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W2', '2020-01-30', 2, 'G3', 'S10', 'Pk8');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W3', '2020-01-30', 3, 'G8', 'S5', 'Pb10');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W4', '2020-01-30', 4, 'G2', 'S9', 'Pz6');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W5', '2020-01-30', 5, 'G10', 'S7', 'Pu1');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W6', '2020-01-30', 6, 'G4', 'S4', 'Pr4');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W7', '2020-01-30', 7, 'G7', 'S6', 'Pdr2');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W8', '2020-01-30', 8, 'G5', 'S1', 'Pu1');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W9', '2020-01-30', 9, 'G9', 'S2', 'Pm3');
INSERT INTO ksiegowosc.wynagrodzenie VALUES('W10', '2020-01-30', 10, 'G6', 'S3', 'Pr9');

COMMENT ON TABLE ksiegowosc.wynagrodzenie
IS 'Tabela zawierająca zestawienie wynagrodzeń dla pracowników';

--a)
SELECT id_pracownika, nazwisko 
FROM ksiegowosc.pracownicy;
--b)
SELECT id_pracownika, kwota 
FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
AND ksiegowosc.pensja.kwota > '1000';
--c)
SELECT id_pracownika 
FROM ksiegowosc.wynagrodzenie, ksiegowosc.pensja, ksiegowosc.premia 
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
AND ksiegowosc.pensja.kwota > '2000' 
AND ksiegowosc.premia.kwota = '0';
--d)
SELECT * FROM ksiegowosc.pracownicy 
WHERE imie LIKE 'J%';
--e)
SELECT * FROM ksiegowosc.pracownicy 
WHERE imie LIKE '%a' 
AND nazwisko LIKE '%n%';
--f)
SELECT imie, nazwisko, liczba_godzin-160 AS nadgodziny 
FROM ksiegowosc.pracownicy, ksiegowosc.godziny 
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika 
AND ksiegowosc.godziny.liczba_godzin >160;
--g)
SELECT imie, nazwisko 
FROM ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.wynagrodzenie 
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
AND ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
AND ksiegowosc.pensja.kwota >= '1500' 
AND ksiegowosc.pensja.kwota <= '3000';
--h)
SELECT imie, nazwisko 
FROM ksiegowosc.pracownicy, ksiegowosc.godziny, ksiegowosc.premia, ksiegowosc.wynagrodzenie 
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika 
AND ksiegowosc.godziny.id_godziny = ksiegowosc.wynagrodzenie.id_godziny 
AND ksiegowosc.godziny.liczba_godzin > 160 
AND ksiegowosc.premia.id_premii = 'Pb10';
--i)
SELECT imie, nazwisko, kwota AS pensja 
FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
AND ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
ORDER BY ksiegowosc.pensja.kwota;
--j)
SELECT imie, nazwisko, pensja.kwota AS pensja, premia.kwota AS PREMIA 
FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja, ksiegowosc.premia 
WHERE ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
AND ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
ORDER BY ksiegowosc.pensja.kwota DESC, ksiegowosc.premia.kwota DESC;
--k)
SELECT COUNT (stanowisko) AS stanowisko_ilosc, stanowisko 
FROM ksiegowosc.pensja, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
GROUP BY ksiegowosc.pensja.stanowisko;
--l)
SELECT AVG(kwota::money::numeric::float8) AS srednia_placa, MIN(kwota::numeric), MAX(kwota::numeric) 
FROM ksiegowosc.pensja 
WHERE ksiegowosc.pensja.stanowisko = 'Ankieter';
--m)
SELECT SUM(pensja.kwota::numeric)+SUM(premia.kwota::numeric) AS suma_wynagrodzen 
FROM ksiegowosc.pensja, ksiegowosc.premia, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii;
--n)
SELECT stanowisko, SUM(pensja.kwota::numeric)+SUM(premia.kwota::numeric) AS wynagrodzenie 
FROM ksiegowosc.pensja, ksiegowosc.premia, ksiegowosc.wynagrodzenie
WHERE ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
GROUP BY ksiegowosc.pensja.stanowisko;
--o)
SELECT COUNT(rodzaj) AS liczba_premii, stanowisko
FROM ksiegowosc.premia, ksiegowosc.wynagrodzenie, ksiegowosc.pensja
WHERE premia.id_premii = wynagrodzenie.id_premii
AND pensja.id_pensji = wynagrodzenie.id_pensji
GROUP BY ksiegowosc.pensja.stanowisko;
--p)
DELETE FROM ksiegowosc.pracownicy 
USING ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
AND ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
AND ksiegowosc.pensja.kwota < '1200';
