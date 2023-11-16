create database view2;

use view2;

create table Produtos(
ID int primary key auto_increment, 
nome varchar (255) not null, 
preco_unitario decimal(10.2), 
categoria varchar(255) not null
);

insert into Produtos(nome,preco_unitario,categoria) values
("Desodorante",2.00,"Higiene"),
("Sabão",10.00,"Higiene"),
("Shampoo",15.00,"Higiene"),
("Condicionador",20.00,"Higiene");

create table Estoque(
ID int auto_increment primary key,
ID_Produto int, 
quantidade int,
foreign key (ID_Produto) references Produtos(ID)
);

insert into Estoque(ID_Produto,quantidade) values
(1,5),
(2,10),
(3,15),
(4,20);


create view view2.estoque_critico as
select P.nome as "Nome",
E.quantidade as "Quantidade"
from view2.Produtos P
inner join view2.Estoque E
on P.ID = E.ID_Produto
where Quantidade < 10;

select * from view2.estoque_critico;

drop database view2;

