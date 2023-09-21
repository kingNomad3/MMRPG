-- joueur
INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut) 
	VALUES ('Benjamin', 'nomad@gmail.com', '123', 'homme cisgenre', TO_DATE('2024-05-04','YYYY-MM-DD'), TO_DATE('2000-04-05','YYYY-MM-DD'), 'invite');
	VALUES ('Jessica', 'Thydouan@gmail.com', '456', 'femme cisgenre', TO_DATE('2024-03-15','YYYY-MM-DD'), TO_DATE('2000-04-05','YYYY-MM-DD'), 'invite');


-- SELECT alias_joueur AS "Alias", courriel AS "Courriel", date_inscription AS "Date dInscription"
-- FROM joueur
-- ORDER BY date_inscription ASC;

SELECT * 
	FROM joueur


			
--avatar		
INSERT INTO avatar(nom, joueur, date_creation, quantite_mox) 
	VALUES('kingNomad',(SELECT id
					   	FROM joueur
					   WHERE alias_joueur = 'Benjamin'),TO_DATE('2025-05-04','YYYY-MM-DD'), 1500);

--jeu
INSERT INTO jeu(nom, sigle, description) 
			VALUES ('PUMPUM', 'D46401', 'Good pum pum nid shelta');

 
	
-- habilete			 
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description) VALUES ( 1, 'Fire','P12', 50, 1, 2, 1,'Tirer du gun');
	VALUES((SELECT id 
		   FROM jeu
		   WHERE nom = 'PUMPUM'),'earthquake','Destroya',500,0.5,1.12,1.42,'detruit tous ce qui se trouve a proximite');   
	VALUES((SELECT id 
		   FROM jeu
		   WHERE nom = 'PUMPUM'),'Wada','WADAPULSE',20,0.2,0.12,0.42,'Envoie un jet deau, ideal pour la douche');
	VALUES((SELECT id 
		   FROM jeu
		   WHERE nom = 'PUMPUM'),'Loco','Crazy ray',100,2.4,1.2,6.42,'Rend lenemie fou et attacque ces amis');

-- items
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
		 VALUES((SELECT id
				FROM jeu
				WHERE nom = 'PUMPUM'), 'little 9', 'LG40', 'Glock', 0.5, 5000);
		VALUES((SELECT id
			  	FROM jeu
			  	WHERE nom = 'PUMPUM'), 'chapeau de paille', 'LCP1', ' Appel les tambours de liberation', 1, 999999);
		VALUES((SELECT id
			   FROM jeu
			   	WHERE nom = 'PUMPUM'), 'one piece', 'L1P1', 'Le tresor cache',9.999,1000000);
		VALUES((SELECT id
			   FROM jeu
			   	WHERE nom = 'PUMPUM'), 'baton de rudes', 'LJBL', 'Le baton d un homme de 30 ans',2.1,400);
		VALUES((SELECT id
			   FROM jeu
			   	WHERE nom = 'PUMPUM'), 'Lunette de sylfie', 'LDS1', 'Augmente la furtivite du joeur',9.999,40000);

			 
			 
-- ACTIVITE
INSERT INTO activite(joueur, date_debut, duree) 
	VALUES((SELECT id
				FROM joueur
					  WHERE alias_joueur = 'Benjamin'),
		  			TO_TIMESTAMP('2024-05-05 10:30:44', 'YYYY-MM-DD HH:MI:SS'),10800 )


-- capsule de temps
INSERT INTO capsule_activite(activite,avatar,jeu,duree)
	VALUES((SELECT id
		   		FROM activite
		   				WHERE date_debut= TO_TIMESTAMP('2024-05-05 10:30:44', 'YYYY-MM-DD HH:MI:SS')
		   					AND joueur = (SELECT id
		   									FROM joueur
		   										WHERE alias_joueur = 'Benjamin')),(SELECT id
																				  		FROM avatar
																				  				WHERE nom = 'kingNomad'),(SELECT id 
																														   FROM jeu
																														   		WHERE nom = 'PUMPUM'),800);
INSERT INTO capsule_activite(activite,avatar,jeu,duree)
	VALUES((SELECT id
		   		FROM activite
		   				WHERE date_debut= TO_TIMESTAMP('2024-05-05 10:30:44', 'YYYY-MM-DD HH:MI:SS')
		   					AND joueur = (SELECT id
		   									FROM joueur
		   										WHERE alias_joueur = 'Benjamin')),(SELECT id
																				  		FROM avatar
																				  				WHERE nom = 'kingNomad'),(SELECT id 
																														   FROM jeu
																														   		WHERE nom = 'PUMPUM'),5000);
INSERT INTO capsule_activite(activite,avatar,jeu,duree)
	VALUES((SELECT id
		   		FROM activite
		   				WHERE date_debut= TO_TIMESTAMP('2024-05-05 10:30:44', 'YYYY-MM-DD HH:MI:SS')
		   					AND joueur = (SELECT id
		   									FROM joueur
		   										WHERE alias_joueur = 'Benjamin')),(SELECT id
																				  		FROM avatar
																				  				WHERE nom = 'kingNomad'),(SELECT id 
																														   FROM jeu
																														   		WHERE nom = 'PUMPUM'),5000);







