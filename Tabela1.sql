create table cliente(
	numero integer,
	nome varchar (100) not null,
	endereco varchar (200) not null,
	constraint pk_cli primary key (numero)
);

create table carro(
	registro integer,
	marca  varchar(150) not null,
	modelo  varchar(150) not null,
	cor varchar(150) not null,
	constraint pk_carro primary key (registro)
	
);
create table apolice (
	numero integer,
	valor numeric(10,2) not null check (valor>0),
	data_inicio date not null,
	data_fim date not null,
	num_cliente integer not null,
	reg_carro integer not null,
	constraint pk_apolice primary key (numero),
	constraint pk_apolice_cli foreign key(num_cliente) references cliente(numero),
	constraint fk_apolice_car foreign key (reg_carro)references carro(registro)
);

create table acidente(
	codigo integer,
	data date not null check (data >=now()),
	hora time not null,
	local varchar (200) not null,
	constraint pk_acidente primary key (codigo)
);
	create table apolice_acidente(
	num_apolice integer, 
	cod_acidente integer,
	constraint pk_ap_acidente primary key (num_apolice,cod_acidente),
	constraint fk_ac_apolice foreign key(num_apolice) references apolice(numero),
	constraint fk_aci_acidente foreign key(cod_acidente) references acidente(codigo)
	
);

insert into cliente values (1,'Maria','Rua A'); 
insert into cliente values (2,'Ricardo','Rua B'); 
insert into cliente values (3,'Lucas','Rua C'); 
insert into cliente values (4,'Vanessa','Rua D'); 
insert into cliente values (5,'Aline','Rua E'); 

insert into carro values (10,'Fiat','Uno','Vermelho'); 
insert into carro values (20,'Fiat','Strada','Prata'); 
insert into carro values (30,'Honda','Civic','Cinza'); 
insert into carro values (40,'Honda','Fit','Branco'); 
insert into carro values (50,'Hyundai','HB20','Grafite');


insert into apolice 
 values (1,5000.00,'2023-01-10','2024-01-09',1,50); 
insert into apolice 
 values (2,2500.00,'2023-04-10','2024-04-09',2,20); 
insert into apolice 
 values (3,8750.00,'2023-02-21','2024-02-20',2,30); 
insert into apolice 
 values (4,15789.00,'2023-03-18','2024-03-17',4,10); 
insert into apolice 
 values (5,4580.00,'2023-04-23','2024-04-22',3,50); 
insert into acidente 
 values (100,'2023-05-01','10:32:00','Rua Azul'); 
insert into acidente 
 values (200,'2023-04-20','08:30:00','Rua Branca'); 
insert into acidente 
 values (300,'2023-04-11','11:12:00','Rua Rosa'); 
insert into acidente 
 values (400,'2023-05-17','15:00:00','Rua Verde'); 
insert into acidente 
 values (500,'2023-04-25','10:02:00','Rua Amarela'); 



