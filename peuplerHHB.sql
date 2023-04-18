INSERT INTO agence VALUES( 1 , 'HHB-Paris' , '11 avenue du 24 Juin 1985' , 0744236891 );
INSERT INTO agence VALUES( 2 , 'HHB-Londres' , '07 avenue du 29 Juillet 1997' , 0741523769 );
INSERT INTO agence VALUES( 3 , 'HHB-New-York' , '12 avenue du 25 Mars 1889' , 0732546821);
INSERT INTO agence VALUES( 4 , 'HBB-Lyon' , '08 avenue du 30 Novembre 1745' , 0769825361 );

INSERT INTO type_operation VALUES( 1 , 'CREDIT' );
INSERT INTO type_operation VALUES( 2 , 'DEBIT' );
INSERT INTO type_operation VALUES( 3 , 'VIREMENT' );

INSERT INTO type_compte VALUES( 1 , 'Compte courant' );
INSERT INTO type_compte VALUES( 2 , 'Livret Epargne' );
INSERT INTO type_compte VALUES( 3 , 'Compte suppor pour Actions' );

INSERT INTO conseiller VALUES( 1 , 'GREEN' , 'Alexandre' , '2022-03-07' );
INSERT INTO conseiller VALUES( 2 , 'RUBIS' , 'Marie' , '2022-10-14' );
INSERT INTO conseiller VALUES( 3 , 'RED' , 'Rose' , '2022-05-21' );
INSERT INTO conseiller VALUES( 4 , 'BLUE' , 'Oceane' , '2023-01-28' );
INSERT INTO conseiller VALUES( 5 , 'YELLOW' , 'Maxime' , '2023-01-24' );

INSERT INTO programmation VALUES( 1 , '2023-12-25' );
INSERT INTO programmation VALUES( 2 , '2023-10-31' );

INSERT INTO client VALUES( 1 , 'LITTLE' , 'Alphonse' , 'Cahors8, rue des Charmes' , 'oppg5' , 'azerty' );
INSERT INTO client VALUES( 2 , 'ALEXANDRE' , 'David' , 'Lalbenque1, rue Petit' , 'gmhxd' , 'azerty' );
INSERT INTO client VALUES( 3 , 'RODRIGUEZ' , 'Sacha' , 'Montcuq, 1 rue Peranud' , 'ktp3s' , 'azerty' );
INSERT INTO client VALUES( 4 , 'IVANOVITCH' , 'Marwan' , 'Gramat, 22 rue des Ternes' , 'doyw1' , 'azerty' );
INSERT INTO client VALUES( 5 , 'BELCKACEM' , 'Louis' , 'Bessines, 11 allée des Cerises' , 'hrjfs' , 'azerty' );
INSERT INTO client VALUES( 6 , 'VESTRA' , 'Pascal' , 'Cahors, 1 Avenue gambetta' , 'fbunisset' , 'azerty' );
INSERT INTO client VALUES( 7 , 'ROCHARD' , 'Eric' , 'Montreuil, 10 rue des Perles' , 'dbunisset' , 'azerty' );
INSERT INTO client VALUES( 8 , 'RUFUS' , 'John' , 'Paris, 23 rue Manin' , 'bcacheux' , 'azerty' );
INSERT INTO client VALUES( 9 , 'TALLER' , 'Sam' , 'Paris, 114 rue Blanche' , 'vcottin' , 'azerty' );
INSERT INTO client VALUES( 10 , 'GOLD' , 'Luc' , 'Nantes, 134 allée des Joncs' , 'jdebelle' , 'azerty' );

INSERT INTO date VALUES('2023-01-01');
INSERT INTO date VALUES('2023-06-01');
INSERT INTO date VALUES('2023-01-05');
INSERT INTO date VALUES('2023-04-10');
INSERT INTO date VALUES('2023-07-15');
INSERT INTO date VALUES('2023-10-20');
INSERT INTO date VALUES('2023-12-25');
INSERT INTO date VALUES('2023-05-30');
INSERT INTO date VALUES('2023-02-12');
INSERT INTO date VALUES('2023-05-17');
INSERT INTO date VALUES('2023-08-22');
INSERT INTO date VALUES('2023-11-27');
INSERT INTO date VALUES('2023-12-30');
INSERT INTO date VALUES('2023-06-07');

