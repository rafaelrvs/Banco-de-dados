create table Produto(
	cod_prod integer PRIMARY KEY,
	descrição varchar(150) unique,
	qtde_disponivel int not null default 0
);

insert into Produto values(1,'feijão',30);
insert into Produto values(3,'macarrão',30);
insert into Produto values(2,'batata',30);




create table ItemVenda(
	cod_venda integer,
	id_produto integer,
	qtd_vendida integer,
	foreign key(id_produto) references produto(cod_prod) on delete cascade	
);


insert into ItemVenda values(2,1,5);

create trigger t_atualiza_estoque
before insert on ItemVenda
for each row 
execute procedure atualizaEstoque();

create or replace function atualizaEstoque()  RETURNS TRIGGER
AS
$$
DECLARE 
	 qtd integer;
BEGIN 
	select qtde_disponivel from Produto where cod_prod = NEW.id_produto into qtd;
	if qtd < new.qtd_vendida then
		raise exception 'quantidade indisponivel';
	else
		update Produto set qtde_disponivel = qtde_disponivel - new.qtd_vendida
		where cod_prod = new.id_produto ;
		end if;
		Return new;

END
$$
LANGUAGE plpgsql;

select*
from Produto
where