-- RAZAFIMAHATRATRA Luc Zèle
-- DA2I L2 2025-2026
-- 255I25
-- gestion cinéma

-- CREATION DE BASE DE DONNEES
CREATE DATABASE cinema;

-- UTILISATION DE LA BASE DE DONNEES
USE cinema;

-- CREATION DES TABLES
CREATE TABLE VILLE(
    CodePostal VARCHAR(5) PRIMARY KEY,
    NomVille VARCHAR(30) NOT NULL
);

CREATE TABLE CINEMA(
    NumCine INT(3) PRIMARY KEY,
    NomCine VARCHAR(30) NOT NULL,
    Adresse VARCHAR(20) NOT NULL,
    CodePostal VARCHAR(5) NOT NULL,
    FOREIGN KEY(CodePostal) REFERENCES VILLE(CodePostal)
);

CREATE TABLE SALLE(
    NumSalle INT(3) PRIMARY KEY,
    Capacite INT(4) NOT NULL,
    NumCine INT(3) NOT NULL,
    FOREIGN KEY(NumCine) REFERENCES CINEMA(NumCine)
);

CREATE TABLE FILM(
    NumExploit INT(3) PRIMARY KEY,
    Titre VARCHAR(25) NOT NULL,
    Duree INT(4) NOT NULL
);

CREATE TABLE PROJECTION(
    NumExploit INT(3) NOT NULL,
    NumSalle INT(3) NOT NULL,
    NumSemaine INT(3) NOT NULL,
    Nbentrees INT(4) NOT NULL,
    FOREIGN KEY(NumExploit) REFERENCES FILM(NumExploit),
    FOREIGN KEY(NumSalle) REFERENCES SALLE(NumSalle)
);

-- INSERTION DES DONNEES DANS LA TABLE VILLE
INSERT INTO VILLE VALUES ('101', 'Antananarivo'),
('102', 'Toamasina'),
('103', 'Fianarantsoa'),
('104', 'Mahajanga'),
('105', 'Toliara'),
('106', 'Antsirabe'),
('107', 'Nosy Be'),
('108', 'Morondava'),
('109', 'Sambava'),
('110', 'Manakara'),
('111', 'Ambanja'),
('112', 'Farafangana'),
('113', 'Ambositra'),
('114', 'Antalaha'),
('115', 'Tsiroanomandidy'),
('116', 'Maintirano'),
('117', 'Moramanga'),
('118', 'Ambatondrazaka'),
('119', 'Amboasary'),
('120', 'Betafo');

-- INSERTION DES DONNEES DANS LA TABLE CINEMA
INSERT INTO CINEMA VALUES (1, 'Cine Tana 1', 'Analakely', '101'),
(2, 'Cine Tana 2', 'Behoririka', '101'),
(3, 'Cine Tamatabe', 'Centre Ville', '102'),
(4, 'Cine Fianara', 'Tanambao', '103'),
(5, 'Cine Mahajanga', 'Mahabibo', '104'),
(6, 'Cine Tulear', 'Sanfil', '105'),
(7, 'Cine Antsirabe', 'Ville haute', '106'),
(8, 'Cine Nosy Be', 'Ambatoloaka', '107'),
(9, 'Cine Morondava', 'Centre', '108'),
(10, 'Cine Sambava', 'Bazary', '109'),
(11, 'Cine Makara', 'Ville Basse', '110'),
(12, 'Cine Ambanja', 'Centre', '111'),
(13, 'Cine Farafangana', 'Tanambao', '112'),
(14, 'Cine Ambositra', 'Centre', '113'),
(15, 'Cine Antalaha', 'Ville haute', '114'),
(16, 'Cine Tsiroa', 'Centre', '115'),
(17, 'Cine Maintirano', 'Centre', '116'),
(18, 'Cine Moramanga', 'Ville haute', '117'),
(19, 'Cine Ambato', 'Centre', '118'),
(20, 'Cine Amboasary', 'Centre', '119');

