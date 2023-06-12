-- CRIAÇÃO DAS TABELAS

create table Produto(
	cod_prod integer PRIMARY KEY,
	descrição varchar(150) unique,
	qtde_disponivel int not null default 0
);
--INSERIR OS DADOS 

insert into Produto values(1,'feijão',30);
insert into Produto values(3,'macarrão',30);
insert into Produto values(2,'batata',30);


create table ItemVenda(
	cod_venda integer,
	id_produto integer,
	qtd_vendida integer,
	foreign key(id_produto) references produto(cod_prod) on delete cascade	
);

--DADOS DE VENDA
insert into ItemVenda values(2,1,5);
insert into ItemVenda values(2,1,15);

-- CRIAÇÃO DA TRIGGER
create trigger t_atualiza_estoque
-- ANTES DE INSERIR OS DADOS VERIFICA A TABELA ITEMVENDA
before insert on ItemVenda
for each row 
--EXECUTANDO O GATILHO
execute procedure atualizaEstoque();

-- CRIAÇÃO DA FUNÇÃO
create or replace function atualizaEstoque()  RETURNS TRIGGER
AS
$$
DECLARE 
--DECLARAÇÃO DOS ITENS
	 qtd integer;
BEGIN 
-- CONSULTANDO A TABELA ITENS PARA VERIFICAR A QUANTIDADE
	select qtde_disponivel from Produto where cod_prod = NEW.id_produto into qtd;
	-- CASO A QUANTIDADE ANTIGA  SEJÁ MENOR QUE A QUANTIDADE NOVA, CANCELAR A OPERAÇÃO
	if qtd < new.qtd_vendida then
		raise exception 'quantidade indisponivel';
	else
	-- CONTINUAR COM O PROCESSO DE ATUALIZAÇÃO DA TABELA 
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