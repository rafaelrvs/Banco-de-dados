create view cliente_seguro as 
select*
from carro

select *
from cliente_seguro


create view cliente_apolice  as
select*
from apolice

create view cliente_apolice_aci as
select *
from acidente

select c.local, c.hora
from cliente_apolice_aci c
where c.local ilike 'rua branca'


select c.registro, c.marca, c.modelo, c.cor
from carro c
where c.registro =10

select c.registro, c.marca, c.modelo, c.cor
from carro c
where c.registro =10

--4. Escreva o comando SQL que exiba o número de cada apólice, o nome do cliente e a 
--marca do veículo segurado, das apólices com início no mês de abril de 2023. O resultado deve 
--estar ordenado em ordem crescente pelo nome do cliente. 

select c.nome, a.numero, a.data_inicio
from apolice a, cliente c
where c.numero = a.numero and a.data_inicio between '2023-04-01 ' and '2023-04-30' 





