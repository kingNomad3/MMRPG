-- INSERT Francois





-- Insert joueur

--INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut) 
	 --VALUES ('julientest', 'julien@allo.com', '123', 'homme cisgenre', current_date, '2000-01-01', 'invite')

INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut)
     VALUES ('UltimateVegetable', 'ultimate@gmail.com', 'tototo', 'homme cisgenre', TO_DATE('2023-04-05', 'YYYY-MM-DD'), TO_DATE('2000-09-12', 'YYYY-MM-DD'), 'invite');
	 
SELECT * FROM joueur;


-- Insert Avatar

-- INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_1, couleur_2, couleur_3) VALUES ('kevin', 1, CURRENT_DATE, 1000, 1, 1, 1);

INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_1) 
     VALUES ('Martin Le bleu', (SELECT id 
								  FROM joueur 
								 WHERE alias_joueur = 'UltimateVegetable'), TO_DATE('2023-04-10', 'YYYY-MM-DD'), 100, 342643);
								 

SELECT * FROM avatar;

-- Insertion Activité
-- INSERT INTO activite(joueur, duree) VALUES ( 1,42)

INSERT INTO activite(joueur, date_debut, duree) 
     VALUES ( (SELECT id 
			     FROM joueur
			    WHERE alias_joueur = 'UltimateVegetable'),
	     TO_TIMESTAMP('2023-04-11 10:12:05', 'YYYY-MM-DD HH:MI:SS'),42);
		 

SELECT * FROM activite;


-- Insert Capsule Activite 					3 activités

--  INSERT INTO capsule_activite(activite,avatar,jeu, duree) VALUES ( 1,42,5,8);


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
																							     WHERE nom = 'Green World' ),8);


			 
			 

-- Insert JEU 								3 jeux
			 
INSERT INTO jeu(nom, sigle, description) 
	 VALUES ('Green World', 'Z09786', 'Un monde unique et chaleureux');
			 
INSERT INTO jeu(nom, sigle, description) 
	 VALUES ('Magnifique World', 'U08787', 'Un monde sans bbq');
			 
INSERT INTO jeu(nom, sigle, description) 
	 VALUES ('Clavier World', 'O88886', 'Un monde à la saveur de plastique');


SELECT * FROM jeu;
			 
			 
			 
-- Insert ITEM							5 en tout et  

-- Green World 5 item
			 
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			 VALUES ((SELECT id
					    FROM jeu
					   WHERE nom = 'Green World'),
						     'Gauntlet of Doom','L09', 'Outil de reve pour detruire le monde', 1, 23);		 

INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			 VALUES ((SELECT id
					    FROM jeu
					   WHERE nom = 'Green World'),
						     'Helmet of Charm','L04', 'Outil de reve pour charmer', 0.5, 73);
			 
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			 VALUES ((SELECT id
					    FROM jeu
					   WHERE nom = 'Green World'),
						     'Sword of Vishnu','L40', 'Destroy', 0.25, 133);
			 
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			 VALUES ((SELECT id
					    FROM jeu
					   WHERE nom = 'Green World'),
						     'Boot of Dance','L99', 'AHHHH', 0.5, 103);
			 
INSERT INTO item(jeu, nom, sigle, description, probabilite, valeur_mox) 
			 VALUES ((SELECT id
					    FROM jeu
					   WHERE nom = 'Green World'),
						     'Helmet of Charm','L58', 'Outil de reve pour charmer', 0.5, 73);

-- Insert Habilete 
		
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_3, description) 
	 VALUES ( (SELECT id
					    FROM jeu
					   WHERE nom = 'Green World'), 
			 'Hide','P02', 10, 1,'Se cacher');
			 
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_2, coef_3, description) 
	 VALUES ( (SELECT id
				 FROM jeu
			    WHERE nom = 'Green World'), 
			 'Kage Bunshin','P98', 50, 1, 1,'Shadow Clone Jutsu');			 
	
INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_2, coef_3, description) 
	 VALUES ( (SELECT id
				 FROM jeu
			    WHERE nom = 'Green World'), 
			 'Prothese','P78', 70, 1, 1,'habilete mystere');		
