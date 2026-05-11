-- RAZAFIMAHATRATRA Luc Zèle
-- DA2I L2 2025-2026
-- 255I25

-- prix nobel
-- Question 3.a : Liste des catégories de prix Nobel.
SELECT DISTINCT Category 
FROM nobel;

-- Question 3.b : Lauréats nés ou ayant une organisation en France.
SELECT DISTINCT LaureateID, FullName, Year 
FROM nobel 
WHERE (BirthCountry = 'France' OR OrganizationCountry = 'France') 
ORDER BY FullName ASC;

-- Question 3.c : Afficher tous les prix Nobel de la catégorie 'Physique' (Physics) ou 'Chimie' (Chemistry).
SELECT OrganizationName, Year
FROM nobel
WHERE OrganizationName='Comité international de la Croix Rouge';

-- Question 3.d
SELECT COUNT(*) AS "Nombre de laureate feminin"
FROM nobel
WHERE sex='Female';

-- Question 3.e
SELECT FullName, Sex, Category, Year
FROM nobel
WHERE Sex='Female' AND BirthCountry='France' AND Year >= 2005;

-- Question 3.f
SELECT DISTINCT FullName, (Year - CAST(BirthDate AS SIGNED)) AS "Age", DeathDate
FROM nobel
WHERE DeathDate IS NULL
ORDER BY Age DESC;

-- Question 3.g
SELECT DISTINCT FullName
FROM nobel
WHERE FullName LIKE '%curie%';

-- Question 4.a
INSERT INTO nobel(Year, Category, LaureateType, FullName, BirthCountry, Sex)
VALUES(2026, 'Chemistry', 'Individual', 'RAZAFIMAHATRATRA Luc Zèle', 'Madagascar', 'Male');

-- Question 4.b
UPDATE nobel
SET Category='NSI'
WHERE FullName LIKE 'RAZAFIMAHATRATRA Luc Zèle';

-- Question 4.c
DELETE
FROM nobel
WHERE FullName LIKE 'ARAZAFIMAHATRATRA Luc Zèle';