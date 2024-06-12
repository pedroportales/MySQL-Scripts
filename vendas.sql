/*
by Pedro Portales
*/

create database vendas;
use vendas;

create table produto (
	codigo_produto int not null auto_increment primary key,
    descricao_produto varchar(30) not null,
    preco_produto float not null
);

create table nota_fiscal (
	numero_nf int not null auto_increment primary key,
    data_nf date not null,
    valor_nf float not null    
);

create table itens (
	produto_codigo_produto int not null auto_increment,
    nota_fiscal_numero int not null,
    num_item int,
    qtde_item int,
    FOREIGN KEY (produto_codigo_produto) REFERENCES produto(codigo_produto),
    foreign key (nota_fiscal_numero) references nota_fiscal(numero_nf)
);

alter table produto
modify column descricao_produto varchar(50) not null;

alter table nota_fiscal
add column ICMS float after numero_nf;

alter table produto
add column peso float not null after preco_produto;

desc produto;

desc nota_fiscal;

alter table nota_fiscal
rename column valor_nf to valorTotal_nf;

alter table nota_fiscal
drop column data_nf;

drop table itens;

alter table nota_fiscal
rename vendas;
