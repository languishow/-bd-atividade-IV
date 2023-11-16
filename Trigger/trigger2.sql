create database trigger2;

use trigger2;

create table Contas(
id_conta int auto_increment primary key,
nome varchar(255) not null,
saldo decimal(10.2) not null
);

insert into Contas(nome,saldo) values
("Felipe",1000),
("David",500);

create table Transacoes(
id_transacao int auto_increment primary key,
tipo varchar(255) not null, 
valor decimal(10.2) not null,
id_conta int, 
foreign key (id_conta) references Contas(id_conta)
);

insert into Transacoes(id_conta,tipo,valor) values 
(1,"Entrada",1000),
(2,"Saida",20.00);

select * from Contas;

DELIMITER //
CREATE TRIGGER trigger2.atualizar_estoque_apos_emprestimo
AFTER INSERT ON trigger2.Transacoes
FOR EACH ROW
BEGIN
    IF New.tipo="Entrada" THEN
    UPDATE trigger2.Contas
    SET saldo = saldo + new.valor
    WHERE ID = NEW.id_conta;
    ELSE
    UPDATE trigger2.Contas
    SET saldo = saldo - new.valor
    WHERE  ID = NEW.id_conta;
    END IF;
END;
//
DELIMITER ;

drop database trigger2;
