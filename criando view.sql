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
order by c.nome asc

-- 5. Escreva o comando SQL que exiba data, horário e local, dos acidentes envolvendo o 
-- HB20 grafite. A lista deverá estar ordenada pela data e horário do acidente

select   c.modelo, c.cor, a.data , a.hora, a.local 
from carro c, acidente a 
where a.codigo = a.codigo and c.registro = c.registro  and c.modelo ilike 'hb20' and c.cor ilike 'grafite'
order by  a.data asc

select* from acidente

--6. Escreva o comando SQL que exiba a marca do veículo, o nome do cliente e o número 
--das apólices de todos os acidentes ocorridos no mês de maio de 2023

select carro.marca, cliente.nome, apolice.numero
from carro, acidente,cliente,apolice
where acidente.data between '2023-05-01' and '2023-05-30' and carro.registro = cliente.numero  and apolice.numero = acidente.codigo