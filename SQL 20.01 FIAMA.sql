Create database sala_de_aula
--para utilizar o banco de dados
Use sala_de_aula

--comando para criar tabelas
CREATE TABLE ALUNOS
(num_aluno int primary key identity,
nome  char(30),
data_nascimento datetime,
idade int,
e_mail char(50),
fone_res char(14),
fone_com char(14),
fax char(14),
celular char(14),
profissao char(40),
empresa char(50)
)
--Seleciona os campos criados
Select*from ALUNOS
Drop table ALUNOS;
Insert INTO ALUNOS
(nome, data_nascimento, idade,e_mail, fone_res,
fone_com, fax, celular, profissao, empresa) 

VALUES
('João da Silva', '1978.01.01',33,'magic@magic.com',
'1111111111', '2222222222', '', '3333333333', 'Professor','IMPACTA TECNOLOGIA')

Insert INTO ALUNOS
(nome, data_nascimento, idade, e_mail, fone_res, celular, profissao)

VALUES
('Fiama dos Santos Cristi', '25.08.1993', 20, 'fiama.cristi@email.com',
'1233456', '2131231','analista de parcerias')

Insert INTO ALUNOS
(nome, data_nascimento, idade, e_mail)

VALUES
('Maria dos santos', '31.07.1990', 30, 'maria@gmail.com')

/*Insert Posicional não precisa declarar os campos
antes de value*/

Insert INTO ALUNOS
VALUES
('Tania Maria dos Santos', '07.09.1981', 50, 'tania_maria@hotmail.com',
'123123123','456456465','45645456','12312312','professora','empresa')

--Inserção de vários registros (tipo tabela)

Insert INTO ALUNOS
(nome,idade)

VALUES 
('João',10),
('Pedro',15),
('Maria',25),
('Antonio',42)


Insert INTO ALUNOS
(nome,idade)

VALUES 
('João',10),
('Pedro',15),
('Maria',25),
('Antonio',42)



 

