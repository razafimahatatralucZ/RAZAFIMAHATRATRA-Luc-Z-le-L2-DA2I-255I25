-- RAZAFIMAHATRATRA Luc Zèle
-- DA2I L2 2025-2026
-- 255I25

-- NBA
-- Question 1
SELECT *
FROM joueurs_nba;

-- Question 3.a
SELECT MAX(Height) AS "Taille Maximal"
FROM joueurs_nba
WHERE Team='Chicago Bulls';

-- Question 3.b
SELECT MAX(Height) AS "Poids le plus faible"
FROM joueurs_nba
WHERE Position='SG';

-- Question 3.c
SELECT *
FROM joueurs_nba
WHERE Name='Victor Wembanyama';

-- Question 3.d
INSERT INTO joueurs_nba
VALUES('RAZAFIMAHATRATRA Luc Zèle', 'Boston Celtics', 99, 'PK', 19, 185, 70);

-- Question 3.e
UPDATE joueurs_nba
SET Team='San Antonio Spurs', Number=75
WHERE Name='Nicolas Batum';

-- Question 3.f
SELECT *
FROM joueurs_nba
WHERE Team='Gotham City';

DELETE FROM joueurs_nba
WHERE Team='Gotham City';