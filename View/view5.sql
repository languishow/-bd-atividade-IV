create database view5;

use view5;

create table Clientes(
ID int primary key auto_increment, 
nome varchar(255), 
endereco varchar(255), 
cidade varchar(255)
);

insert into Clientes(nome,endereco,cidade) values
("Mailson","Rua 1","Salvador"),
("Gabriel","Rua 2","São Paulo"),
("Matheus","Rua 3","Rio de Janeiro"),
("Breno","Rua 4","Aracaju");

create table Pagamento(
ID int primary key auto_increment,
ID_Cliente int,
data_pagamento date,
valor_pagamento float,
foreign key (ID_Cliente) references Clientes(ID)
);

insert into Pagamento(ID_Cliente,data_pagamento,valor_pagamento) values
(1,"2022-10-15",1000),
(2,"2022-12-05",2000),
(3,"2023-04-12",3000),
(4,"2023-06-21",4000);

create view view5.relatorio_pagamentos_cidade as
select C.nome as "Nome do Cliente",
C.cidade as "Cidade do Cliente",
sum(P.valor_pagamento) as "Valor total de pagamentos"
from view5.Clientes C
inner join view5.Pagamento P
on C.ID = P.ID_Cliente
group by C.nome;

select * from view5.relatorio_pagamentos_cidade;

drop database view5;

