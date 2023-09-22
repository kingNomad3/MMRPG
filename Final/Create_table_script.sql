/*

Create_table_script.sql
420-C42-IN Langages d'exploitation des bases de données
Auteurs : Julien Coulombe-Morency, Benjamin Joinvil, Aissa Bouaraguia, François Maltais
Date de création : 2023-09-14
Dernière modification : 2023-09-22

*/

ALTER TABLE IF EXISTS avatar_habilete DROP CONSTRAINT IF EXISTS fk_ah_habilete;
ALTER TABLE IF EXISTS avatar_habilete DROP CONSTRAINT IF EXISTS fk_ah_avatar;
ALTER TABLE IF EXISTS avatar_item DROP CONSTRAINT IF EXISTS fk_ai_item;
ALTER TABLE IF EXISTS avatar_item DROP CONSTRAINT IF EXISTS fk_ai_avatar;
ALTER TABLE IF EXISTS phrase DROP CONSTRAINT IF EXISTS fk_phrase_avatar;
ALTER TABLE IF EXISTS item DROP CONSTRAINT IF EXISTS fk_item_jeu;
ALTER TABLE IF EXISTS habilete DROP CONSTRAINT IF EXISTS fk_habilete_jeu;
ALTER TABLE IF EXISTS capsule_activite DROP CONSTRAINT IF EXISTS fk_ca_avatar;
ALTER TABLE IF EXISTS capsule_activite DROP CONSTRAINT IF EXISTS fk_ca_jeu;
ALTER TABLE IF EXISTS capsule_activite DROP CONSTRAINT IF EXISTS fk_ca_activite;
ALTER TABLE IF EXISTS activite DROP CONSTRAINT IF EXISTS fk_activite_joueur;
ALTER TABLE IF EXISTS historique_abonnement DROP CONSTRAINT IF EXISTS fk_ha_joueur;
ALTER TABLE IF EXISTS avatar DROP CONSTRAINT IF EXISTS fk_avatar_joueur;
DROP TABLE IF EXISTS historique_abonnement;
DROP TABLE IF EXISTS avatar_item;
DROP TABLE IF EXISTS avatar_habilete;
DROP TABLE IF EXISTS phrase;
DROP TABLE IF EXISTS capsule_activite;
DROP TABLE IF EXISTS activite;
DROP TABLE IF EXISTS avatar;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS habilete;
DROP TABLE IF EXISTS jeu;
DROP TABLE IF EXISTS joueur;
DROP TYPE IF EXISTS statut;
DROP TYPE IF EXISTS genre;


CREATE TYPE genre AS ENUM(
  'femme cisgenre',
  'homme cisgenre',
  'femme transgenre',
  'hommre transgenre',
  'non-binaire',
  'genre-fluide',
  'agenre',
  'autre'
);

CREATE TYPE statut AS ENUM(
  'payant',
  'invite'
);

CREATE TABLE joueur (
	id					SERIAL,
	alias_joueur 		VARCHAR(32)				NOT NULL, 
	courriel			VARCHAR(128)			NOT NULL, 
	mot_de_passe		VARCHAR(32)				NOT NULL,
	genre 				genre,
	date_inscription 	date 					NOT NULL, 
	date_naissance 		date 					DEFAULT NULL,
	statut 				statut 					NOT NULL,

	CONSTRAINT pk_joueur PRIMARY KEY (id),
	CONSTRAINT uc_joueur_alias UNIQUE (alias_joueur),
	CONSTRAINT uc_joueur_courriel UNIQUE (courriel),
	CONSTRAINT cc_date_inscription CHECK (date_inscription > '2023-01-01'),
	CONSTRAINT cc_date_naissance CHECK (date_naissance > '1900-01-01' AND date_naissance <= (CURRENT_DATE - interval '13 years')) 
);


