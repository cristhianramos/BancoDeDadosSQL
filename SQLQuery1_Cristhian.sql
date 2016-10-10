
-- Comando para criação de BD
create database sala_de_aula

-- Para utilizar o banco de dados
use sala_de_aula

-- comando para criação de tabelas
create table ALUNOS
( 
 -- num_aluno int primary key, --chave primaria é obrigatorio preencher
 num_aluno int primary key identity, -- auto-numeração
  nome char(30),
  data_nascimento datetime,
  idade int,
  e_mail char (50),
  fone_res char(14),
  fone_com char (14),
  fax  char(14),
  celular char(14),
  profissao char(40),
  empresa char(50)
    )
  
-- Seleciona os dados 
select*from alunos

-- Apaga tabela
drop table ALUNOS;

-- inserção de Dados na Tabela
insert into alunos
(  nome, data_nascimento, idade, e_mail, 
  fone_res, fone_com,fax ,celular,profissao,empresa)
  values 
  ('joao da silva','1978.01.01',30,'magic@magic',
  '11111111','22222222','','333333','professor','Impacta Tecnologia')

insert into alunos
(  nome, data_nascimento, idade,  
  fone_res, celular,profissao,empresa)
  values 
  ('Maria da silva','01.01.1990',30,
  '11111111','333333','professor','Impacta Tecnologia')

-- Insert POSICIONAL

insert into alunos 
values
(01, 'Sabrina Ribeiro','02.01.1993',23,'sabrina@yahoo.com','12345678',
'','','','Estudante','Sony')

-- Inserção de Varios registros em uma Tabela

insert alunos (nome,idade)
values
('Joao',10),
('Pedro',15),
('Maria',25),
('Antonio',42)



select*from alunos;