-- INSERTION DES DONNEES DANS LA TABLE SALLE
INSERT INTO SALLE VALUES (1, 150, 1),
(2, 200, 1),
(3, 120, 2),
(4, 180, 3),
(5, 220, 4),
(6, 160, 5),
(7, 140, 6),
(8, 130, 7),
(9, 250, 8),
(10, 175, 9),
(11, 190, 10),
(12, 210, 11),
(13, 110, 12),
(14, 170, 13),
(15, 230, 14),
(16, 145, 15),
(17, 165, 16),
(18, 165, 17),
(19, 185, 18);

-- INSERTION DES DONNEES DANS LA TABLE FILM
INSERT INTO FILM VALUES (1, 'Avengers', 120),
(2, 'Titanic', 195),
(3, 'Inception', 148),
(4, 'Interstellar', 169),
(5, 'Gladiator', 155),
(6, 'Joker', 122),
(7, 'Avatar', 162),
(8, 'The Matrix', 136),
(9, 'Frozen', 102),
(10, 'Coco', 105),
(11, 'Black panther', 134),
(12, 'The lion king', 118),
(13, 'Fast & Furious', 130),
(14, 'Harry Potter', 152),
(15, 'Spider-Man', 140),
(16, 'Doctor Strange', 115),
(17, 'The Batman', 176),
(18, 'Top Gun', 131),
(19, 'Jurassic Park', 127),
(20, 'Mission impossible', 147);

-- INSERTION DES DONNEES DANS LA TABLE PROJECTION
INSERT INTO PROJECTION VALUES (1, 1, 1, 120),
(2, 2, 1, 150),
(3, 3, 2, 90),
(4, 4, 2, 130),
(5, 5, 3, 200),
(6, 6, 3, 140),
(7, 7, 4, 160),
(8, 8, 5, 110),
(9, 9, 5, 220),
(10, 10, 5, 170),
(11, 11, 6, 180),
(12, 12, 6, 190),
(13, 13, 7, 100),
(14, 14, 7, 150),
(15, 15, 8, 210),
(16, 16, 8, 130),
(17, 17, 9, 140),
(18, 18, 9, 160),
(19, 19, 10, 175),
(20, 20, 10, 185);

-- TP UPDATE
-- 1. Mettre la capacité de la salle 1 à 300.
UPDATE SALLE SET Capacite = 300 WHERE NumSalle = 1;

-- 2. Mettre la capacité de la salle 2 à 250.
UPDATE SALLE SET Capacite = 250 WHERE NumSalle = 2;

-- 3. Mettre la capacité de la salle 3 à 180.
UPDATE SALLE SET Capacite = 180 WHERE NumSalle = 3;
-- 4. Mettre la capacité à 200 pour toutes les salles ayant une capacité de 150.
UPDATE SALLE SET Capacite = 200 WHERE Capacite = 150;

-- 5. Augmenter de 20 places la capacité de la salle 5.
UPDATE SALLE SET Capacite = Capacite + 20 WHERE NumSalle = 5;

-- 6. Diminuer de 10 places la capacité de la salle 6.
UPDATE SALLE SET Capacite = Capacite - 10 WHERE NumSalle = 6;

-- 7. Changer l’adresse du cinéma 3 en "Nouvelle Adresse".
UPDATE CINEMA SET Adresse = 'Nouvelle Adresse' WHERE NumCine = 3;

-- 8. Changer l’adresse du cinéma 4 en "Centre Ville".
UPDATE CINEMA SET Adresse = 'Centre Ville' WHERE NumCine = 4;

-- 9. Mettre le code postal du cinéma 10 à '101'.
UPDATE CINEMA SET CodePostal = '101' WHERE NumCine = 10;

-- 10. Mettre le code postal du cinéma 15 à '102'.
UPDATE CINEMA SET CodePostal = '102' WHERE NumCine = 15;

-- 11. Mettre la durée du film 1 à 130 minutes.
UPDATE FILM SET Duree = 130 WHERE NumExploit = 1;

-- 12. Mettre la durée du film 2 à 210 minutes.
UPDATE FILM SET Duree = 210 WHERE NumExploit = 2;

-- 13. Ajouter 5 minutes au film 3.
UPDATE FILM SET Duree = Duree + 5 WHERE NumExploit = 3;

