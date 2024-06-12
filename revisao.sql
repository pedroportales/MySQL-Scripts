/*
by Pedro Portales
*/

create database revisao;
use revisao;

create table produtos (
	produto_id int not null auto_increment primary key,
    nome varchar(70) not null,
    descricao text,
    preco decimal(10.2),
    quantidade int not null
);

create table clientes (
	cliente_id int not null auto_increment primary key,
    nome varchar(70) not null,
    endereco varchar(100) not null,
    telefone varchar(20) not null
);

create table vendas (
	venda_id int auto_increment primary key,
    data_venda date,
    produto_id int, 
    cliente_id int,
    quantidade int,
    foreign key (produto_id) references produtos(produto_id),
    foreign key (cliente_id) references clientes(cliente_id)
);

INSERT INTO produtos (nome, descricao, preco, quantidade) VALUES
	('Camisa X', 'Camisa manga curta em algodão.', 25.9, 10),
    ('Calça Jeans', 'Calça jeans reta azul.', 49.9, 15),
    ('Tênis Esportivo', 'Tênis leve para corrida.', 89.9, 5),
    ('Smartphone', 'Smartphone Android com tela de 6 polegadas.', 1299, 3),
    ('Notebook', 'Notebook i5 com 8GB de RAM e 256GB de SSD.', 3999, 2);

INSERT INTO clientes (nome, endereco, telefone) VALUES
	('João Silva', 'Rua das Flores, 123', '(11) 9999-8888'),
	('Maria Oliveira', 'Avenida Paulista, 456', '(12) 3333-7777'),
	('Pedro Souza', 'Rua Tiradentes, 789', '(13) 4444-6666');

select * from produtos;

select * from produtos where preco > 50;

select nome,preco from produtos;

select count(*) from produtos where produto_id = ?;

insert into vendas (data_venda, produto_id, cliente_id, quantidade) values ('2022-05-28', 1, 1, 1);

insert into vendas (data_venda, produto_id, cliente_id, quantidade) values ('2022-05-28', 1, 2, 1);

select * from vendas where cliente_id = 1;

update produtos set quantidade = quantidade - 1 where produto_id = 1;

delete from vendas where venda_id = 2;

select p.nome, sum(v.quantidade) as total_vendido
from produtos p
inner join vendas v on v.produto_id = p.produto_id
group by p.produto_id
order by total_vendido desc
limit 1;

select c.nome, sum(p.preco * v.quantidade) as total_gasto
from ((clientes c
inner join vendas v on v.cliente_id = c.cliente_id)
inner join produtos p on v.produto_id = p.produto_id)
group by c.cliente_id
order by total_gasto desc
limit 1;

select avg(p.preco * v.quantidade) as media_venda_dia
from vendas v
inner join produtos p on v.produto_id = p.produto_id
group by data_venda;


select * from produtos where quantidade < 5;

update produtos set preco = preco * 1.10;

select extract(month from data_venda) as mes,
	extract(year from data_venda) as ano,
	sum(p.preco * v.quantidade) as total_vendas
from vendas v
inner join produtos p on v.produto_id = p.produto_id
group by mes, ano
order by ano,mes;

DELETE p FROM produtos p WHERE (SELECT 1 FROM vendas v WHERE v.produto_id = p.produto_id
    AND v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH));
    
select *
from clientes
where not exists (
  select 1
  from vendas
  where cliente_id = clientes.cliente_id
);

INSERT INTO vendas (data_venda, produto_id, cliente_id, quantidade)
VALUES (?, ?, ?, - ?);

UPDATE produtos
SET quantidade = quantidade + ?
WHERE produto_id = ?;

select
  v.venda_id,
  p.nome as produto,
  c.nome as cliente,
  v.data_venda,
  v.quantidade,
  p.preco * v.quantidade as valor_total
from vendas v
inner join produtos p on v.produto_id = p.produto_id
inner join clientes c on v.cliente_id = c.cliente_id;
