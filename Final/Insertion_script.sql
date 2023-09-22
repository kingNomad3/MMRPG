/*

Insertion_script.sql
420-C42-IN Langages d'exploitation des bases de données
Auteurs : Julien Coulombe-Morency, Benjamin Joinvil, Aissa Bouaraguia, François Maltais
Date de création : 2023-09-21
Dernière modification : 2023-09-22

*/

-- CREATION DES JEU:

INSERT INTO jeu(nom, sigle, description) 
	 VALUES ('Green World', 'Z09786', 'Un monde unique et chaleureux');
	 
INSERT INTO jeu(nom, sigle, description) 
     VALUES ('Desert', 'D18945', 'Sun, sand , heat');

INSERT INTO jeu(nom, sigle, description) 
	 VALUES ('PUMPUM', 'D46401', 'Good pum pum nid shelta');
	 
-- CREATION HABILETE :

INSERT INTO habilete(jeu, nom, sigle, energie_max, description,coef_1, coef_2, coef_3) 
	 VALUES ((SELECT id 
			    FROM jeu 
			   WHERE nom = 'Desert'), 'SandStorm','P52', 150,'Tempête de sable', 1.5, 2.5, 3.5);

INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description) 
	 VALUES ((SELECT id 
		        FROM jeu 
		       WHERE nom = 'Desert'), 'Tornado','P59', 100, 1.7, 2.7, 3.7,'Tornade');

INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description) 
	 VALUES ((SELECT id 
			    FROM jeu 
			   WHERE nom = 'Desert'), 'SableMouvant','P27', 200, 0.5, 2.5, 4.5,'Sable mouvant');
			  
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description) 
	 VALUES ((SELECT id 
		        FROM jeu
		       WHERE nom = 'PUMPUM'),'earthquake','P90',500,0.5,1.12,1.42,'detruit tous ce qui se trouve a proximite'); 
			  
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description)		   
	 VALUES ((SELECT id 
	  	        FROM jeu
		       WHERE nom = 'PUMPUM'),'Wada','P12',20,0.2,0.12,0.42,'Envoie un jet deau, ideal pour la douche');
			 
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description)
     VALUES ((SELECT id 
		        FROM jeu
		       WHERE nom = 'PUMPUM'),'Crazy ray','P22',100,2.4,1.2,6.42,'Rend lenemie fou et attacque ces amis');
			  
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_3, description) 
	 VALUES ((SELECT id
				FROM jeu
			   WHERE nom = 'Green World'), 'Hide','P02', 10, 1,'Se cacher');
			 
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_2, coef_3, description) 
	 VALUES ((SELECT id
				FROM jeu
			   WHERE nom = 'Green World'), 'Kage Bunshin','P98', 50, 1, 1,'Shadow Clone Jutsu');			 
	
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_2, coef_3, description) 
	 VALUES ((SELECT id
				FROM jeu
			   WHERE nom = 'Green World'), 'Prothese','P78', 70, 1, 1,'habilete mystere');	
			 
-- CREATION DES ITEMS:

INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
			    FROM jeu
			   WHERE nom = 'Green World'), 'Gauntlet of Doom','L09', 'Outil de reve pour detruire le monde', 1, 23);		 

INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
			    FROM jeu
			   WHERE nom = 'Green World'), 'Helmet of Charm','L04', 'Outil de reve pour charmer', 0.5, 73);
			 
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
			    FROM jeu
			   WHERE nom = 'Green World'), 'Sword of Vishnu','L40', 'Destroy', 0.25, 133);
			 
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
			    FROM jeu
			   WHERE nom = 'Green World'), 'Boot of Dance','L99', 'AHHHH', 0.5, 103);
			 
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
				FROM jeu
			   WHERE nom = 'Green World'), 'Gauntlet of Thebes','L58', 'Augmente les points de vie', 0.5, 73);
							 
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id 
			    FROM jeu 
			   WHERE nom = 'Desert'), 'Laser','L41', 'Laser qui fait de la lumière.', 0.5, 300);

INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id 
			    FROM jeu 
			   WHERE nom = 'Desert'), 'Foulard','L11', 'Foulard pour se cacher le visage.', 1, 100);

INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id 
			    FROM jeu 
			   WHERE nom = 'Desert'), 'AirJordan','L02', 'Souliers qui ont du style.', 0.7 , 650);

INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id 
			    FROM jeu 
			   WHERE nom = 'Desert'), 'FlappyBird','L21', 'Oiseau qui suit.', 0.1 , 400);

INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id 
			    FROM jeu 
			   WHERE nom = 'Desert'), 'Sword','L29', 'Grosse épée.', 0.3 , 300);
			  
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
				FROM jeu
			   WHERE nom = 'PUMPUM'), 'little 9', 'LG40', 'Glock', 0.5, 5000);
			   
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
			  	FROM jeu
		       WHERE nom = 'PUMPUM'), 'chapeau de paille', 'LCP1', ' Appel les tambours de liberation', 1, 999999);
			   
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
			    FROM jeu
			   WHERE nom = 'PUMPUM'), 'one piece', 'L1P1', 'Le tresor cache',0.1,1000000);
			   
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	VALUES ((SELECT id
			   FROM jeu
			  WHERE nom = 'PUMPUM'), 'baton de rudes', 'LJBL', 'Le baton d un homme de 30 ans',1,400);
				
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
	 VALUES ((SELECT id
			    FROM jeu
			   WHERE nom = 'PUMPUM'), 'Lunette de sylfie', 'LDS1', 'Augmente la furtivite du joeur',0.2,40000);


-- CREATION JOUEUR:
-- Joueur principal:

INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut) 
	 VALUES ('julienpay2win', 'julien_riche@gmail.com', 'flex1337', 'homme cisgenre', TO_DATE('2023-03-24', 'YYYY-MM-DD'), TO_DATE('1989-12-18', 'YYYY-MM-DD'), 'payant');

-- Joueur secondaire:

INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut) 
	VALUES ('Benjamin', 'nomad@gmail.com', '123', 'homme cisgenre', TO_DATE('2024-05-04','YYYY-MM-DD'), TO_DATE('2000-04-05','YYYY-MM-DD'), 'invite');

INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut)
     VALUES ('UltimateVegetable', 'ultimate@gmail.com', 'tototo', 'homme cisgenre', TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2000-09-12', 'YYYY-MM-DD'), 'invite');

INSERT INTO joueur (alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut)
	 	VALUES('Aissa', 'aissa@gmail.com', '6142', 'homme cisgenre', TO_DATE('2023-05-07', 'YYYY-MM-DD'), TO_DATE('1996-04-12','YYYY-MM-DD'), 'invite');

-- CREATION AVATARS JOUEUR PRINCIPAL:

INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_1) 
     VALUES ('kingpayment', (SELECT id 
								  FROM joueur
								 WHERE alias_joueur = 'julienpay2win'), TO_DATE('2023-03-25', 'YYYY-MM-DD'), 100, 3764807423);
								 
INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_2, couleur_3) 
     VALUES ('bigandrich', (SELECT id 
							  FROM joueur
							 WHERE alias_joueur = 'julienpay2win'), TO_DATE('2023-03-28', 'YYYY-MM-DD'), 100, 3764807423, 3764234423);
							 
INSERT INTO avatar(nom, joueur, date_creation, quantite_mox) 
     VALUES ('ezclapper', (SELECT id 
							 FROM joueur
							WHERE alias_joueur = 'julienpay2win'), TO_DATE('2023-05-11', 'YYYY-MM-DD'), 100);
			 		 
-- AVATAR JOUEUR SECONDAIRE :

INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_1) 
	 VALUES ('Martin Le bleu', (SELECT id 
								  FROM joueur 
								 WHERE alias_joueur = 'UltimateVegetable'), TO_DATE('2023-04-10', 'YYYY-MM-DD'), 100, 342643);
								 
INSERT INTO avatar(nom, joueur, date_creation, quantite_mox) 
	 VALUES ('soumoune', (SELECT id 
					  	   FROM joueur 
						  WHERE alias_joueur = 'Aissa'), TO_DATE('2023-05-08', 'YYYY-MM-DD'), 5500);
					  
INSERT INTO avatar(nom, joueur, date_creation, quantite_mox) 
	 VALUES ('kingNomad',(SELECT id
					     	FROM joueur
					       WHERE alias_joueur = 'Benjamin'),TO_DATE('2025-05-04','YYYY-MM-DD'), 1500);

-- CREATION PHRASES

INSERT INTO phrase(avatar,phrase) 
	 VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'kingpayment'), 'I like to swipe.');
			   
INSERT INTO phrase(avatar,phrase) 
     VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'kingpayment'), 'We will rock you.');
	 
INSERT INTO phrase(avatar,phrase) 
     VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'kingpayment'), 'Time to die.');
	 
INSERT INTO phrase(avatar,phrase) 
     VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'bigandrich'), 'Live fast, die young.');
	 
INSERT INTO phrase(avatar,phrase) 
     VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'ezclapper'), 'Stairway to heaven is overrated.');
			 
