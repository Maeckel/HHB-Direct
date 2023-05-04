--
-- PostgreSQL database dump
--

-- Started on 2012-11-27 12:09:40 CET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1859 (class 1262 OID 16514)
-- Name: hhbdirect; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hhb WITH TEMPLATE = template0 ENCODING = 'UTF8' ;


ALTER DATABASE hhb OWNER TO postgres;

\connect hhb

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 471 (class 2612 OID 24850)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 140 (class 1259 OID 16515)
-- Dependencies: 3
-- Name: affecter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--


-- -----------------------------------------------------------------------------
--       TABLE : TYPE_COMPTE
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE_COMPTE
   (
    ID_TYPE integer NOT NULL  ,
    DESIGNATION char(32) NULL  ,
   CONSTRAINT PK_TYPE_COMPTE PRIMARY KEY (ID_TYPE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : OPERATION
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS OPERATION
   (
    ID_OPERATION integer NOT NULL  ,
    ID_TYPEOPERATION integer NOT NULL  ,
    NUM_COMPTE integer NOT NULL  ,
    DATE_OPERATION pg_catalog.date NOT NULL  ,
    NUM_COMPTE_VERS integer NULL  ,
    MONTANT decimal(12,2) NULL  ,
    CONSTRAINT PK_OPERATION PRIMARY KEY (ID_OPERATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : PROGRAMMATION
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROGRAMMATION
   (
    ID_PROGRAMMATION INTEGER NOT NULL  ,
    PERIODICITE pg_catalog.date NULL  
,   CONSTRAINT PK_PROGRAMMATION PRIMARY KEY (ID_PROGRAMMATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : DATE
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DATE
   (
    DATE pg_catalog.date NOT NULL  
,   CONSTRAINT PK_DATE PRIMARY KEY (DATE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : CONSEILLER
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONSEILLER
   (
    ID_CONSEILLER integer NOT NULL  ,
    NOM_CONSEILLER char(32) NULL  ,
    PRENOM_CONSEILLER char(32) NULL  ,
    DATE_EMBAUCHE pg_catalog.date NULL  
,   CONSTRAINT PK_CONSEILLER PRIMARY KEY (ID_CONSEILLER)
   );

-- -----------------------------------------------------------------------------
--       TABLE : CLIENT
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
   (
    NUM_CLIENT integer NOT NULL  ,
    NOM_CLIENT char(32) NULL  ,
    PRENOM_CLIENT char(32) NULL  ,
    ADRESSE_CLIENT char(50) NULL  ,
    IDENTIFIANT_INTERNET char(32) NULL  ,
    MDP_INTERNET char(32) NULL  
,   CONSTRAINT PK_CLIENT PRIMARY KEY (NUM_CLIENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : TYPE_OPERATION
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE_OPERATION
   (
    ID_TYPEOPERATION integer NOT NULL  ,
    DESIGNATION char(32) NULL  
,   CONSTRAINT PK_TYPE_OPERATION PRIMARY KEY (ID_TYPEOPERATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : COMPTE
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMPTE
   (
    NUM_COMPTE integer NOT NULL  ,
    DATE pg_catalog.date NULL  ,
    ID_TYPE integer NOT NULL  ,
    DATE_OUVRIR pg_catalog.date NOT NULL  ,
    SOLDE decimal(12,2) NULL  
,   CONSTRAINT PK_COMPTE PRIMARY KEY (NUM_COMPTE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : AGENCE
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AGENCE
   (
    NUM_AGENCE integer NOT NULL  ,
    NOM_AGENCE char(32) NULL  ,
    ADRESSE_AGENCE char(50) NULL  ,
    TEL_AGENCE integer NULL  
,   CONSTRAINT PK_AGENCE PRIMARY KEY (NUM_AGENCE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : APPELER
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPELER
   (
    NUM_CLIENT integer NOT NULL  ,
    ID_CONSEILLER integer NOT NULL  ,
    DATE_HEURE timestamp NULL  ,
    TEMPS_COMMU time NULL  
,   CONSTRAINT PK_APPELER PRIMARY KEY (NUM_CLIENT, ID_CONSEILLER)
   );

-- -----------------------------------------------------------------------------
--       TABLE : DEPENDRE
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DEPENDRE
   (
    NUM_AGENCE integer NOT NULL  ,
    NUM_CLIENT integer NOT NULL  ,
    DATE pg_catalog.date NOT NULL ,   
    CONSTRAINT PK_DEPENDRE PRIMARY KEY (NUM_AGENCE, NUM_CLIENT , DATE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : REMUNERER
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REMUNERER
   (
    DATE_DE pg_catalog.date NOT NULL  ,
    ID_TYPE integer NOT NULL  ,
    DATE_A pg_catalog.date NOT NULL  ,
    TAUX_INTERET char(32) NULL  
,   CONSTRAINT PK_REMUNERER PRIMARY KEY (DATE_DE, ID_TYPE, DATE_A)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ASSOCIER
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ASSOCIER
   (
    ID_OPERATION integer NOT NULL  ,
    ID_PROGRAMMATION integer NOT NULL  
,   CONSTRAINT PK_ASSOCIER PRIMARY KEY (ID_OPERATION, ID_PROGRAMMATION)
   );

-- -----------------------------------------------------------------------------
--       TABLE : POSSEDER
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS POSSEDER
   (
    NUM_COMPTE integer NOT NULL  ,
    NUM_CLIENT integer NOT NULL  
,   CONSTRAINT PK_POSSEDER PRIMARY KEY (NUM_COMPTE, NUM_CLIENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : RATTACHER
-- -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RATTACHER
   (
    NUM_AGENCE integer NOT NULL ,
    DATE pg_catalog.date NOT NULL  
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
          FOREIGN KEY (DATE_OPERATION)
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

ALTER TABLE DEPENDRE ADD 
     CONSTRAINT FK_DEPENDRE_DATE
          FOREIGN KEY (DATE)
               REFERENCES DATE (DATE);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------
