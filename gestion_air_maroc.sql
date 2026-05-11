-- RAZAFIMAHATRATRA Luc Zèle
-- DA2I L2 2025-2026
-- 255I25

-- 1.	Donnez la liste des avions dont la capacité est supérieure à 350 passagers.
SELECT *
FROM AVION 
WHERE CAPACITE > 350;

-- 2.	Quels sont les numéros et noms des avions localisés à Marrakech ?
SELECT NUMAV, NOMAV
FROM AVION
WHERE VILLE='Marrakech';

-- 3.	Quels sont les numéros des pilotes en service et les villes de départ de leurs vols ?
SELECT PILOTE.*, VOL.VILLE_DEP
FROM PILOTE
INNER PILOTE
INNER JOIN VOL ON PILOTE.NUMPIL=VOL.NUMPIL
WHERE PILOTE.VILLE=VOL.VILLE_DEP;

-- 4.	Donnez toutes les informations sur les pilotes de la compagnie.
SELECT *
FROM PILOTE;

-- 5.	Quel est le nom des pilotes domiciles à Meknès dont le salaire est supérieur à 20000 DH ?
SELECT NOMPIL
FROM PILOTE
WHERE (VILLE='Meknès') AND (SALAIRE>20000);

-- 6.	Quels sont les avions (numéro et nom) localisés à Marrakech ou dont la capacité est inférieur à 350 passagers ?
SELECT NUMAV, NOMAV
FROM AVION
WHERE (VILLE='Marrakech') OR (CAPACITE<350);

-- 7.	Quels sont les numéros des pilotes qui ne sont pas en service ?
SELECT NUMPIL
FROM PILOTE
WHERE NUMPIL NOT IN (SELECT NUMPIL FROM VOL);

-- 8.	Donnez le numéro des vols effectués au départ de Marrakech par des pilotes de Meknès ?
SELECT NUMVOL
FROM VOL
LEFT JOIN PILOTE ON VOL.NUMPIL=PILOTE.NUMPIL
WHERE (PILOTE.VILLE='Meknès') AND (VOL.VILLE_DEP='Marrakech');

-- 9.	Quels sont les vols effectués par un avion qui n’est pas localisés à Marrakech ?
SELECT NUMVOL, VOL.NUMAV
FROM VOL
LEFT JOIN AVION ON AVION.NUMAV=VOL.NUMAV
WHERE NOT AVION.VILLE='Marrakech';

-- 10.	Quelles sont les villes desservies à partir de la ville d’arrivée d’un vol au départ de Guelmim ?
SELECT VILLE_ARR
FROM VOL
WHERE VILLE_DEP IN (
  SELECT VILLE_ARR
  FROM VOL
  WHERE VILLE_DEP='Guelmiù'
);

-- 11.	Donner les noms des pilotes ainsi que les numéros des vols qu’ils assurent.
SELECT PILOTE.NOMPIL, VOL.NUMVOL
FROM PILOTE
LEFT JOIN VOL ON PILOTE.NUMPIL=VOL.NUMPIL;

-- 12.	Donner les noms des pilotes et les noms des avions qu’ils pilotent.
SELECT PILOTE.NOMPIL, AVION.NOMAV
FROM VOL
INNER JOIN PILOTE ON PILOTE.NUMPIL=VOL.NUMPIL
INNER JOIN AVION ON AVION.NUMAV=VOL.NUMAV;

-- 13.	Donner les vols (numéro, ville départ, ville arrivée) avec le nom du pilote.
SELECT VOL.NUMVOL, VOL.VILLE_DEP, VOL.VILLE_ARR, PILOTE.NOMPIL
FROM PILOTE
RIGHT JOIN VOL ON VOL.NUMPIL=PILOTE.NUMPIL;

-- 14.	Afficher les noms des avions utilisés pour les vols au départ de Casablanca.
SELECT AVION.NOMAV, VOL.VILLE_DEP
FROM AVION
LEFT JOIN ON AVION.NUMAV=VOL.NUMAV
WHERE VOL.VILLE_DEP='Casablanca';

