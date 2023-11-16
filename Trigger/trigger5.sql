Create database trigger5;

use trigger5;

Create table Aluno(
id_aluno int primary key auto_increment, 
nome varchar(255) not null, 
data_nascimento date not null, 
serie int not null
);

insert into Aluno(nome,data_nascimento,serie)
values("Andre","2003-07-05",1);

Create table Matriculas(
id_matricula int primary key auto_increment,
status varchar(255) not null,
data_matricula date not null,
id_aluno int,
foreign key (id_aluno) references Aluno(id_aluno)
);

insert into Matriculas(status,data_matricula,id_aluno)
values("Matricula","2023-08-02",1);

DELIMITER //

Create trigger trigger5.verificador_idade2
BEFORE INSERT ON trigger5.Matriculas
FOR each row
begin
IF(SELECT serie from trigger5.aluno where id = new.id_Aluno) = 1 and 
(SELECT data_nascimento from trigger5.aluno where id = new.id_aluno)
< "2019-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_aluno)  > "2021-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT serie from trigger5.aluno where id = new.id_aluno) = 2 and 
(SELECT data_nascimento from trigger5.aluno where id = new.id_aluno)
< "2018-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_aluno)  > "2020-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT serie from trigger5.aluno where id = new.id_aluno) = 3 and 
(SELECT data_nascimento from trigger5.aluno where id= new.id_aluno)
< "2017-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_Aluno)  > "2019-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT serie from trigger5.aluno where id = new.id_aluno) = 4 and 
(SELECT data_nascimento from trigger5.aluno where id= new.id_aluno)
< "2016-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_Aluno)  > "2018-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT serie from trigger5.aluno where id = new.id_aluno) = 5 and 
(SELECT data_nascimento from trigger5.aluno where id= new.id_aluno)
< "2015-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_Aluno)  > "2017-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT serie from trigger5.aluno where id = new.id_aluno) = 6 and 
(SELECT data_nascimento from trigger5.aluno where id= new.id_aluno)
< "2014-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_Aluno)  > "2016-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT serie from trigger5.aluno where id = new.id_aluno) = 7 and 
(SELECT data_nascimento from trigger5.aluno where id= new.id_aluno)
< "2013-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_Aluno)  > "2015-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";


ELSE IF(SELECT serie from trigger5.aluno where id = new.id_aluno) = 8 and 
(SELECT data_nascimento from trigger5.aluno where id= new.id_aluno)
< "2012-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_Aluno)  > "2014-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

ELSE IF(SELECT serie from trigger5.aluno where id = new.id_aluno) = 9 and 
(SELECT data_nascimento from trigger5.aluno where id= new.id_aluno)
< "2011-01-01" OR (SELECT data_nascimento from trigger5.aluno where id = new.id_Aluno)  > "2013-12-31"
THEN
SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "REQUISITO NAO ACEITO";

END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END IF;
END;


//
DELIMITER ;

drop table Matriculas;

drop database trigger5;
