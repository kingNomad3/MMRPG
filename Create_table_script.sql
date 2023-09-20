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
	courriel			VARCHAR(128)			NOT NULL, -- UNIQUE,
	mot_de_passe		VARCHAR(32)				NOT NULL,
	genre 				genre,
	date_inscription 	date 					NOT NULL, -- cc_datedddd
	date_naissance 		date 					DEFAULT NULL,
	statut 				statut 					NOT NULL,

	CONSTRAINT pk_joueur PRIMARY KEY (id),
	CONSTRAINT uc_joueur_alias UNIQUE (alias_joueur),
	CONSTRAINT uc_joueur_courriel UNIQUE (courriel),
	CONSTRAINT cc_date_inscription CHECK (date_inscription > '2023-01-01'),
	CONSTRAINT cc_date_naissance CHECK (date_naissance > '1900-01-01' AND date_naissance <= (CURRENT_DATE - interval '13 years'))
);

--INSERT INTO joueur(alias_joueur, courriel, mot_de_passe, genre, date_inscription, date_naissance, statut) 
	 --VALUES ('julientest', 'julien@allo.com', '123', 'homme cisgenre', current_date, '2000-01-01', 'invite')

CREATE TABLE jeu (
	id					SERIAL,
	nom					VARCHAR(16)				NOT NULL,
	sigle				CHAR(6)					NOT NULL,
	description 		VARCHAR(2048),
	
	CONSTRAINT 	pk_jeu	PRIMARY KEY (id),
	CONSTRAINT 	uc_jeu_nom	 UNIQUE (nom),
	CONSTRAINT 	uc_jeu_sigle 	UNIQUE (sigle),
	CONSTRAINT 	cc_jeu_nom 	CHECK (LENGTH(nom) >= 3 AND nom ~ '^[a-zA-Z]'),
	CONSTRAINT 	cc_jeu_sigle 	CHECK (sigle ~ '^[a-zA-Z]')
);

--INSERT INTO jeu(nom, sigle, description) VALUES ('Julien', 'D12345', 'Allo ce monde');

CREATE TABLE habilete (
	id 				SERIAL,
	jeu 			INTEGER 				NOT NULL,
	nom 			VARCHAR(32) 			NOT NULL,
	sigle 			CHAR(3) 				NOT NULL,
	energie_max 	NUMERIC(7,3) 			NOT NULL DEFAULT 100,
	coef_1 			DOUBLE PRECISION 		NOT NULL DEFAULT 0,
	coef_2 			DOUBLE PRECISION 		NOT NULL DEFAULT 0,
	coef_3 			DOUBLE PRECISION 		NOT NULL DEFAULT 1,
	description 	VARCHAR(1024) 			NOT NULL,
	
	CONSTRAINT pk_habilite PRIMARY KEY (id),
	CONSTRAINT uc_hab_nom 	UNIQUE (nom),
	CONSTRAINT uc_hab_sigle	UNIQUE (sigle),
	CONSTRAINT cc_hab_sigle	CHECK (sigle ~ '^[P]'),
	CONSTRAINT cc_hab_energie	CHECK (energie_max >= 1 AND energie_max <= 1000)
);

-- Si coef est a default, retirer de la declaration: habilite(declaration) VALUES ..
--INSERT INTO habilete(jeu, nom, sigle, energie_max, coef_1, coef_2, coef_3, description) VALUES ( 1, 'Fire','P12', 50, 1, 2, 1,'Tirer du gun');

CREATE TABLE item (
	id				SERIAL,
	joueur 			INTEGER					NOT NULL,
	nom 			VARCHAR(32)				NOT NULL,
	sigle			VARCHAR(4)				NOT NULL,
	description		VARCHAR(1024)			NOT NULL,
	probabilite		NUMERIC(4,3)			NOT NULL DEFAULT 0.025,
	valeur_mox		NUMERIC(9,2)			NOT NULL DEFAULT 100.0,
	
	CONSTRAINT pk_item PRIMARY KEY (id),
	CONSTRAINT uc_item_nom UNIQUE (nom),
	CONSTRAINT uc_item_sigle UNIQUE (sigle),
	CONSTRAINT cc_item_sigle CHECK (sigle ~ '^[L]'),
	CONSTRAINT cc_item_probabilite CHECK (probabilite >= 0 AND probabilite <= 1),
	CONSTRAINT cc_item_valeur CHECK (valeur_mox >= 1 AND valeur_mox <= 1000000)
	
);

--INSERT INTO item(joueur, nom, sigle, description, probabilite, valeur_mox) VALUES ( 1, 'Fire','L12', 50, 1, 200);