CREATE TABLE jeu (
	id					SERIAL,
	nom					VARCHAR(16)				NOT NULL,
	sigle				CHAR(6)					NOT NULL,
	description 		VARCHAR(2048),
	
	CONSTRAINT 	pk_jeu	PRIMARY KEY (id),
	CONSTRAINT 	uc_jeu_nom	 UNIQUE (nom),
	CONSTRAINT 	uc_jeu_sigle 	UNIQUE (sigle),
	CONSTRAINT 	cc_jeu_nom	CHECK (LENGTH(nom) >= 3 AND nom ~ '^[a-zA-Z]'),
	CONSTRAINT 	cc_jeu_sigle	CHECK (sigle ~ '^[a-zA-Z]')
);


CREATE TABLE habilete (
	id 					SERIAL,
	jeu 				INTEGER 				NOT NULL,
	nom 				VARCHAR(32) 			NOT NULL,
	sigle 				CHAR(3) 				NOT NULL,
	energie_max 		NUMERIC(7,3) 			NOT NULL DEFAULT 100,	-- cout en énergie pour l'habilete
	coef_1 				DOUBLE PRECISION 		NOT NULL DEFAULT 0,		-- coefficient utilisé pour calculer le cout par niveau des habileté
	coef_2 				DOUBLE PRECISION 		NOT NULL DEFAULT 0,
	coef_3 				DOUBLE PRECISION 		NOT NULL DEFAULT 1,
	description 		VARCHAR(1024) 			NOT NULL,
	
	CONSTRAINT pk_habilite PRIMARY KEY (id),
	CONSTRAINT uc_hab_nom 	UNIQUE (nom),
	CONSTRAINT uc_hab_sigle	UNIQUE (sigle),
	CONSTRAINT cc_hab_sigle	CHECK (sigle ~ '^[P]'),
	CONSTRAINT cc_hab_energie	CHECK (energie_max >= 1 AND energie_max <= 1000)
);


CREATE TABLE item (
	id					SERIAL,
	jeu 				INTEGER					NOT NULL,
	nom 				VARCHAR(32)				NOT NULL,
	sigle				VARCHAR(4)				NOT NULL,
	description			VARCHAR(1024)			NOT NULL,
	probabilite			NUMERIC(4,3)			NOT NULL DEFAULT 0.025,
	valeur_mox			NUMERIC(9,2)			NOT NULL DEFAULT 100.0,
	
	CONSTRAINT pk_item PRIMARY KEY (id),
	CONSTRAINT uc_item_nom UNIQUE (nom),
	CONSTRAINT uc_item_sigle UNIQUE (sigle),
	CONSTRAINT cc_item_sigle CHECK (sigle ~ '^[L]'),
	CONSTRAINT cc_item_probabilite CHECK (probabilite >= 0 AND probabilite <= 1),
	CONSTRAINT cc_item_valeur CHECK (valeur_mox >= 1 AND valeur_mox <= 1000000)
	
);


CREATE TABLE avatar (
	id 					SERIAL,
	nom					VARCHAR(32)			NOT NULL,
	joueur				INTEGER				NOT NULL,
	date_creation		DATE				NOT NULL DEFAULT CURRENT_DATE,
	quantite_mox		NUMERIC(9,2)		NOT NULL,
	couleur_1			BIGINT				NOT NULL DEFAULT 4294967295, 
	couleur_2			BIGINT,
	couleur_3			BIGINT,
	
	CONSTRAINT pk_avatar PRIMARY KEY (id),
	CONSTRAINT uc_avatar_mox CHECK (quantite_mox >= 1 AND quantite_mox <= 1000000),
	CONSTRAINT cc_avatar_nom CHECK (LENGTH(nom) >= 3),
	CONSTRAINT uc_avatar_nomjoueur UNIQUE (nom, joueur)

);


CREATE TABLE activite(
	id 					SERIAL,
	joueur				INTEGER				NOT NULL,
	date_debut			TIMESTAMP			NOT NULL DEFAULT CURRENT_TIMESTAMP,
	duree				INTEGER				NOT NULL,

	CONSTRAINT pk_activite PRIMARY KEY (id),
	CONSTRAINT cc_activite_duree CHECK (duree > 0)
);


