-- ----------------------------------------------
-- Nom de la base de donnees : image          --
-- SGBD : MySql                               --
-- Date de creation : 01/12/21                --
-- Auteurs : Redwane ZAGHOUINI                --
------------------------------------------------

-- Pour l'incrémentation d'image nous nous somme aidé de ce site ( https://beaussier.developpez.com/articles/php/mysql/blob/#LIII-A )

drop database if exists image;
create database image;
use image;

DROP TABLE IF EXISTS Professeur ;         -- [TABLE n°1]
DROP TABLE IF EXISTS Matière ;            -- [TABLE n°2]
DROP TABLE IF EXISTS Elèves ;             -- [TABLE n°3]
DROP TABLE IF EXISTS Salle ;			  -- [TABLE n°4]
DROP TABLE IF EXISTS Créneaux ;			  -- [TABLE n°5]

-- ----------------------------------------------------------------------------------------------------

-- Création de la structure de la table Professeur [TABLE n°1]

CREATE TABLE Professeur 
(
    Id_prof INT NOT NULL AUTO_INCREMENT ,
    Prenom VARCHAR( 50 ) NOT NULL ,
    Nom VARCHAR( 50 ) NOT NULL ,
    PRIMARY KEY ( Id_prof )
);

-- Contenu de notre table Professeur [TABLE n°1]

insert into Professeur values (15662,'Helen', 'KASSEL');
insert into Professeur values (86425,'Brice', 'JUANICO');
insert into Professeur values (76489,'Boris', 'VELIKSON');
insert into Professeur values (10576,'Asma', 'GABIS');
insert into Professeur values (06583,'Michel', 'LANDSCHOOT');

-- ----------------------------------------------------------------------------------------------------

-- Création de la structure de la table Matière [TABLE n°2]

CREATE TABLE Matière (
   Code_matière varchar(10) NOT NULL,
   Prénom_professeur decimal(2,0),
   Id_prof INT(5) not null,
   Nom_matière varchar(30),
   PRIMARY KEY (Code_matière, Id_prof)
)Engine='InnoDB';


--  Contenu de notre table Matière [TABLE n°2]

INSERT INTO Matière VALUES( 'TI500','Brice',86425,'Recherche Operationnel');
INSERT INTO Matière VALUES( 'TI450','Brice',86425,'Automate');
INSERT INTO Matière VALUES( 'TI320','Boris',76489,'automate');
INSERT INTO Matière VALUES( 'TI620','Boris',76489,'Graphe');
INSERT INTO Matière VALUES( 'TI280','Helen',15662,'Graphe');
INSERT INTO Matière VALUES( 'TI150','Asma',10576,'POO');
INSERT INTO Matière VALUES( 'TI070','Michel',06583,'POO');


-- ----------------------------------------------------------------------------------------------------

-- Création de la structure de la table Elèves [TABLE n°3]

CREATE TABLE Elèves 
(
-- Id (clef primaire)
-- prénom
-- nom 
-- classe
-- y'a riendudant

    Id_élève INT NOT NULL AUTO_INCREMENT ,
    Prenom VARCHAR( 50 ) NOT NULL ,
    Nom VARCHAR( 50 ) NOT NULL ,
    Classe VARCHAR( 50 ) NOT NULL ,
    PRIMARY KEY (Id_élève)
);

-- Contenu de notre table Elèves [TABLE n°3]

insert into Elèves values (202111,'Redwane', 'ZAGHOUINI',"L3-B");
insert into Elèves values (202154,'Pierre', 'BENJAMIN',"L3-A");
insert into Elèves values (202115,'Omar', 'CHABBAT',"L3-A");
insert into Elèves values (202165,'Valery', 'WAH NDAM NJAYA',"L3-C");
insert into Elèves values (202189,'Hicham', 'HARBI',"L3-C");

-- ----------------------------------------------------------------------------------------------------

-- Création de la structure de la table Salle [TABLE n°4]

CREATE TABLE Salle 
(
    No_salle Varchar(20) DEFAULT '0' NOT NULL,
    Capacite int(4) not null,
    PRIMARY KEY (No_salle)
);

-- Contenu de notre table Salle [TABLE n°4]

insert into Salle values ('B110','30');
insert into Salle values ('C001','170');
insert into Salle values ('B010','25');
insert into Salle values ('E001','150');
insert into Salle values ('A410','25');

-- ----------------------------------------------------------------------------------------------------

-- Création de la structure de la table Créneaux [TABLE n°5]

CREATE TABLE Créneaux 
(
	No_créneaux decimal(2,0) DEFAULT '0' NOT NULL,
    No_salle decimal(2,0) DEFAULT '0' NOT NULL,
	Heure_debut decimal(4,2),
	Heure_fin decimal(4,2),
    Date_cours Date not null,
	Code_matière decimal(10,0) DEFAULT '0' NOT NULL,
	PRIMARY KEY ( No_salle, No_créneaux)
);

-- Contenu de notre table Créneaux [TABLE n°5]

insert into Créneaux values ('1','B010', '8.00', '10.20', '01/12/21','TI450');
insert into Créneaux values ('2','B010','10.20', '12.50','01/12/21','TI500');
insert into Créneaux values ('1','C001', '14.00', '16.20', '01/12/21','TI320');
insert into Créneaux values ('1','E001', '8.00', '10.20', '02/12/21','TI070');
insert into Créneaux values ('1','B110', '8.00', '11.40', '03/12/21','TI150');
insert into Créneaux values ('1','A410', '10.20', '13.50', '04/12/21','TI280');


COMMIT;