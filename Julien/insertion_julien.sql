-- CREATION JOUEUR1:

INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut) 
	 VALUES ('julienpay2win', 'julien_riche@gmail.com', 'flex1337', 'homme cisgenre', TO_DATE('2023-03-24', 'YYYY-MM-DD'), TO_DATE('1989-12-18', 'YYYY-MM-DD'), 'payant');

-- CREATION AVATARS JOUEUR1:

INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_1) 
     VALUES ('kingpayment', (SELECT id 
								  FROM joueur
								 WHERE alias_joueur = 'julienpay2win'), 
			 TO_DATE('2023-03-25', 'YYYY-MM-DD'), 100, 3764807423);
INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_2, couleur_3) 
     VALUES ('bigandrich', (SELECT id 
							  FROM joueur
							 WHERE alias_joueur = 'julienpay2win'), 
			 TO_DATE('2023-03-28', 'YYYY-MM-DD'), 100, 3764807423, 3764234423);
INSERT INTO avatar(nom, joueur, date_creation, quantite_mox) 
     VALUES ('ezclapper', (SELECT id 
							 FROM joueur
							WHERE alias_joueur = 'julienpay2win'), 
			 TO_DATE('2023-05-11', 'YYYY-MM-DD'), 100);
			 
-- CREATION PHRASES

INSERT INTO phrase(avatar,phrase) 
	 VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'kingpayment'), 
			 'I like to swipe.');
			   
INSERT INTO phrase(avatar,phrase) 
     VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'kingpayment'), 
			 'We will rock you.');
	 
INSERT INTO phrase(avatar,phrase) 
     VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'kingpayment'), 
			 'Time to die.');
	 
INSERT INTO phrase(avatar,phrase) 
     VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'bigandrich'), 
			 'Live fast, die young.');
	 
INSERT INTO phrase(avatar,phrase) 
     VALUES ((SELECT id
			    FROM avatar
			   WHERE nom = 'ezclapper'), 
			 'Stairway to heaven is overrated.');
			 
-- CREATION ACTIVITE:

INSERT INTO activite(joueur, date_debut, duree) 
     VALUES ((SELECT id 
			    FROM joueur
			   WHERE alias_joueur = 'julienpay2win'),
			 TO_TIMESTAMP('2023-03-25 08:30:10', 'YYYY-MM-DD HH:MI:SS'), 
			 10800);
INSERT INTO activite(joueur, date_debut, duree) 
     VALUES ((SELECT id 
			     FROM joueur
			    WHERE alias_joueur = 'julienpay2win'),
			 TO_TIMESTAMP('2023-04-11 10:40:10', 'YYYY-MM-DD HH:MI:SS'), 
			 5400);
INSERT INTO activite(joueur, date_debut,duree) 
     VALUES ((SELECT id 
			     FROM joueur
			    WHERE alias_joueur = 'julienpay2win'),
			 TO_TIMESTAMP('2023-03-28 10:30:01', 'YYYY-MM-DD HH:MI:SS'), 
			 1500);
INSERT INTO activite(joueur, date_debut, duree) 
     VALUES ((SELECT id 
			     FROM joueur
			    WHERE alias_joueur = 'julienpay2win'),
			 TO_TIMESTAMP('2023-05-11 08:24:45', 'YYYY-MM-DD HH:MI:SS'), 
			 7200);

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
																		      WHERE nom = 'kingpayment'), 
			 (SELECT id 
			    FROM jeu
			   WHERE nom = 'Green World'), 
			 6000);

INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-03-25 08:30:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), 
			 (SELECT id 
			    FROM jeu
			   WHERE nom = 'Magnifique World'), 
			 2400);

INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-03-25 08:30:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), 
			 (SELECT id 
			    FROM jeu
			   WHERE nom = 'Clavier World'), 
			 2400);
			 
INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:40:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), 
			 (SELECT id 
			    FROM jeu
			   WHERE nom = 'Magnifique World'), 
			 3000);			 
			 
INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:40:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), 
			 (SELECT id 
			    FROM jeu
			   WHERE nom = 'Green World'), 
			 1200);			 
			 
INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-04-11 10:40:10', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'kingpayment'), 
			 (SELECT id 
			    FROM jeu
			   WHERE nom = 'Magnifique World'), 
			 1200);

-- bignrich
			 
INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-03-28 10:30:01', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'bigandrich'), 
			 (SELECT id 
			    FROM jeu
			   WHERE nom = 'Green World'), 
			 1500);	
			 
-- ezclapper

INSERT INTO capsule_activite(activite , avatar, jeu, duree) 
     VALUES ((SELECT id 
                 FROM activite
 				WHERE date_debut = TO_TIMESTAMP('2023-05-11 08:24:45', 'YYYY-MM-DD HH:MI:SS')
 	   				  AND joueur = (SELECT id 
		      			  		      FROM joueur
				      			     WHERE alias_joueur = 'julienpay2win')),(SELECT id
																		       FROM avatar
																		      WHERE nom = 'ezclapper'), 
			 (SELECT id 
			    FROM jeu
			   WHERE nom = 'Green World'), 
			 7200);


SELECT * FROM phrase


