create database trigger1;

use trigger1;

CREATE TABLE Livros(
id_livro INT AUTO_INCREMENT PRIMARY KEY,
titulo varchar(255) not null,
autor varchar(255) not null,
quantidade_estoque int not null
 );
 
insert into Livros (titulo,autor,quantidade_estoque) values
('Laços de Família', 'Clarice Lispector', 50);

 
CREATE TABLE Emprestimos(
id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
id_livro int,
foreign key (id_livro) references livros(id_livro),
data_emprestimo datetime not null,
data_devolucao datetime not null
 );
 
insert into Emprestimos (id_livro,data_emprestimo,data_devolucao) values
('1', '2023-04-05', '2023-10-06');

SELECT * FROM Livros;

DELIMITER //
CREATE TRIGGER trigger1.atualizar_estoque_apos_emprestimo
AFTER INSERT ON trigger1.Emprestimos
FOR EACH ROW
BEGIN
    UPDATE trigger1.Livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE ID = NEW.id_livro;
END;
//
DELIMITER ;
 
 drop database trigger1;
 
 