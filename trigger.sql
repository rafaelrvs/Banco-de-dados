--Tabela que irá disparar a trigger automaticamente
CREATE TABLE pessoa( 
 id numeric(11) NOT NULL, 
 nome varchar(100), 
 rg numeric(9) NOT NULL, 
 cpf numeric(13), 
 CONSTRAINT pessoa_pkey PRIMARY KEY (id), 
 CONSTRAINT uk_rg UNIQUE (rg), 
 CONSTRAINT uk_cpf UNIQUE (cpf) 
); 

--Tabela que receberá o ID e o NOME da tabela pessoa referente ao registro que disparou a trigger (delete e update)
CREATE SEQUENCE seq_log1; 
CREATE TABLE log1( 
 id integer default(nextval('seq_log1')), 
 id_pessoa numeric(11), 
 nome varchar(100), 
 data timestamp, 
 usuario text, 
 constraint pk_log1 primary key (id) 
); 
uy6
--Função de trigger a ser disparada sempre que um registro da tabela pessoa for atualizado
CREATE OR REPLACE FUNCTION func_log_atualiza() 
RETURNS trigger AS 
 '   
BEGIN 
 Insert into log1 (id_pessoa, nome, data, usuario) values (OLD.id, OLD.nome, now(), current_user); 
 RETURN NEW; --retronar o registro NEW sempre que se tratar de um evento insert ou update
END; 
'
Language 'plpgsql'; 

--Tigger que dispara a função func_log_atualiza
CREATE TRIGGER tg_log_atualiza BEFORE update ON pessoa 
 FOR EACH ROW EXECUTE PROCEDURE func_log_atualiza(); 


--Função de trigger a ser disparada sempre que um registro da tabela pessoa for excluído
CREATE OR REPLACE FUNCTION func_log_apaga() 
RETURNS trigger AS 
'   
BEGIN 
 Insert into log1 (id_pessoa, nome, data, usuario) values (OLD.id, OLD.nome, now(), current_user); 
 RETURN OLD; --retronar o registro NEW sempre que se tratar de um evento delete
END; 
'
Language 'plpgsql'; 

--Tigger que dispara a função func_log_apaga
CREATE TRIGGER tg_log_paga BEFORE delete ON pessoa 
 FOR EACH ROW EXECUTE PROCEDURE func_log_apaga(); 

 
SELECT * FROM PESSOA; 
select * from log1

INSERT INTO PESSOA VALUES (1,'ZE',1123,95762); 

UPDATE PESSOA SET NOME = 'JOSÉ' WHERE ID = 1; 

DELETE FROM PESSOA WHERE ID = 1;



--Tabela que receberá o ID e o NOME da tabela pessoa referente ao registro que disparou a trigger (insert)
CREATE SEQUENCE seq_log2; 
CREATE TABLE log2( 
 id integer default(nextval('seq_log2')), 
 id_pessoa numeric(11), 
 nome varchar(100), 
 data timestamp, 
 usuario text, 
 constraint pk_log2 primary key (id) 
); 

--Função de trigger a ser disparada sempre que um registro da tabela pessoa for inserido
CREATE OR REPLACE FUNCTION func_log2() 
RETURNS trigger AS 
' 
BEGIN 
 Insert into log2 (id_pessoa, nome, data, usuario) values (NEW.id, NEW.nome, now(), current_user); 
 RETURN NEW; --retronar o registro NEW sempre que se tratar de um evento insert ou update
END; 
' 
Language 'plpgsql';

--Tigger que dispara a função func_log2
CREATE TRIGGER func_log2 BEFORE insert ON pessoa 
 FOR EACH ROW EXECUTE PROCEDURE func_log2(); 
 
INSERT INTO PESSOA VALUES (3,'ZED',11323,154796);

select * from pessoa;
select * from log1;
select * from log2;



CREATE TABLE emp( 
 id integer, 
 nome_emp text, 
 salario numeric(10,2), 
 ultima_data timestamp, 
 ultimo_usuario text, 
 constraint pk_emp primary key (id) 
); 

select * from emp

CREATE OR REPLACE FUNCTION emp_carimbo() 
RETURNS trigger AS 
'
BEGIN 
     --Verifica se o nome do empregado foi fornecido 
     IF NEW.nome_emp IS NULL THEN 
        RAISE EXCEPTION ''O nome do empregado não pode ser nulo''; 
     END IF; 
    --Verifica se o salário foi fornecido 
    IF NEW.salario IS NULL THEN 
        RAISE EXCEPTION ''% não pode ter um salário nulo'', NEW.nome_emp; 
    END IF; 
     --Verifica se o salário é negativo 
     IF NEW.salario < 0 THEN 
         RAISE EXCEPTION ''% não pode ter um salário negativo'', NEW.nome_emp; 
    END IF; 
    --Registrar quem alterou o pagamento e quando 
    NEW.ultima_data := ''now''; 
    NEW.ultimo_usuario := current_user; 
RETURN NEW; 
END; 
' 
Language 'plpgsql'; 

CREATE TRIGGER emp_carimbo BEFORE insert or update ON emp 
 FOR EACH ROW EXECUTE PROCEDURE emp_carimbo(); 
 
INSERT INTO EMP (id,nome_emp,salario) VALUES (1,'BRUNO',-10); 
INSERT INTO EMP (id,nome_emp,salario) VALUES (1,'BRUNO',10000) 