create database mvestetica;
use mvestetica;
create table clientes (
idcliente int unsigned not null auto_increment,
nome varchar(45) not null,
sexo enum ('f','m'),
cidade varchar(45) not null,
telefone int unsigned not null,
email varchar(55) not null,
primary key (idcliente)
);
create table veiculos (
idveiculos int unsigned not null auto_increment,
idcliente int unsigned not null,
marca varchar(15) not null,
modelo varchar(15) not null,
ano date not null,
cor varchar(15) not null,
placa varchar(10) not null,
primary key (idveiculos),
observacoes varchar(155),
foreign key (idcliente) references clientes(idcliente)
);
create table servicos (
idservico int unsigned not null auto_increment,
idveiculos int unsigned not null,
descricao varchar(255) not null,
valor float,
tempo time,
datadeservico date,
primary key (idservico),
foreign key (idveiculos) references veiculos(idveiculos)
);
create table agendamentos (
idagendamento int unsigned not null auto_increment,
dataehora datetime,
idcliente int unsigned not null,
idveiculos int unsigned not null,
idservico int unsigned not null,
situacaoagendamento varchar(45) not null,
observacao varchar(155),
primary key (idagendamento),
foreign key (idcliente) references clientes(idcliente),
foreign key (idveiculos) references veiculos(idveiculos),
foreign key (idservico) references servicos(idservico)
);
create table pagamentos (
idpagamento int unsigned not null auto_increment,
idagendamento int unsigned not null,
valortotal double,
dataehorapag datetime,
metodopag varchar(45) not null,
detalhespag varchar(155),
statuspag varchar(25),
primary key (idpagamento),
foreign key (idagendamento) references agendamentos(idagendamento)
);
create table funcionarios (
idfuncionarios int unsigned not null auto_increment,
nome varchar(45) not null,
cargo varchar(45) not null,
endereco varchar(45) not null,
telefone int,
email varchar(45),
datadeadmissao date,
salario float,
primary key (idfuncionarios)
);
create table recompensas (
idrecompensa int unsigned not null auto_increment,
idcliente int unsigned not null,
qntdeservico int,
datarecompensa date,
descricaorec varchar(45) not null,
primary key (idrecompensa),
foreign key (idcliente) references clientes(idcliente)
);
describe clientes;
select * from clientes;
insert into clientes (idcliente,nome,sexo,cidade,telefone,email)
values ('29','adriana','f','sobradinho','993667782','adri@email.com');

describe veiculos;
alter table funcionarios modify salario double;
insert into veiculos (idveiculos,idcliente,marca,modelo,ano,cor,placa,observacoes)
values ('30','30','Chevrolet','Omega','1995','Vinho','VOD6593','lateral esquerda com amassados');
select * from veiculos;
select * from servicos;
insert into servicos (idservico,idveiculos,descricao,valor,tempo,datadeservico)
values ('30','30','martelinho de ouro, pintura',
'850','72:00:00','2024-03-15');
select * from agendamentos;
select * from servicos;
select * from recompensas;
insert into agendamentos (idagendamento,dataehora,idcliente,idveiculos,idservico,situacaoagendamento,observacao)
values ('30','2024-03-15, 11','30','30','30','Finalizado','Pagamento recebido');
select * from funcionarios;
insert into recompensas (idrecompensa,idcliente,qntdeservico,datarecompensa,descricaorec)
values ('30','30','1','2024-12-30','faltam 4 servicos para obter uma recompensa.');
insert into funcionarios (idfuncionarios,nome,cargo,endereco,telefone,email,datadeadmissao,salario)
values ('30','nathalia','Gerente','Aguas claras','998746768','nath@email.com','2024-01-01','4000');
insert into pagamentos (idpagamento,idagendamento,valortotal,metodopag,statuspag)
values ('30','30','850','Pix','aprovado');
alter table pagamentos drop detalhespag;
select * from pagamentos;
