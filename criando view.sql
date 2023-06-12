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





