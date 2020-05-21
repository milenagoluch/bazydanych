--a)
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE VARCHAR(20);
UPDATE ksiegowosc.pracownicy SET telefon = '(+48)' || telefon;
--b)
UPDATE ksiegowosc.pracownicy 
SET	telefon = SUBSTRING(ksiegowosc.pracownicy.telefon, 1, 8)||'-'||SUBSTRING(ksiegowosc.pracownicy.telefon, 9, 3)||'-'||SUBSTRING(ksiegowosc.pracownicy.telefon, 12, 3);
select*from ksiegowosc.pracownicy;
--c)
SELECT UPPER(nazwisko) AS nazwisko FROM ksiegowosc.pracownicy
WHERE LENGTH(ksiegowosc.pracownicy.nazwisko) = (SELECT MAX(LENGTH(ksiegowosc.pracownicy.nazwisko)) FROM ksiegowosc.pracownicy)
--d)
SELECT ksiegowosc.pracownicy.*, MD5('kwota') AS pensja 
FROM ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja 
WHERE ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
AND ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji;
--f)
SELECT imie, nazwisko, pensja.kwota AS pensja, premia.kwota AS PREMIA FROM ksiegowosc.wynagrodzenie 
LEFT JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
LEFT JOIN ksiegowosc.premia ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
LEFT JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika;
--g)
SELECT CONCAT('Pracownik ', ksiegowosc.pracownicy.imie,' ', ksiegowosc.pracownicy.nazwisko,', w dniu ',
ksiegowosc.wynagrodzenie.data,' otrzymał pensję całkowitą na kwotę ', (ksiegowosc.pensja.kwota + ksiegowosc.premia.kwota),
', gdzie wynagrodzenie zasadnicze wynosiło: ', ksiegowosc.pensja.kwota,
', premia: ', ksiegowosc.premia.kwota,', nadgodziny: ', (ksiegowosc.godziny.liczba_godzin-160)) 
AS Raport
FROM ksiegowosc.wynagrodzenie, ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.premia, ksiegowosc.godziny
WHERE ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
AND ksiegowosc.godziny.id_pracownika = ksiegowosc.pracownicy.id_pracownika
AND ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
AND ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji;

