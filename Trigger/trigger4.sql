Create database trigger4;

use trigger4;

Create table Produtos(
id_produto int primary key auto_increment,
nome varchar(255) not null,
quantidade_estoque int not null
);


insert into Produtos(nome,quantidade_estoque) values
("Condicionador",1);

Create table Vendas(
id_venda int primary key auto_increment,
data_venda date not null
);

insert into Vendas(data_venda) values
("2022-08-25");

create table itens_venda(
id_item_venda int primary key auto_increment,
quantidade int not null,
id_venda int,
id_produto int,
foreign key (id_venda) references Vendas(id_venda),
foreign key (id_produto) references Produtos(id_produto)
);

insert into itens_venda(quantidade,id_venda,id_produto) values
(3,1,1);

DELIMITER //

CREATE TRIGGER trigger4.verificar_estoque
BEFORE INSERT ON trigger4.itens_venda
FOR EACH ROW
BEGIN
  IF (
        SELECT quantidade_estoque
        FROM produtos
        WHERE ID = NEW.id_produto
    ) < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: Quantidade em estoque insuficiente para o produto.';
    END IF;
END;
//
DELIMITER ;


