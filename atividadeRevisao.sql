/*
by Pedro Portales
*/

/* Questão 01
Carro:
	Ano
	Cor
    Marca
    Modelo
    VelocidadeMax
    
Computador:
	Processador
    Memória
    Armazenamento
    Placa-mãe
    Fonte

Pessoa:
	Nome
    Idade
    Altura
    Peso
    CPF

Livro:
	Nome
    Autor
    Gênero
    Preço
    Editora

Música:
	Nome
    Álbum
    Intérprete
    Compositor
    Letrista
*/

/* Questão 3
Texto 1
---------------------------------------------------------
Entidade	|	Atributos
---------------------------------------------------------
Motorista	|	Nome, Endereço, CPF
Veículo		|	Ano, Modelo, Placa, Acidente (Sim/Não)
Acidente	|	Data, Valor do Reparo, Motorista (ID)
---------------------------------------------------------

Texto 2
---------------------------------------------------------
Entidade	|	Atributos
---------------------------------------------------------
Paciente	|	ID, Nome
Médico		|	ID, Nome
Exame		|	ID, Data, Paciente (ID), Médico (ID)
---------------------------------------------------------

Texto 3
---------------------------------------------------------
Entidade		|	Atributos
---------------------------------------------------------
Cliente			|	Nome, CPF, Endereço, Cidade
Conta Bancária	|	Número, Saldo, Cliente (ID)
---------------------------------------------------------
*/

-- Questão 03 - Consulta

create database atividadeRevisao;
use atividadeRevisao;

create table empregado (
	codigoEmpregado int not null,
    nomeEmpregado varchar(100) not null,
    salario int not null,
    nomeDepartamento varchar(100) not null,
    sexo varchar(1)
);

insert into empregado (codigoEmpregado, nomeEmpregado, salario, nomeDepartamento, sexo) values
	(001, "João", 800, "Informática", "M"),
    (003, "Carlos", 1300, "Contabilidade", "M"),
    (004, "Natália", 950, "Pessoal", "F"),
    (007, "Gerson", 1200, "Informática", "M"),
    (010, "Patrícia", 2000, "Pessoal", "F");
    
select codigoEmpregado, nomeEmpregado 
from empregado
where nomeDepartamento = "Informática";

select nomeEmpregado, salario
from empregado
where sexo = "F";

select codigoEmpregado, nomeDepartamento
from empregado
where salario > 1250;

create table aviao (
	codigoAviao int not null,
    tipoAviao varchar(50) not null,
    capacidade int not null,
    horasVoadas int not null,
    fabricante varchar(50) not null
);

insert into aviao (codigoAviao, tipoAviao, capacidade, horasVoadas, fabricante) values
	(001, "Boeing 747", 200, 3000, "Voe Alto"),
    (002, "Fokker", 250, 2500, "Nas Nuvens"),
    (005, "Jato", 30, 3800, "Asa Delta"),
    (008, "Boeing 767", 180, 2300, "Nas Nuvens");
    
select tipoAviao as nome, capacidade
from aviao
where horasVoadas > 2750;

select codigoAviao, tipoAviao, capacidade, horasVoadas
from aviao
where fabricante = "Nas Nuvens";

select codigoAviao, tipoAviao, fabricante
from aviao
where capacidade < 200;

select count(*) as "número de aviões"
from aviao
where capacidade > 150 and horasVoadas < 2750;

create table cachorro (
	raca varchar(50) not null,
    nome varchar(50) not null,
    sexo varchar(1),
    peso decimal not null,
    idade decimal not null
);

insert into cachorro (raca, nome, sexo, peso, idade) values
	("Collie", "Fofinho", "M", 10.0, 2.0),
    ("Poodle", "Xuxa", "F", 3.0, 1),
    ("Poodle", "Zeze", "M", 4.5, 0.7),
    ("Yorkshire", "Sasha", "F", 3.5, 0.5),
    ("Yorkshire", "Pat", "F", 3, 2.5),
    ("Doberman", "Feroz", "M", 15, 3);
    
select nome, peso
from cachorro
where raca = "Poodle";

select nome, sexo, peso
from cachorro
where idade > 1;

select raca, idade
from cachorro
where peso < 4;

select peso, idade
from cachorro
where sexo = "M";

select count(*)
from cachorro
where raca = "Yorkshire" or raca = "Poodle" and sexo = "F" and idade >= 1;

/*
Questão 4

O resultado será a seleção dos seguintes registros

ID_Tarefa = 1
ID_Tarefa = 5
*/
