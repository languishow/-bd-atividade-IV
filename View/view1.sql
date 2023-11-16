Create database view1;

use view1;

create table Clientes(
ID int primary key auto_increment, 
nome varchar(255) not null, 
email varchar(255) unique not null, 
telefone varchar(255) not null
);

insert into Clientes(nome,email,telefone) values
("Gabriel","gabriel@gmail.com","(11) 11111-1111"),
("Mailson","mailson@gmail.com","(22) 22222-2222"),
("Emerson","emerson@gmail.com","(33) 33333-3333"),
("Jailson","jailson@gmail.com","(44) 44444-4444");

create table Pedidos(
ID int primary key auto_increment, 
ID_cliente int, 
data_pedido date,
valor_total float,
foreign key (ID_cliente) references Clientes(ID)
);

insert into Pedidos(ID_cliente,data_pedido,valor_total) values
(1,"2022-02-12",22),
(2,"2022-03-12",44),
(3,"2022-04-12",66),
(4,"2022-05-12",88);

create view view1.relatorio_pedidos_cliente as
select C.nome as "Nome",
count(P.ID) as "Quantidade de Pedidos",
P.valor_total as "Valor total"
From view1.Clientes C
inner join Pedidos P on C.ID = P.ID_Cliente;

select * from view1.relatorio_pedidos_cliente;

drop database view1;

