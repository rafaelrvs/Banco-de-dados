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


insert into produto values (1,'pao')
insert into produto values (2,'queijo')
insert into valores values (01,2.50,1)
insert into valores values (02,5.50,2)



select*
from produto, valores
where produto.id = valores.id


create trigger 