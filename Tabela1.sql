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