CREATE TABLE capsule_activite(
	id 					SERIAL,
	activite 			INTEGER  			NOT NULL,
	avatar				INTEGER				NOT NULL,
	jeu					INTEGER				NOT NULL,
	duree				INTEGER				NOT NULL,
	
	
	CONSTRAINT pk_capsule PRIMARY KEY (id),
	CONSTRAINT cc_capsule_duree CHECK (duree > 0)
	
);


CREATE TABLE phrase (
	id 					SERIAL,
	avatar 				INTEGER 				NOT NULL,
	phrase				VARCHAR(64),
	
	CONSTRAINT pk_phrase PRIMARY KEY (id)
);


CREATE TABLE avatar_habilete(
	avatar 			INTEGER, 
	habilete		INTEGER,
	date_obtention  TIMESTAMP 				DEFAULT CURRENT_TIMESTAMP, 
	niveau 			INTEGER 				NOT NULL  DEFAULT 1,
	
	CONSTRAINT pk_avatar_habilete PRIMARY KEY (avatar, habilete),
	CONSTRAINT cc_ah_niveau CHECK (niveau >= 1 AND niveau <= 100)
);


CREATE TABLE avatar_item(
	avatar 			INTEGER, 
	item			INTEGER,
	date_obtention  TIMESTAMP 				DEFAULT CURRENT_TIMESTAMP, 
	quantite 		INTEGER 				NOT NULL  DEFAULT 1,
	
	CONSTRAINT pk_avatar_item PRIMARY KEY (avatar, item),
	CONSTRAINT cc_ai_quantite CHECK (quantite >= 1 AND quantite <= 1000)
);


CREATE TABLE historique_abonnement(
	id 				SERIAL,
	joueur			INTEGER  				NOT NULL,
	date_debut		date 					NOT NULL DEFAULT CURRENT_DATE,
	date_fin 		date,								
	

	CONSTRAINT pk_historique_abonnement PRIMARY KEY (id)
);



ALTER TABLE avatar
	ADD CONSTRAINT fk_avatar_joueur
		FOREIGN KEY (joueur) REFERENCES joueur(id);
		
ALTER TABLE historique_abonnement
	ADD CONSTRAINT fk_ha_joueur
		FOREIGN KEY (joueur) REFERENCES joueur(id);
		
ALTER TABLE activite
	ADD CONSTRAINT fk_activite_joueur
		FOREIGN KEY (joueur) REFERENCES joueur(id);
		
ALTER TABLE capsule_activite
	ADD CONSTRAINT fk_ca_activite
		FOREIGN KEY (activite) REFERENCES activite(id),
	ADD CONSTRAINT fk_ca_jeu
		FOREIGN KEY (jeu) REFERENCES jeu(id),
	ADD CONSTRAINT fk_ca_avatar
		FOREIGN KEY (avatar) REFERENCES avatar(id);
		
ALTER TABLE habilete
	ADD CONSTRAINT fk_habilete_jeu
		FOREIGN KEY (jeu) REFERENCES jeu(id);

ALTER TABLE item
	ADD CONSTRAINT fk_item_jeu
		FOREIGN KEY (jeu) REFERENCES jeu(id);

ALTER TABLE phrase
	ADD CONSTRAINT fk_phrase_avatar
		FOREIGN KEY (avatar) REFERENCES avatar(id);

ALTER TABLE avatar_item
	ADD CONSTRAINT fk_ai_avatar
		FOREIGN KEY (avatar) REFERENCES avatar(id),
	ADD CONSTRAINT fk_ai_item
		FOREIGN KEY (item) REFERENCES item(id);
		
ALTER TABLE avatar_habilete
	ADD CONSTRAINT fk_ah_avatar
		FOREIGN KEY (avatar) REFERENCES avatar(id),
	ADD CONSTRAINT fk_ah_habilete
		FOREIGN KEY (habilete) REFERENCES habilete(id);
		
		











