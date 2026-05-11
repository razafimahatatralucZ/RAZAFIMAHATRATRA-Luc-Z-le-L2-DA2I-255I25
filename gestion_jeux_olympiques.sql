-- RAZAFIMAHATRATRA Luc Zèle
-- DA2I L2 2025-2026
-- 255I25

-- jeux olympiques
-- Question 1.b : Rechercher les attributs City, Year, Athlete pour les médailles d'or au 110m haies.
SELECT City, Year, Athlete 
FROM Medals 
WHERE Medal = "Gold" AND Event = "110m hurdles";

-- Question 1.c : Rechercher Athlete et Event pour les médailles d'or de la France en 2000, triés par nom.
SELECT Athlete, Event 
FROM Medals 
WHERE Medal = "Gold" AND Country = "France" AND Year = 2000 
ORDER BY Athlete ASC;

-- Question 1.d : Liste unique des pays ayant eu de l'or en 1984, par ordre alphabétique inverse.
SELECT DISTINCT Country 
FROM Medals 
WHERE Medal = "Gold" AND Year = "1984" 
ORDER BY Country DESC;

-- Question 1.e : Athlètes des pays dont le nom se termine par "nia".
SELECT Athlete, City, Year, Medal, Country 
FROM Medals 
WHERE Country LIKE '%nia';

-- Question 2.a : Athlètes français médaillés d'or en 1984.
SELECT DISTINCT Athlete 
FROM Medals 
WHERE Medal = "Gold" AND Country = 'France' AND Year = 1984;

-- Question 2.b : Femmes ayant participé au Marathon, triées par année.
SELECT DISTINCT Athlete, Gender, Sport, Year 
FROM Medals 
WHERE Gender = 'Women' AND Sport = 'Marathon' 
ORDER BY Year ASC;

-- Question 2.c : Rechercher les athlètes dont le nom contient "Adrian".
SELECT DISTINCT Athlete, Medal, Discipline 
FROM Medals 
WHERE Athlete LIKE '%Luc%';

-- Question 2.d : Détails sur les nages de Michael Phelps en 2004.
SELECT Athlete, Country, Medal, Year 
FROM Medals 
WHERE Discipline = 'Swimming' AND Athlete LIKE '%PHELPS%Michael%' AND Year = 2004;

-- Question 2.e : Nombre de médailles d'or ou d'argent pour l'Australie.
SELECT COUNT(*) AS "Nb medaille Australien" 
FROM Medals 
WHERE (Medal = 'Gold' OR Medal = 'Silver') AND Country = 'Australia';

-- Question 3 : Nombre de médailles d'or par discipline pour la France.
SELECT Discipline, COUNT(*) 
FROM Medals 
WHERE Country = 'France' AND Medal = 'Gold' 
GROUP BY Discipline 
ORDER BY COUNT(*) DESC;

