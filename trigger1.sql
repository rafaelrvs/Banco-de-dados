select*
from cliente


update cliente  set nome = (select )
create sequence clienteseq start 1 increment 1;






create trigger cliente_auditoria 
after insert or update on cliente
for each row
execute procedure function_auditoria();



create or replace function function_auditoria()
RETURNS trigger AS 
$$
BEGIN
	 insert into log_cliente 
	 (codigo,data_alteracao)
	 values(new.codigo, current_date);
	 return new;
END;
$$	 
language 'plpgsql'


create table log_cliente(
	codigo integer not null,
	data_alteracao date not null
);

select*
from log_cliente
