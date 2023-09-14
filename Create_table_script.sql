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
	id					SERIAL					NOT NULL,
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
	id					SERIAL					NOT NULL,
	nom					VARCHAR(16)				NOT NULL,
	sigle				VARCHAR(6)				NOT NULL,
	description 		VARCHAR(2048),
	
	CONSTRAINT pk_jeu	PRIMARY KEY (id),
	CONSTRAINT uc_jeu_nom UNIQUE (nom),
	CONSTRAINT uc_jeu_sigle UNIQUE (sigle),
	CONSTRAINT cc_jeu_nom CHECK (LENGTH(nom) >= 3 AND nom ~ '^[a-zA-Z]'),
	CONSTRAINT cc_jeu_sigle CHECK (LENGTH(sigle) = 6 AND sigle ~ '^[a-zA-Z]')
);

--INSERT INTO jeu(nom, sigle, description) VALUES ('Julien', 'D12345', 'Allo ce monde');
