--INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut) 
	 --VALUES ('julientest', 'julien@allo.com', '123', 'homme cisgenre', current_date, '2000-01-01', 'invite')
	 
	 SELECT * from joueur
	 SELECT * from avatar
	 
	 
	 --joueur
	INSERT INTO joueur (alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut)
	 	VALUES('Aissa', 'aissa@gmail.com', '6142', 'homme cisgenre', TO_DATE('2023-05-07', 'YYYY-MM-DD'), TO_DATE('1996-04-12','YYYY-MM-DD'), 'invite');
		
	--avatar
	INSERT INTO avatar(nom, joueur, date_creation, quantite_mox) 
		VALUES ('soumoune', (SELECT id 
						  FROM joueur WHERE alias_joueur = 'Aissa'), TO_DATE('2023-05-08', 'YYYY-MM-DD'), 5500);
						  
	--jeu				  
	INSERT INTO jeu(nom, sigle, description) VALUES ('Desert', 'D18945', 'Sun, sand , heat');
	
	
	--habilete
	-- Si coef est a default, retirer de la declaration: habilite(declaration) VALUES ..
--INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description) 
	--VALUES ( 1, 'Fire','P12', 50, 1, 2, 1,'Tirer du gun');
		
		INSERT INTO habilete(jeu, nom, sigle, energie_max, description,coef_1, coef_2, coef_3) 
			VALUES ( (SELECT id 
					  FROM jeu WHERE nom = 'Desert'), 'SandStorm','P52', 150,'Tempête de sable', 1.5, 2.5, 3.5);

		INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description) 
			VALUES ( (SELECT id 
					  FROM jeu WHERE nom = 'Desert'), 'Tornado','P02', 100, 1.7, 2.7, 3.7,'Tornade');

		INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description) 
			VALUES ( (SELECT id 
					  FROM jeu WHERE nom = 'Desert'), 'SableMouvant','P27', 200, 0.5, 2.5, 4.5,'Sable mouvant');
					  
		--item
		--INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) VALUES ( 1, 'Fire','L12', 50, 1, 200);
		
		INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			VALUES ( (SELECT id 
					  FROM jeu WHERE nom = 'Desert'), 'Laser','L41', 'Laser qui fait de la lumière.', 0.5, 300);
						  
		INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			VALUES ( (SELECT id 
					  FROM jeu WHERE nom = 'Desert'), 'Foulard','L11', 'Foulard pour se cacher le visage.', 1, 100);
						  
		INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			VALUES ( (SELECT id 
					  FROM jeu WHERE nom = 'Desert'), 'AirJordan','L02', 'Souliers qui ont du style.', 0.7 , 650);
						  
		INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			VALUES ( (SELECT id 
					  FROM jeu WHERE nom = 'Desert'), 'FlappyBird','L21', 'Oiseau qui suit.', 0.1 , 400);
						  
		INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			VALUES ( (SELECT id 
					  FROM jeu WHERE nom = 'Desert'), 'Sword','L29', 'Grosse épée.', 0.3 , 300);
					  
		--capsule
		
		-- INSERT INTO capsule_activite(activite,avatar,jeu, duree) VALUES ( 1,42,5,8);
		
		INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
			VALUES ( 1,42,5,8);
		
		INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
			VALUES ( 1,42,5,8);
		
		INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
			VALUES ( 1,42,5,8);
			
		--activite
		
		-- INSERT INTO activite(joueur, duree) VALUES ( 1,42);
		
		
		INSERT INTO activite(joueur,date_debut, duree)
			VALUES ( (SELECT id 
						  FROM joueur WHERE alias_joueur = 'Aissa'),TO_TIMESTAMP('2023-05-09 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 900);

		INSERT INTO activite(joueur,date_debut, duree) 
			VALUES ( (SELECT id 
						  FROM joueur WHERE alias_joueur = 'Aissa'),TO_TIMESTAMP('2023-05-09 10:25:00', 'YYYY-MM-DD HH:MI:SS'),900);

		INSERT INTO activite(joueur,date_debut, duree) 
			VALUES ( (SELECT id 
						  FROM joueur WHERE alias_joueur = 'Aissa'),TO_TIMESTAMP('2023-05-09 11:00:00', 'YYYY-MM-DD HH:MI:SS'),1200);
						  
				
				
		--capsule
		-- INSERT INTO capsule_activite(activite,avatar,jeu, duree) VALUES ( 1,42,5,8);
		INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
			VALUES ( (SELECT id 
					 FROM activite
					 WHERE date_debut = TO_TIMESTAMP('2023-05-09 11:00:00', 'YYYY-MM-DD HH:MI:SS')
					 AND joueur = (SELECT id FROM joueur
								  WHERE alias_joueur = 'Aissa')), (SELECT id FROM avatar
														 WHERE nom = 'soumoune'),(SELECT id FROM jeu
																				 WHERE nom = 'Desert'),1200);
																				 
																				 
	INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
			VALUES ( (SELECT id 
					 FROM activite
					 WHERE date_debut = TO_TIMESTAMP('2023-05-09 10:00:00', 'YYYY-MM-DD HH:MI:SS')
					 AND joueur = (SELECT id FROM joueur
								  WHERE alias_joueur = 'Aissa')), (SELECT id FROM avatar
														 WHERE nom = 'soumoune'),(SELECT id FROM jeu
																				 WHERE nom = 'Desert'),900);
																				 
		INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
			VALUES ( (SELECT id 
					 FROM activite
					 WHERE date_debut =TO_TIMESTAMP('2023-05-09 10:25:00', 'YYYY-MM-DD HH:MI:SS')
					 AND joueur = (SELECT id FROM joueur
								  WHERE alias_joueur = 'Aissa')), (SELECT id FROM avatar
														 WHERE nom = 'soumoune'),(SELECT id FROM jeu
																				 WHERE nom = 'Desert'),900);
																				 
		
																				 
																				 
																				 
																				 
																				 
																
			


						  
		
	
	
						  
	
		
		