-- CREATION ACTIVITE:
-- Activité joueur principal:

INSERT INTO activite(joueur, date_debut, duree) 
     VALUES ((SELECT id 
			    FROM joueur
			   WHERE alias_joueur = 'julienpay2win'), TO_TIMESTAMP('2023-03-25 08:30:10', 'YYYY-MM-DD HH:MI:SS'), 10800);
			   
INSERT INTO activite(joueur, date_debut, duree) 
     VALUES ((SELECT id 
			     FROM joueur
			    WHERE alias_joueur = 'julienpay2win'), TO_TIMESTAMP('2023-04-11 10:40:10', 'YYYY-MM-DD HH:MI:SS'), 5400);
				
INSERT INTO activite(joueur, date_debut,duree) 
     VALUES ((SELECT id 
			     FROM joueur
			    WHERE alias_joueur = 'julienpay2win'), TO_TIMESTAMP('2023-03-28 10:30:01', 'YYYY-MM-DD HH:MI:SS'), 1500);
				
INSERT INTO activite(joueur, date_debut, duree) 
     VALUES ((SELECT id 
			     FROM joueur
			    WHERE alias_joueur = 'julienpay2win'), TO_TIMESTAMP('2023-05-11 08:24:45', 'YYYY-MM-DD HH:MI:SS'), 7200);
			 
-- Activitée joueur secondaire:
			 
INSERT INTO activite(joueur,date_debut, duree)
	 VALUES ((SELECT id 
				FROM joueur 
			   WHERE alias_joueur = 'Aissa'),TO_TIMESTAMP('2023-05-09 10:00:00', 'YYYY-MM-DD HH:MI:SS'), 900);

INSERT INTO activite(joueur,date_debut, duree) 
	 VALUES ((SELECT id 
				FROM joueur 
			   WHERE alias_joueur = 'Aissa'),TO_TIMESTAMP('2023-05-09 10:25:00', 'YYYY-MM-DD HH:MI:SS'),900);

INSERT INTO activite(joueur,date_debut, duree) 
	 VALUES ((SELECT id 
				FROM joueur 
			   WHERE alias_joueur = 'Aissa'),TO_TIMESTAMP('2023-05-09 11:00:00', 'YYYY-MM-DD HH:MI:SS'),1200);
				  
INSERT INTO activite(joueur, date_debut, duree) 
	 VALUES ((SELECT id
				FROM joueur
			   WHERE alias_joueur = 'Benjamin'), TO_TIMESTAMP('2024-05-05 10:30:44', 'YYYY-MM-DD HH:MI:SS'),10800 );
					
INSERT INTO activite(joueur, date_debut, duree) 
     VALUES ( (SELECT id 
			     FROM joueur
			    WHERE alias_joueur = 'UltimateVegetable'), TO_TIMESTAMP('2023-04-11 10:12:05', 'YYYY-MM-DD HH:MI:SS'),12000);
					

-- CAPSULE D'ACTIVITÉ:
-- kingpayment (avatar principal)

INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-03-25 08:30:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), (SELECT id 
																										     FROM jeu
																										    WHERE nom = 'Green World'), 6000);

INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-03-25 08:30:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), (SELECT id 
																											 FROM jeu
																											WHERE nom = 'Desert'), 2400);

INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-03-25 08:30:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), (SELECT id 
																											 FROM jeu
																										    WHERE nom = 'PUMPUM'), 2400);
			 
INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:40:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), (SELECT id 
																											 FROM jeu
																										    WHERE nom = 'Desert'), 3000);			 
			 
INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:40:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), (SELECT id 
																											 FROM jeu
																										    WHERE nom = 'Green World'), 1200);			 
			 
INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:40:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), (SELECT id 
																											 FROM jeu
																										    WHERE nom = 'PUMPUM'), 1200);

-- bignrich
			 
INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-03-28 10:30:01', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'bigandrich'), (SELECT id 
																											FROM jeu
																										   WHERE nom = 'Green World'), 1500);	
			 
-- ezclapper

INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-05-11 08:24:45', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'ezclapper'), (SELECT id 
																										   FROM jeu
																										  WHERE nom = 'Desert'), 7200);

-- soumoune 

INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
	 VALUES ((SELECT id 
			    FROM activite
			   WHERE date_debut = TO_TIMESTAMP('2023-05-09 11:00:00', 'YYYY-MM-DD HH:MI:SS')
			     AND joueur = (SELECT id 
							     FROM joueur
						        WHERE alias_joueur = 'Aissa')), (SELECT id 
																   FROM avatar
												                  WHERE nom = 'soumoune'),(SELECT id 
																						     FROM jeu
																		                    WHERE nom = 'Desert'), 1200);


INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
	 VALUES ((SELECT id 
			    FROM activite
			   WHERE date_debut = TO_TIMESTAMP('2023-05-09 10:00:00', 'YYYY-MM-DD HH:MI:SS')
			     AND joueur = (SELECT id 
							     FROM joueur
						        WHERE alias_joueur = 'Aissa')), (SELECT id 
																   FROM avatar
												                  WHERE nom = 'soumoune'),(SELECT id 
																						     FROM jeu
																		                    WHERE nom = 'Desert'), 900);

INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
	 VALUES ((SELECT id 
			    FROM activite
			   WHERE date_debut =TO_TIMESTAMP('2023-05-09 10:25:00', 'YYYY-MM-DD HH:MI:SS')
			     AND joueur = (SELECT id 
							     FROM joueur
						        WHERE alias_joueur = 'Aissa')), (SELECT id 
																   FROM avatar
																  WHERE nom = 'soumoune'),(SELECT id 
																						     FROM jeu
																						    WHERE nom = 'Desert'), 900);
																		 
-- kingNomad:

INSERT INTO capsule_activite(activite,avatar,jeu,duree)
	 VALUES ((SELECT id
		   		FROM activite
		   	   WHERE date_debut= TO_TIMESTAMP('2024-05-05 10:30:44', 'YYYY-MM-DD HH:MI:SS')
		   		 AND joueur = (SELECT id
		   						 FROM joueur
		   						WHERE alias_joueur = 'Benjamin')),(SELECT id
																	 FROM avatar
																	WHERE nom = 'kingNomad'),(SELECT id 
																								FROM jeu
																							   WHERE nom = 'PUMPUM'), 800);
INSERT INTO capsule_activite(activite,avatar,jeu,duree)
	 VALUES ((SELECT id
		   		FROM activite
		   	   WHERE date_debut= TO_TIMESTAMP('2024-05-05 10:30:44', 'YYYY-MM-DD HH:MI:SS')
		   		 AND joueur = (SELECT id
		   						 FROM joueur
		   						WHERE alias_joueur = 'Benjamin')),(SELECT id
																	 FROM avatar
																	WHERE nom = 'kingNomad'),(SELECT id 
																								FROM jeu
																							   WHERE nom = 'PUMPUM'), 5000);
INSERT INTO capsule_activite(activite,avatar,jeu,duree)
	 VALUES ((SELECT id
		   		FROM activite
		   	   WHERE date_debut= TO_TIMESTAMP('2024-05-05 10:30:44', 'YYYY-MM-DD HH:MI:SS')
		   		 AND joueur = (SELECT id
								 FROM joueur
								WHERE alias_joueur = 'Benjamin')),(SELECT id
																	 FROM avatar
																	WHERE nom = 'kingNomad'),(SELECT id 
																							    FROM jeu
																							   WHERE nom = 'PUMPUM'), 5000);
																																
-- francois:

INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
     VALUES ((SELECT id
			    FROM activite
			   WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:12:05', 'YYYY-MM-DD HH:MI:SS')
			     AND  joueur = (SELECT id
					              FROM joueur 
							     WHERE alias_joueur = 'UltimateVegetable')),
															  (SELECT id 
																 FROM avatar
																WHERE nom = 'Martin Le bleu'), (SELECT id
																							      FROM jeu
																							     WHERE nom = 'Green World' ), 6000);



INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
     VALUES ((SELECT id
			    FROM activite
			   WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:12:05', 'YYYY-MM-DD HH:MI:SS')
			     AND  joueur = (SELECT id
					              FROM joueur 
							     WHERE alias_joueur = 'UltimateVegetable')),
															  (SELECT id 
																 FROM avatar
																WHERE nom = 'Martin Le bleu'), (SELECT id
																							      FROM jeu
																							     WHERE nom = 'Green World' ),4000);
																								 
INSERT INTO capsule_activite(activite,avatar,jeu, duree) 
     VALUES ((SELECT id
			    FROM activite
			   WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:12:05', 'YYYY-MM-DD HH:MI:SS')
			     AND  joueur = (SELECT id
					              FROM joueur 
							     WHERE alias_joueur = 'UltimateVegetable')),
															  (SELECT id 
																 FROM avatar
																WHERE nom = 'Martin Le bleu'), (SELECT id
																							      FROM jeu
																							     WHERE nom = 'Green World' ),2000);	




