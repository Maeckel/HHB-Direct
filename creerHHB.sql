drop database if exists hhb;
-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE hhb;

-- -----------------------------------------------------------------------------
--       TABLE : TYPE_COMPTE
-- -----------------------------------------------------------------------------

CREATE TABLE TYPE_COMPTE
   (
    ID_TYPE char(32) NOT NULL  ,
    DESIGNATION char(32) NULL  
,   CONSTRAINT PK_TYPE_COMPTE PRIMARY KEY (ID_TYPE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : OPERATION
-- -----------------------------------------------------------------------------

CREATE TABLE OPERATION
   (
    ID_OPERATION char(32) NOT NULL  ,
    ID_TYPEOPERATION char(32) NOT NULL  ,
    NUM_COMPTE char(32) NOT NULL  ,
    DATE char(32) NOT NULL  ,
    NUM_COMPTE_VERS char(32) NULL  ,
    MONTANT char(32) NULL  
,   CONSTRAINT PK_OPERATION PRIMARY KEY (ID_OPERATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : PROGRAMMATION
-- -----------------------------------------------------------------------------

CREATE TABLE PROGRAMMATION
   (
    ID_PROGRAMMATION char(32) NOT NULL  ,
    PERIODICITE char(32) NULL  
,   CONSTRAINT PK_PROGRAMMATION PRIMARY KEY (ID_PROGRAMMATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : DATE
-- -----------------------------------------------------------------------------

CREATE TABLE DATE
   (
    DATE char(32) NOT NULL  
,   CONSTRAINT PK_DATE PRIMARY KEY (DATE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : CONSEILLER
-- -----------------------------------------------------------------------------

CREATE TABLE CONSEILLER
   (
    ID_CONSEILLER char(32) NOT NULL  ,
    NOM_CONSEILLER char(32) NULL  ,
    PRENOM_CONSEILLER char(32) NULL  ,
    DATE_EMBAUCHE char(32) NULL  
,   CONSTRAINT PK_CONSEILLER PRIMARY KEY (ID_CONSEILLER)
   );

-- -----------------------------------------------------------------------------
--       TABLE : CLIENT
-- -----------------------------------------------------------------------------

CREATE TABLE CLIENT
   (
    NUM_CLIENT char(32) NOT NULL  ,
    NOM_CLIENT char(32) NULL  ,
    PRENOM_CLIENT char(32) NULL  ,
    ADRESSE_CLIENT char(32) NULL  ,
    IDENTIFIANT_INTERNET char(32) NULL  ,
    MDP_INTERNET char(32) NULL  
,   CONSTRAINT PK_CLIENT PRIMARY KEY (NUM_CLIENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : TYPE_OPERATION
-- -----------------------------------------------------------------------------

CREATE TABLE TYPE_OPERATION
   (
    ID_TYPEOPERATION char(32) NOT NULL  ,
    DESIGNATION char(32) NULL  
,   CONSTRAINT PK_TYPE_OPERATION PRIMARY KEY (ID_TYPEOPERATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : COMPTE
-- -----------------------------------------------------------------------------

CREATE TABLE COMPTE
   (
    NUM_COMPTE char(32) NOT NULL  ,
    DATE char(32) NULL  ,
    ID_TYPE char(32) NOT NULL  ,
    DATE_OUVRIR char(32) NOT NULL  ,
    SOLDE char(32) NULL  
,   CONSTRAINT PK_COMPTE PRIMARY KEY (NUM_COMPTE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : AGENCE
-- -----------------------------------------------------------------------------

CREATE TABLE AGENCE
   (
    NUM_AGENCE char(32) NOT NULL  ,
    NOM_AGENCE char(32) NULL  ,
    ADRESSE_AGENCE char(32) NULL  ,
    TEL_AGENCE char(32) NULL  
,   CONSTRAINT PK_AGENCE PRIMARY KEY (NUM_AGENCE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : APPELER
-- -----------------------------------------------------------------------------

CREATE TABLE APPELER
   (
    NUM_CLIENT char(32) NOT NULL  ,
    ID_CONSEILLER char(32) NOT NULL  ,
    DATE_HEURE char(32) NULL  ,
    TEMPS_COMMU char(32) NULL  
,   CONSTRAINT PK_APPELER PRIMARY KEY (NUM_CLIENT, ID_CONSEILLER)
   );

-- -----------------------------------------------------------------------------
--       TABLE : DEPENDRE
-- -----------------------------------------------------------------------------

CREATE TABLE DEPENDRE
   (
    NUM_AGENCE char(32) NOT NULL  ,
    NUM_CLIENT char(32) NOT NULL  
,   CONSTRAINT PK_DEPENDRE PRIMARY KEY (NUM_AGENCE, NUM_CLIENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : REMUNERER
-- -----------------------------------------------------------------------------

CREATE TABLE REMUNERER
   (
    DATE char(32) NOT NULL  ,
    DATE_DE char(32) NOT NULL  ,
    ID_TYPE char(32) NOT NULL  ,
    DATE_A char(32) NOT NULL  ,
    TAUX_INTERET char(32) NULL  
,   CONSTRAINT PK_REMUNERER PRIMARY KEY (DATE, DATE_DE, ID_TYPE, DATE_A)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ASSOCIER
-- -----------------------------------------------------------------------------

CREATE TABLE ASSOCIER
   (
    ID_OPERATION char(32) NOT NULL  ,
    ID_PROGRAMMATION char(32) NOT NULL  
,   CONSTRAINT PK_ASSOCIER PRIMARY KEY (ID_OPERATION, ID_PROGRAMMATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : POSSEDER
-- -----------------------------------------------------------------------------

CREATE TABLE POSSEDER
   (
    NUM_COMPTE char(32) NOT NULL  ,
    NUM_CLIENT char(32) NOT NULL  
,   CONSTRAINT PK_POSSEDER PRIMARY KEY (NUM_COMPTE, NUM_CLIENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : RATTACHER
-- -----------------------------------------------------------------------------

CREATE TABLE RATTACHER
   (
    NUM_AGENCE char(32) NOT NULL  ,
    DATE char(32) NOT NULL  
,   CONSTRAINT PK_RATTACHER PRIMARY KEY (NUM_AGENCE, DATE)
   );


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE OPERATION ADD 
     CONSTRAINT FK_OPERATION_TYPE_OPERATION
          FOREIGN KEY (ID_TYPEOPERATION)
               REFERENCES TYPE_OPERATION (ID_TYPEOPERATION);

ALTER TABLE OPERATION ADD 
     CONSTRAINT FK_OPERATION_COMPTE
          FOREIGN KEY (NUM_COMPTE)
               REFERENCES COMPTE (NUM_COMPTE);

ALTER TABLE OPERATION ADD 
     CONSTRAINT FK_OPERATION_DATE
          FOREIGN KEY (DATE)
               REFERENCES DATE (DATE);

ALTER TABLE OPERATION ADD 
     CONSTRAINT FK_OPERATION_COMPTE1
          FOREIGN KEY (NUM_COMPTE_VERS)
               REFERENCES COMPTE (NUM_COMPTE);

ALTER TABLE COMPTE ADD 
     CONSTRAINT FK_COMPTE_DATE
          FOREIGN KEY (DATE)
               REFERENCES DATE (DATE);

ALTER TABLE COMPTE ADD 
     CONSTRAINT FK_COMPTE_TYPE_COMPTE
          FOREIGN KEY (ID_TYPE)
               REFERENCES TYPE_COMPTE (ID_TYPE);

ALTER TABLE COMPTE ADD 
     CONSTRAINT FK_COMPTE_DATE1
          FOREIGN KEY (DATE_OUVRIR)
               REFERENCES DATE (DATE);

ALTER TABLE APPELER ADD 
     CONSTRAINT FK_APPELER_CLIENT
          FOREIGN KEY (NUM_CLIENT)
               REFERENCES CLIENT (NUM_CLIENT);

ALTER TABLE APPELER ADD 
     CONSTRAINT FK_APPELER_CONSEILLER
          FOREIGN KEY (ID_CONSEILLER)
               REFERENCES CONSEILLER (ID_CONSEILLER);

ALTER TABLE DEPENDRE ADD 
     CONSTRAINT FK_DEPENDRE_AGENCE
          FOREIGN KEY (NUM_AGENCE)
               REFERENCES AGENCE (NUM_AGENCE);

ALTER TABLE DEPENDRE ADD 
     CONSTRAINT FK_DEPENDRE_CLIENT
          FOREIGN KEY (NUM_CLIENT)
               REFERENCES CLIENT (NUM_CLIENT);

ALTER TABLE REMUNERER ADD 
     CONSTRAINT FK_REMUNERER_DATE
          FOREIGN KEY (DATE)
               REFERENCES DATE (DATE);

ALTER TABLE REMUNERER ADD 
     CONSTRAINT FK_REMUNERER_DATE1
          FOREIGN KEY (DATE_DE)
               REFERENCES DATE (DATE);

ALTER TABLE REMUNERER ADD 
     CONSTRAINT FK_REMUNERER_TYPE_COMPTE
          FOREIGN KEY (ID_TYPE)
               REFERENCES TYPE_COMPTE (ID_TYPE);

ALTER TABLE REMUNERER ADD 
     CONSTRAINT FK_REMUNERER_DATE2
          FOREIGN KEY (DATE_A)
               REFERENCES DATE (DATE);

ALTER TABLE ASSOCIER ADD 
     CONSTRAINT FK_ASSOCIER_OPERATION
          FOREIGN KEY (ID_OPERATION)
               REFERENCES OPERATION (ID_OPERATION);

ALTER TABLE ASSOCIER ADD 
     CONSTRAINT FK_ASSOCIER_PROGRAMMATION
          FOREIGN KEY (ID_PROGRAMMATION)
               REFERENCES PROGRAMMATION (ID_PROGRAMMATION);

ALTER TABLE POSSEDER ADD 
     CONSTRAINT FK_POSSEDER_COMPTE
          FOREIGN KEY (NUM_COMPTE)
               REFERENCES COMPTE (NUM_COMPTE);

ALTER TABLE POSSEDER ADD 
     CONSTRAINT FK_POSSEDER_CLIENT
          FOREIGN KEY (NUM_CLIENT)
               REFERENCES CLIENT (NUM_CLIENT);

ALTER TABLE RATTACHER ADD 
     CONSTRAINT FK_RATTACHER_AGENCE
          FOREIGN KEY (NUM_AGENCE)
               REFERENCES AGENCE (NUM_AGENCE);

ALTER TABLE RATTACHER ADD 
     CONSTRAINT FK_RATTACHER_DATE
          FOREIGN KEY (DATE)
               REFERENCES DATE (DATE);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------
