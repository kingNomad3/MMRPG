/*

Requete_script.sql
420-C42-IN Langages d'exploitation des bases de données
Auteurs : Julien Coulombe-Morency, Benjamin Joinvil, Aissa Bouaraguia, François Maltais
Date de création : 2023-09-21
Dernière modification : 2023-09-25

*/

-- Question 1. 

-- Donnez la liste de tous les joueurs, on désire : alias, courriel, date d’inscription. Le tout trié par date d’inscription (croissant).

-- Fonctionnel

SELECT alias_joueur AS "Alias", courriel AS "Courriel", date_inscription AS "Date d''inscription"
FROM joueur
ORDER BY date_inscription ASC;

-- Question 2.

-- Donnez la liste des avatars d’un joueur quelconque (pour l’exemple, prendre le joueur principal),
-- en donnant : nom, la couleur préférée transformée en trois composantes rouge, vert, bleu (dans
-- une seule colonne selon ce format : « (127, 0, 255) »), date de création suivant le format
-- 2000 | 12 | 25, le nombre de moX

-- Fonctionnel

SELECT nom, 
	   '(' || (couleur_1 & x'FF000000'::int >> 24) || ', ' ||  (couleur_1 & x'00FF0000'::int >> 16) || ', ' || (couleur_1 & x'0000FF00'::int >> 8) || ')' AS "Couleur préférée:",
	   (EXTRACT(YEAR FROM date_creation)) || ' | ' || (EXTRACT(MONTH FROM date_creation)) || ' | ' || (EXTRACT(DAY FROM date_creation)) AS "Date d''inscription",
	   quantite_mox AS "Quantité de moX"
  FROM avatar
 WHERE id = (SELECT id
			   FROM joueur
			  WHERE alias_joueur = 'julienpay2win*');

-- Question 3.

-- Pour l’avatar principal, donnez toutes les habiletés qu’il possède en présentant : le sigle et le nom
-- entre crochets dans la même colonne, la date d’obtention, le niveau courant, la valeur en moX
-- du niveau courant et le coût en moX pour acheter le prochain niveau

-- Fonctionnel

SELECT ('[ ' || (SELECT sigle
			      FROM habilete
			     WHERE id = avatar_habilete.habilete) || ', ' || (SELECT nom 
		 														    FROM habilete 
		 														   WHERE id = avatar_habilete.habilete) || ' ]') AS "Habileté:",
		 date_obtention AS "Date d''obtention:", 
		 niveau AS "Niveau:",
		 ((SELECT coef_1 
		     FROM habilete 
		    WHERE id = avatar_habilete.habilete) * niveau) + ((SELECT coef_2 
															     FROM habilete 
															    WHERE id = avatar_habilete.habilete) * niveau) + (SELECT coef_3 
																												    FROM habilete 
																												   WHERE id = avatar_habilete.habilete) AS "Valeur niveau courrant",
		 ((SELECT coef_1 
		     FROM habilete 
		    WHERE id = avatar_habilete.habilete) * (niveau + 1)) + ((SELECT coef_2 
																	   FROM habilete 
																	  WHERE id = avatar_habilete.habilete) * (niveau + 1)) + (SELECT coef_3 
																															    FROM habilete 
																															   WHERE id = avatar_habilete.habilete) AS "Valeur prochain courrant"
  FROM avatar_habilete 
 WHERE avatar = (SELECT id 
				   FROM avatar 
				  WHERE nom = 'kingpayment*');

-- Question 4.

-- Pour l’avatar principal, donnez sa valeur totale : pour les habilités on considère le niveau et pour
-- les items on considère la quantité. 

-- Fonctionnel

SELECT (SELECT SUM((((SELECT coef_1 
					    FROM habilete 
					   WHERE id = avatar_habilete.habilete) * niveau) + ((SELECT coef_2 
																		    FROM habilete 
																		   WHERE id = avatar_habilete.habilete) * niveau) + (SELECT coef_3 
																															   FROM habilete 
																															  WHERE id = avatar_habilete.habilete) )) -- total du cout des habilete
  		  FROM avatar_habilete 
 		 WHERE avatar = (SELECT id 
				           FROM avatar 
				          WHERE nom = 'kingpayment*')) + (SELECT SUM((quantite  * (SELECT valeur_mox 
																			         FROM item 
																			        WHERE id = avatar_item.item))) -- total du couts des items
														    FROM avatar_item 
														   WHERE avatar = (SELECT id 
																		     FROM avatar 
																		    WHERE nom = 'kingpayment*')) AS "Valeur totale (en moX):";
-- Question 5.

-- Pour le joueur principal, donnez le nombre total d’heures passées dans chaque jeu joué

-- Fonctionnel

    SELECT (SELECT nom 
			  FROM jeu 
			 WHERE id = capsule_activite.jeu) AS "Jeu:", 
		   CAST((CAST(SUM(DISTINCT duree) AS DOUBLE PRECISION)/60/60) AS NUMERIC(3,2)) AS "Durée passée (heure):"
      FROM capsule_activite
INNER JOIN avatar
		ON capsule_activite.avatar IN (SELECT id 
						   FROM avatar 
						  WHERE joueur = (SELECT id 
										    FROM joueur 
										   WHERE alias_joueur = 'julienpay2win*'))
  GROUP BY capsule_activite.jeu;
				  

-- Question 6.

-- Donnez la liste de tous les avatars qui possèdent plus de 1 item : nom du joueur, nom de l’avatar et nombre d’items.

-- Fonctionnel

    SELECT (SELECT alias_joueur FROM joueur WHERE id = avatar.joueur) AS "Nom du joueur:", 
		   avatar.nom AS "Nom de l''avatar",
		   SUM(avatar_item.quantite)
  	  FROM avatar
INNER JOIN avatar_item
	    ON avatar_item.quantite > 1 AND avatar_item.avatar = avatar.id
  GROUP BY avatar.joueur, avatar.nom





