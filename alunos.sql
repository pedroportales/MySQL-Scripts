/*
by Pedro Portales
*/

create database alunoSenai;
use alunoSenai;

create table cursos (
	id_curso int not null auto_increment primary key,
    nome varchar(50) not null
);

create table alunos (
	matricula int unsigned not null ,
	nome varchar(50) not null,
    idade int not null,
    id_cursofk int not null,
    foreign key (id_cursofk) references cursos(id_curso),
    primary key(matricula)
);

insert into cursos (nome) values ("Desenvolvimento de Sistemas");
insert into cursos (nome) values ("Multimídia");

-- 1 - Insira um novo aluno na tabela de alunos com as seguintes informações: nome, idade, curso e matrícula.
insert into alunos (matricula, nome, idade, id_cursofk) values 
	(020760178, "Pedro Joaquim", 17, 1),
	(020760179, "Renan Cardoso", 17, 1),
    (020760180, "Aléxia Santos", 17, 2),
    (020760181, "Ana Carolina", 19, 2),
    (020760182, "Pelé", 18, 1),
    (020760183, "Ryan Santos", 17, 1),
    (020760184, "Neymar Júnior", 22, 2),
    (020760185, "Cristiano Ronaldo", 21, 1),
    (020760186, "João Victor", 19,2),
    (020760187, "Ícaro Silva", 16, 1);

-- 2- Remova um aluno específico da tabela de alunos com base no seu número de matrícula.
delete from alunos where matricula = 020760178;

-- 3- Atualize a idade de um aluno específico na tabela de alunos.
update alunos
set idade = 21
where matricula = 020760179;

-- 4- Suponha que você tenha feito várias operações de inserção e atualização na tabela de alunos. Execute um comando SQL para confirmar essas alterações definitivamente.
commit;

-- 5- Após executar um comando de atualização na tabela de alunos, percebe-se que ocorreu um erro. Reverta as alterações feitas e volte ao estado anterior utilizando o comando adequado.
rollback;

-- 6- Selecione todos os alunos da tabela de alunos e exiba seus nomes e idades.
select nome, idade from alunos;

-- 7- Selecione os alunos da tabela de alunos que tenham mais de 20 anos.
select * from alunos where idade > 20;

-- 8- Selecione os alunos da tabela de alunos juntamente com seus cursos correspondentes da tabela de cursos.
select alunos.matricula, alunos.nome, alunos.idade, cursos.nome from alunos
inner join cursos on alunos.id_cursofk = cursos.id_curso;

-- 9- Selecione todos os alunos da tabela de alunos e ordene-os em ordem alfabética de acordo com seus nomes.
select alunos.matricula, alunos.nome, alunos.idade, cursos.nome from alunos
inner join cursos on alunos.id_cursofk = cursos.id_curso
order by alunos.nome;

-- 10- Conte quantos alunos existem em cada curso e exiba o resultado.
select cursos.nome, count(*) as total_alunos
from alunos
inner join cursos on alunos.id_cursofk = cursos.id_curso
group by cursos.nome;
