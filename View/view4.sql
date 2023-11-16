create database view4;

use view4;

create table categorias(
ID int primary key auto_increment,
Nome varchar(255),
descricao text
);

insert into categorias(Nome,descricao) values
("Tenis","Azul"),
("Camisa","Branca"),
("Bermuda","Cinza"),
("Jaqueta","Preta");

create table produtos(
ID int primary key auto_increment, 
nome varchar (255), 
preco_unitario decimal(10.2), 
ID_Categoria int,
foreign key (ID_Categoria) references categorias(ID)
);

insert into produtos(nome,preco_unitario,ID_Categoria) values
("Nike",1500,1),
("Adidas",1200,2),
("Oakley",1400,3),
("Puma",1000,4);

create view view4.relatorio_produtos_categoria as
select C.nome as "Nome",
count(P.ID) as "Quantidade de Produtos"
from view4.categorias C
left join view4.produtos P
on C.ID = P.ID_Categoria
group by C.nome;


select * from view4.relatorio_produtos_categoria;

drop database view4;
