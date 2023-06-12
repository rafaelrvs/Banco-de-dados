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



