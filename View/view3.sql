create database view3;

use view3;

create table funcionarios(
ID int primary key auto_increment,
nome varchar(255),
cargo varchar(255),
salario decimal(10.2)
);

insert into funcionarios(nome,cargo,salario) values
("Marcio","Empregado",100.00),
("Leandro","Diretor",200.00),
("Leonardo","Gerente",250.00),
("Alex","Chefe",300.00);

create table vendas(
ID int primary key auto_increment,
ID_Funcionario int,
data_venda date,
valor_venda decimal(10.2)
);

insert into vendas(ID_Funcionario,data_venda,valor_venda) values
(1,"2021-06-02",500),
(2,"2022-10-02",1000),
(3,"2023-07-05",1500),
(4,"2023-10-18",2000);

select * from view3.funcionarios;

create view view3.relatorio_vendas_funcionario as
select F.nome as "Nome do Funcionário",
count(V.ID) as "Número de Vendas",
Sum(V.valor_venda) as "Valor Total das Vendas"
from view3.funcionarios F 
left join view3.vendas V
on F.ID = V.ID_Funcionario
group by F.nome;


select * from view3.relatorio_vendas_funcionario;

drop database view3;
