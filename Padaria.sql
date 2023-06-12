create table Menu(
	id integer primary key,
	descricao varchar(150) not null,
	nome integer not null,
	valor numeric(11,2) not null,
	constraint fk_produtonome foreign key(nome) references produto(id)
);

create table produto(
	id integer primary key,
	nome varchar(150) not null
);
create table valores(
	id integer primary key,
	valor numeric(11,2) not null,
	nome_produto integer not null,
	constraint fk_produto_nome foreign key(nome_produto) references produto(id)
);
alter table valores alter column nome_produto drop not null


create table auditoria_padaria(
	codigo_pad integer,
	data_alteracao date not null
);




create trigger log_padaria
after insert or UPDATE ON produto
for each row
execute procedure auditoria_log_padaria();


create or replace function auditoria_log_padaria()
RETURNS trigger AS 
$$
BEGIN
insert into auditoria_padaria (codigo_pad, data_alteracao)
values
(NEW.codigo, current_date);
return NEW;
END;
$$ 	language 'plpgsql';


select*
from valores 

update produto set nome = 'batata'

insert into produto values (1,'pao')
insert into produto values (2,'queijo')
insert into produto values (3,'salame')



insert into valores values (01,2.50,1)
insert into valores values (02,5.50,2)
insert into valores values (03,10.50)


select*
from produto, valores
where produto.id = valores.id


create trigger 