CREATE TABLE avatar (
	id 				SERIAL,
	nom				VARCHAR(32)			NOT NULL,
	joueur			INTEGER				NOT NULL,
	date_creation	DATE				NOT NULL DEFAULT CURRENT_DATE,
	quantite_mox	NUMERIC(9,2)		NOT NULL,
	couleur_1		INTEGER				NOT NULL DEFAULT 4294967295, 
	couleur_2		INTEGER,
	couleur_3		INTEGER,
	
	CONSTRAINT pk_avatar PRIMARY KEY (id),
	CONSTRAINT uc_avatar_mox CHECK (quantite_mox >= 1 AND quantite_mox <= 1000000),
	CONSTRAINT cc_avatar_nom CHECK (LENGTH(nom) >= 3),
	CONSTRAINT uc_avatar_nomjoueur UNIQUE (nom, joueur)

);

-- INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_1, couleur_2, couleur_3) VALUES ('kevin', 1, CURRENT_DATE, 1000, 1, 1, 1);
-- INSERT INTO avatar(nom, joueur, date_creation, quantite_mox, couleur_1, couleur_2, couleur_3) VALUES ('kevin', 1, CURRENT_DATE, 1000, 1, 1, 1);


CREATE TABLE activite(
	id 				SERIAL,
	joueur			INTEGER				NOT NULL,
	date_debut		TIMESTAMP			NOT NULL DEFAULT CURRENT_TIMESTAMP,
	duree			INTEGER				NOT NULL,

	CONSTRAINT pk_activite PRIMARY KEY (id),
	CONSTRAINT cc_activite_duree CHECK (duree > 0)
);


-- INSERT INTO activite(joueur, duree) VALUES ( 1,42);

CREATE TABLE capsule_activite(
	id 				SERIAL,
	activite 		INTEGER  			NOT NULL,
	avatar			INTEGER				NOT NULL,
	jeu				INTEGER				NOT NULL,
	duree			INTEGER				NOT NULL,
	
	
	CONSTRAINT pk_capsule PRIMARY KEY (id),
	CONSTRAINT cc_capsule_duree CHECK (duree > 0)
	
);

-- INSERT INTO capsule_activite(activite,avatar,jeu, duree) VALUES ( 1,42,5,8);

CREATE TABLE phrase (
	id 				SERIAL,
	avatar 			INTEGER 				NOT NULL,
	phrase			VARCHAR(64),
	
	CONSTRAINT pk_phrase PRIMARY KEY (id)
);

-- INSERT INTO phrase(avatar,phrase) VALUES (1, 'les bananes');

CREATE TABLE avatar_habilete(
	avatar 			INTEGER, 
	habilete		INTEGER,
	date_obtention  TIMESTAMP 				DEFAULT CURRENT_TIMESTAMP, --rajoute date et heure 
	niveau 			INTEGER 				NOT NULL  DEFAULT 1,
	
	CONSTRAINT pk_avatar_habilete PRIMARY KEY (avatar, habilete),
	CONSTRAINT cc_ah_niveau CHECK (niveau >= 1 AND niveau <= 100)
);

-- INSERT INTO avatar_habilete(avatar,habilete, niveau) VALUES (1,5, 55);
-- INSERT INTO avatar_habilete(avatar,habilete, niveau) VALUES (2,5, 55);

CREATE TABLE avatar_item(
	avatar 			INTEGER, 
	item			INTEGER,
	date_obtention  TIMESTAMP 				DEFAULT CURRENT_TIMESTAMP, --rajoute date et heure 
	quantite 		INTEGER 				NOT NULL  DEFAULT 1,
	
	CONSTRAINT pk_avatar_item PRIMARY KEY (avatar, item),
	CONSTRAINT cc_ai_quantite CHECK (quantite >= 1 AND quantite <= 1000)
);

-- INSERT INTO avatar_item(avatar,item, quantite) VALUES (2,5, 55);

CREATE TABLE historique_abonnement(
	id 				SERIAL,
	joueur			INTEGER  				NOT NULL,
	date_debut		date 					NOT NULL DEFAULT CURRENT_DATE,
	date_fin 		date,								
	

	CONSTRAINT pk_historique_abonnement PRIMARY KEY (id)
);

-- INSERT INTO historique_abonnement(joueur) VALUES (2);

ALTER TABLE nom de la table
	ADD CONSTRAINT fk_blabla
		FOREIGN KEY (champ) REFERENCES (asdasdasd(sdsd))
















