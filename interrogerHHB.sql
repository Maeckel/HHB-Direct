--Requete N°1--

select distinct nom_client , prenom_client , compte.num_compte , solde
from client inner join posseder 
on posseder.num_client = client.num_client
inner join compte 
on compte.num_compte = posseder.num_compte ;

--Requete N°2--

select distinct nom_client , prenom_client , compte.num_compte , solde , designation
from client inner join posseder 
on posseder.num_client = client.num_client
inner join compte 
on compte.num_compte = posseder.num_compte 
inner join type_compte 
on type_compte.id_type = compte.id_type
where designation != 'Livret Epargne';

--Requete N°3--

select distinct nom_client , prenom_client , count(id_operation)
from client inner join posseder 
on posseder.num_client = client.num_client
inner join compte 
on compte.num_compte = posseder.num_compte 
inner join operation 
on operation.num_compte = compte.num_compte
where date_operation::text like '2020-07-%'
group by client.num_client;

--Requete N°4--

select distinct nom_client , prenom_client , designation , solde
from client inner join posseder 
on posseder.num_client = client.num_client
inner join compte 
on compte.num_compte = posseder.num_compte 
inner join type_compte 
on type_compte.id_type = compte.id_type
where solde > 20000 ;

