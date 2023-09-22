--1. Donnez la liste de tous les joueurs, on désire : alias, courriel, date d’inscription. Le tout trié par
--date d’inscription (croissant)

SELECT alias_joueur AS "Alias", courriel AS "Courriel", date_inscription AS "Date d''inscription"
FROM joueur
ORDER BY date_inscription ASC;


/* 2. Donnez la liste des avatars d’un joueur quelconque (pour l’exemple, prendre le joueur principal),
en donnant : nom, la couleur préférée transformée en trois composantes rouge, vert, bleu (dans
une seule colonne selon ce format : « (127, 0, 255) »), date de création suivant le format
2000 | 12 | 25, le nombre de moX.*/

SELECT nom, 
	   '(' || (couleur_1 & x'FF000000'::int >> 24) || ', ' ||  (couleur_1 & x'00FF0000'::int >> 16) || ', ' || (couleur_1 & x'0000FF00'::int >> 8) || ')' AS "Couleur préférée:",
	   (EXTRACT(YEAR FROM date_creation)) || ' | ' || (EXTRACT(MONTH FROM date_creation)) || ' | ' || (EXTRACT(DAY FROM date_creation)) AS "Date d''inscription",
	   quantite_mox AS "Quantité de moX"
  FROM avatar
 WHERE id = (SELECT id
			   FROM joueur
			  WHERE alias_joueur = 'julienpay2win*');


/* 3. Pour l’avatar principal, donnez toutes les habiletés qu’il possède en présentant : le sigle et le nom
entre crochets dans la même colonne, la date d’obtention, le niveau courant, la valeur en moX
du niveau courant et le coût en moX pour acheter le prochain niveau.*/ 

SELECT  h.('[' || sigle || ', ' || nom || ']') AS Avatar FROM habilete AS h




SELECT date_obtention, niveau FROM avatar_habilete WHERE avatar = (SELECT id FROM avatar WHERE nom = 'kingpayment*') -- les habs de kingpayment


--(SELECT date_obtention FROM avatar_habilete WHERE id = ( SELECT id FROM avatar WHERE nom = 'kingpayment*' )) AS  FROM habilete


/*4. Pour l’avatar principal, donnez sa valeur totale : pour les habilités on considère le niveau et pour
les items on considère la quantité.*/ 

SELECT * FROM activite

/*5. Pour le joueur principal, donnez le nombre total d’heures passées dans chaque jeu joué.*/

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
				  

/*6. Donnez la liste de tous les avatars qui possèdent plus de 1 item : nom du joueur, nom de l’avatar
et nombre d’items*/

SELECT nom 
  FROM avatar
 WHERE 
 
 SELECT COUNT(item)) FROM item WHERE   
 
SELECT * FROM avatar



