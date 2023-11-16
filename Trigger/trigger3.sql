create database trigger3;

use trigger3;

Create table Funcionarios(
id int primary key auto_increment,
nome varchar(255) not null,
data_admissao date not null
);

insert into Funcionarios(nome,data_admissao) values
("Gabriel","2024-06-15"),
("Guilherme","2023-06-15");

DELIMITER //
CREATE TRIGGER trigger3.verificar_data
BEFORE INSERT ON trigger3.Funcionarios
FOR EACH ROW
BEGIN
    IF New.data_admissao >"2023-11-16" THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROOO,A DATA DE ADMISSÃO TEM QUE SER MAIOR QUE A DATA ATUAL';
    END IF;
END;
//
DELIMITER ;

drop table trigger3.Funcionarios;

drop database trigger3;