-- 14. Diminuer de 10 minutes la durée du film 4.
UPDATE FILM SET Duree = Duree - 10 WHERE NumExploit = 4;

-- 15. Mettre toutes les durées des films à 120 minutes.
UPDATE FILM SET Duree = 120;

-- 16. Changer le titre du film 5 en "Gladiator 2".
UPDATE FILM SET Titre = 'Gladiator 2' WHERE NumExploit = 5;

-- 17. Changer le titre du film 6 en "Joker 2".
UPDATE FILM SET Titre = 'Joker 2' WHERE NumExploit = 6;

-- 18. Renommer le film 7 en "Avatar 2".
UPDATE FILM SET Titre = 'Avatar 2' WHERE NumExploit = 7;

-- 19. Mettre le nombre d’entrées à 200 pour la projection du film 1.
UPDATE PROJECTION SET NbEntrees = 200 WHERE NumExploit = 1;

-- 20. Mettre le nombre d’entrées à 150 pour la salle 2.
UPDATE PROJECTION SET NbEntrees = 150 WHERE NumSalle = 2;

-- 21. Ajouter 20 entrées à la projection du film 3.
UPDATE PROJECTION SET NbEntrees = NbEntrees + 20 WHERE NumExploit = 3;

-- 22. Ajouter 30 entrées aux projections de la semaine 2.
UPDATE PROJECTION SET NbEntrees = NbEntrees + 30 WHERE NumSemaine = 2;23. Mettre toutes les projections de la semaine 5 à 180 entrées.

-- 23. Mettre toutes les projections de la semaine 5 à 180 entrées.
UPDATE PROJECTION SET NbEntrees = 180 WHERE NumSemaine = 5;

-- 24. Mettre la semaine de la salle 1 à 12.
UPDATE PROJECTION SET NumSemaine = 12 WHERE NumSalle = 1;

-- 25. Mettre la semaine du film 4 à 8.
UPDATE PROJECTION SET NumSemaine = 8 WHERE NumExploit = 4;

-- 26. Renommer la ville "Betafo" en "Betafo Ville".
UPDATE VILLE SET NomVille = 'Betafo Ville' WHERE NomVille = 'Betafo';

-- 27. Renommer la ville "Nosy Be" en "Nosy Be Centre".
UPDATE VILLE SET NomVille = 'Nosy Be Centre' WHERE NomVille = 'Nosy Be';

-- 28. Renommer la ville "Morondava" en "Morondava Ville".
UPDATE VILLE SET NomVille = 'Morondava Ville' WHERE NomVille = 'Morondava';

-- 29. Mettre toutes les salles ayant une capacité inférieure à 150 à 200 places.
UPDATE SALLE SET Capacite = 200 WHERE Capacite < 150;

-- 30. Ajouter 50 entrées aux projections ayant moins de 120 entrées.
UPDATE PROJECTION SET NbEntrees = NbEntrees + 50 WHERE NbEntrees < 120;

-- TP DELETE
-- 1. Supprimer la projection du film 1.
DELETE 
FROM PROJECTION
WHERE NumExploit=1;

-- 2. Supprimer la projection de la salle 2.
DELETE FROM PROJECTION
WHERE NumSalle=2;

-- 3. Supprimer toutes les projections de la semaine 5.
DELETE FROM PROJECTION
WHERE NumSemaine=5;

-- 4. Supprimer le film numéro 3.
DELETE FROM PROJECTION
WHERE NumExploit=3;
DELETE FROM FILM
WHERE NumExploit=3;

-- 5. Supprimer la salle numéro 4.
DELETE FROM PROJECTION
WHERE NumSalle=4;
DELETE FROM SALLE
WHERE NumSalle=4;

-- 6. Supprimer la ville "Ambatondrazaka".
DELETE FROM cinema
WHERE CodePostal='118';
DELETE FROM ville
WHERE CodePostal='118';

-- 7. Supprimer toutes les projections ayant moins de 150 entrées.
DELETE FROM PROJECTION
WHERE Nbentrees<150;

-- 8. Supprimer toutes les projections et films de la semaine 10.
DELETE FROM PROJECTION
WHERE NumSemaine=10;
DELETE FROM FILM
WHERE NumSemaine=10;
