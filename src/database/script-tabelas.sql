-- CRIAÇÃO DE TABELAS NA AZURE

create table Shopping(
	idShopping int primary key identity(1,1),
	nome varchar(45),
	endereco varchar(45),
	cnpj char(14)
);

create table Usuario(
	idUsuario int primary key identity(1,1),
	logon varchar(45),
	senha varchar(45),
	cpf char(11),
	telefone char(11),
	tipo char(1),
	fkGestor int,
	foreign key (fkGestor) references Usuario(idUsuario),
	fkShopping int,
	foreign key (fkShopping) references Shopping(idShopping)
);

create table Setor(
	idSetor int primary key identity(1,1),
	nome varchar(45),
	fkShopping int,
	foreign key (fkShopping) references Shopping(idShopping)
);

create table Sensor(
	idSensor int primary key identity(1,1),
	modelo varchar(45),
	fkSetor int,
	foreign key (fkSetor) references Setor(idSetor)
);

create table Registro(
	idRegistro int primary key identity(1,1),
	medida int,
	dataHoraRgt datetime,
	fkSensor int,
	foreign key (fkSensor) references Sensor(idSensor)
);

-- CRIAÇÃO DE TABELAS NO MYSQL WORKBENCH

create table Shopping(
	cnpj char(14) primary key,
	nome varchar(45),
	endereco varchar(45)
);

create table Usuario(
	idUsuario int primary key auto_increment,
    nome varchar(45),
	logon varchar(45),
	senha varchar(45),
	cpf char(11),
	telefone char(11),
	tipo char(1),
	fkGestor int,
	foreign key (fkGestor) references Usuario(idUsuario),
	fkShopping char(14),
	foreign key (fkShopping) references Shopping(cnpj)
);

create table Setor(
	idSetor int primary key auto_increment,
	nome varchar(45),
	fkShopping char(14),
	foreign key (fkShopping) references Shopping(cnpj)
);

create table Sensor(
	idSensor int primary key auto_increment,
	modelo varchar(45),
	fkSetor int,
	foreign key (fkSetor) references Setor(idSetor)
);

create table Registro(
	idRegistro int primary key auto_increment,
	medida int,
	dataHoraRgt datetime,
	fkSensor int,
	foreign key (fkSensor) references Sensor(idSensor)
);