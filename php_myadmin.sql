-- RAZAFIMAHATRATRA Luc Zèle
-- DA2I L2 2025-2026
-- 255I25
-- php_myadmin

-- Exercice 2 : Requêtes
-- 1. Donner le titre des films
SELECT titre
FROM film;

-- 2. Donner le titre des films sortis entre 1990 et 2021 inclus
SELECT titre
FROM film
WHERE annee=1990 OR annee=2021;

-- 3. Donner les années de sortie de films représentées dans la base. Le résultat sera trié par ordre croissant
SELECT *
FROM film
ORDER BY annee;

-- 4. Donner le nom et prénom des artistes nés après 1970 (au sens strict), le résultat sera trié par ordre alphabétique sur le nom, puis sur le prénom
SELECT nom, prenom, annee_nais
FROM artiste
WHERE annee_nais>1970
ORDER BY nom, prenom;

-- 5. Donner les artistes qui ont un ’a’ comme deuxième lettre de leur nom de famille.
SELECT *
FROM artiste
WHERE nom LIKE '_a%';

-- 6. Donner les films dont le titre contient au moins 3 mots (i.e., les titres avec au moins deux espaces)
SELECT *
FROM film
WHERE titre LIKE '___%';

-- 7. Donner le nom des artistes dont l’année de naissance n’est pas connue.
SELECT *
FROM artiste
WHERE annee_nais IS NULL;

-- 8. Donner le nom des artistes qui ont un ’o’ dans leur nom de famille mais pas comme première ou dernière lettre et dont l’année de naissance est connue
SELECT *
FROM artiste
WHERE nom LIKE '__o%' AND annee_nais IS NOT NULL;

-- 9. Pour chaque film, donner son titre et le nom et prénom de son réalisateur. Le résultat sera
-- trié par ordre alphabétique sur le titre de film, puis par ordre alphabétique sur le nom du réalisateur
SELECT film.titre, artiste.nom, artiste.prenom
FROM film
INNER JOIN artiste ON film.id_realisateur=artiste.ida
ORDER BY film.titre, artiste.nom;

-- 10. Donner le titre et l’année de sortie des films réalisés par ’John Woo’. Le résultat s’affichera
-- par année de sortie décroissante
SELECT film.titre, film.annee
FROM film
INNER JOIN artiste ON film.id_realisateur=artiste.ida
WHERE artiste.nom='Woo' AND artiste.prenom='John'
ORDER BY film.annee DESC;

-- 11. Donner le titre des films sortis après le film ’Pulp Fiction’.
SELECT film.titre
FROM film
WHERE film.annee>( SELECT annee
                   FROM film WHERE titre='Pulp Fiction'
 );