INSERT INTO compte VALUES(1 , null , 1 , '2023-01-05' , 1000 );
INSERT INTO compte VALUES(2 , null , 2 , '2023-04-10' , 2000 );
INSERT INTO compte VALUES(3 , null , 3 , '2023-04-10' , 1500 );
INSERT INTO compte VALUES(4 , null , 2 , '2023-07-15' , 1500 );
INSERT INTO compte VALUES(5 , null , 3 , '2023-07-15' , 2000 );
INSERT INTO compte VALUES(6 , null , 1 , '2023-01-05' , 2000 );
INSERT INTO compte VALUES(7 , null , 2 , '2023-10-20' , 2000 );
INSERT INTO compte VALUES(8 , null , 1 , '2023-10-20' , 3000 );
INSERT INTO compte VALUES(9 , null , 3 , '2023-12-25' , 2500 );
INSERT INTO compte VALUES(10 , null , 3 , '2023-12-25' , 1000 );
INSERT INTO compte VALUES(11 , null , 1 , '2023-05-30' , 1500 );
INSERT INTO compte VALUES(12 , null , 2 , '2023-05-30' , 1500 );

INSERT INTO posseder VALUES( 1 , 2 );
INSERT INTO posseder VALUES( 2 , 4 );
INSERT INTO posseder VALUES( 3 , 6 );
INSERT INTO posseder VALUES( 4 , 8 );
INSERT INTO posseder VALUES( 5 , 10 );
INSERT INTO posseder VALUES( 6 , 1 );
INSERT INTO posseder VALUES( 7 , 3 );
INSERT INTO posseder VALUES( 8 , 5 );
INSERT INTO posseder VALUES( 9 , 7 );
INSERT INTO posseder VALUES( 10 , 9 );
INSERT INTO posseder VALUES( 11 , 5 );
INSERT INTO posseder VALUES( 12 , 2 );

INSERT INTO appeler VALUES( 1 , 2 , '2023-02-17 15:28:00' , '00:10:46' );
INSERT INTO appeler VALUES( 4 , 1 , '2023-02-17 15:28:00' , '00:10:46' );
INSERT INTO appeler VALUES( 7 , 2 , '2023-02-17 15:28:00' , '00:10:46' );
INSERT INTO appeler VALUES( 9 , 5 , '2023-02-17 15:28:00' , '00:10:46' );

INSERT INTO dependre VALUES( 2 , 1 , '2023-01-05' );
INSERT INTO dependre VALUES( 3 , 2 , '2023-01-05' );
INSERT INTO dependre VALUES( 4 , 3 , '2023-10-20' );
INSERT INTO dependre VALUES( 1 , 4 , '2023-04-10' );
INSERT INTO dependre VALUES( 2 , 5 , '2023-10-20' );
INSERT INTO dependre VALUES( 2 , 6 , '2023-04-10' );
INSERT INTO dependre VALUES( 3 , 7 , '2023-12-25' );
INSERT INTO dependre VALUES( 4 , 8 , '2023-07-15' );
INSERT INTO dependre VALUES( 3 , 9 , '2023-12-25' );
INSERT INTO dependre VALUES( 3 , 10 , '2023-07-15' );

INSERT INTO operation VALUES( 1 , 1 , 1 , '2023-02-12' , null , 500 );
INSERT INTO operation VALUES( 2 , 1 , 2 , '2023-05-17' , null , 500 );
INSERT INTO operation VALUES( 3 , 1 , 3 , '2023-05-17' , null , 500 );
INSERT INTO operation VALUES( 4 , 2 , 4 , '2023-08-22' , null , 800 );
INSERT INTO operation VALUES( 5 , 2 , 5 , '2023-08-22' , null , 400 );
INSERT INTO operation VALUES( 6 , 2 , 6 , '2023-02-12' , null , 300 );
INSERT INTO operation VALUES( 7 , 3 , 7 , '2023-11-27' , 3 , 100 );
INSERT INTO operation VALUES( 8 , 3 , 8 , '2023-11-27' , 4 , 150 );
INSERT INTO operation VALUES( 9 , 3, 9 , '2023-12-30' , 5 , 700 );
INSERT INTO operation VALUES( 10 , 3, 10 , '2023-12-30' , 2 , 500 );
INSERT INTO operation VALUES( 11 , 3, 11 , '2023-06-07' , 8 , 500 );
INSERT INTO operation VALUES( 12 , 1 , 12 , '2023-06-07' , null , 150 );
INSERT INTO operation VALUES( 13 , 1 , 3 , '2023-05-17' , null , 150 );
INSERT INTO operation VALUES( 14 , 2 , 6 , '2023-02-12' , null , 50 );
INSERT INTO operation VALUES( 15 , 2 , 9 , '2023-12-30' , null , 50 );

INSERT INTO associer VALUES( 7 , 1 );
INSERT INTO associer VALUES( 8 , 2 );

INSERT INTO remunerer VALUES( '2023-01-01' , 3 , '2023-06-01' , '2,5%' );