-- 15.	Donner les noms des pilotes qui pilotes qui pilotent des avions de capacité supérieur à 300 passagers.
SELECT PILOTE.NOMPIL, AVION.CAPACITE
FROM VOL
INNER JOIN PILOTE ON VOL.NUMPIL=PILOTE.NUMPIL
INNER JOIN AVION ON VOL.NUMAV=AVION.NUMAV
WHERE AVION.CAPACITE > 300;

-- 16.	Afficher les pilotes et les villes d’arrivée de leurs vols. 
SELECT PILOTE.NUMPIL, PILOTE.NOMPIL, PILOTE.VILLE, VOL.VILLE_ARR
FROM PILOTE
INNER JOIN VOL ON PILOTE.NUMPIL=VOL.NUMPIL;

-- 17.	Donner les vols avec les informations complètes des pilotes et des avions (jointure des 3 tables).
SELECT VOL.NUMVOL, PILOTE.*, AVION.*
FROM VOL
INNER JOIN PILOTE ON VOL.NUMPIL=PILOTE.NUMPIL
INNER JOIN AVION ON VOL.NUMAV=AVION.NUMAV;

-- 18.	Donner les noms des pilotes qui gagnent plus que le salaire moyen.
SELECT NOMPIL
FROM PILOTE
WHERE SALAIRE (SELECT AVG(SALAIRE) FROM PILOTE);

-- 19.	Donner les avions ayant une capacité supérieure à de l’avion numéro 101.
SELECT *
FROM AVION
WHERE CAPACITE > (SELECT CAPACITE FROM AVION WHERE NUMAV=101);

-- 20.	Donner les pilotes qui n’ont jamais effectué de vol.
SELECT NUMPIL
FROM PILOTE
WHERE NUMPIL NOT IN (SELECT NUMPIL FROM VOL);

-- 21.	Donner les villes de départ des vols effectués par des pilotes habitant Marrakech.
SELECT VOL.VILLE_DEP, VOL.NUMVOL, PILOTE.NOMPIL
FROM PILOTE
INNER JOIN VOL ON PILOTE.NUMPIL=VOL.NUMPIL
WHERE PILOTE.VILLE='Marrakech';

-- 22.	Créer une vue contenant les vols avec le nom du pilote et le nom de l’avion.
CREATE VIEW INFORMATIONVOL AS
SELECT V.*, P.NOMPIL, A.NOMAV
FROM VOL V
INNER JOIN PILOTE P ON V.NUMPIL=P.NUMPIL
INNER JOIN AVION A ON V.NUMAV=A.NUMAV;

-- 23.	Créer une vue des pilotes ayant un salaire supérieur à 15000 DH.
CREATE VIEW PILOTE_AISE AS
PILOTE *
FROM PILOTE
WHERE SALAIRE > 15000;

-- 24.	Afficher les données de la vue créée précédemment.
SELECT *
FROM PILOTE_AISE;

-- 25.	Supprimer une vue.
DROP VIEW INFORMATIONVOL;

-- 26.	Créer une vue contenant uniquement les vols au départ de Marrakech.
CREATE VIEW VOL_MARRAKECH AS
SELECT *
FROM VOL
WHERE VILLE_DEP='Marrakech';

-- 27.	Créer un utilisateur nommé user_air.
CREATE USER 'user_air'@'localhost' IDENTIFIED BY 'azerty123';

-- 28.	Donner à cet utilisateur le droit de consulter la table PILOTE.
GRANT SELECT ON BD_AIR_MAROC.PILOTE 
TO 'user_air'@'localhost';

-- 29.	Donner les droits d’insertion sur la table VOL.
GRANT SELECT ON BD_AIR_MAROC.VOL 
TO 'user_air'@'localhost';

-- 30.	Retirer le droit de suppression sur la table AVION.
REVOKE DELETE ON BD_AIR_MAROC.AVION 
FROM 'user_air'@'localhost';

-- 31.	Retirer tous les privilèges sur la base BD_AIR_MAROC.
REVOKE ALL ON BD_AIR_MAROC.* 
FROM 'user_air'@'localhost';

-- 32.	Créer un rôle gestion_vol et lui attribuer des droits sur la table VOL.
CREATE ROLE 'gestion_vol';
GRANT ALL ON BD_AIR_MAROC.VOL TO 'gestion_vol';

-- 33.	Affecter ce rôle à un utilisateur.
GRANT 'gestion_vol'
TO 'user_air'@'localhost';