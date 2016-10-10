create database Pedidos_Venda -- criar BD

use Pedidos_Venda; -- Escolher o banco  

create table teste
(valor intt)

CREATE table PRODUTOS
(
  cod_produto smallint primary key,-- 
  nome_produto varchar(20), -- alfanumerico variavel
  -- char alfanumero fixo
  cod_uni_medida tinyint, -- 1 byte
  cod_categoria tinyint,
  qtde_estoque int,-- 4 bytes
  qtde_min smallint,-- 2 bytes
  preco_custo decimal(7,2),-- nºdigitos e nºcasas
  preco_venda numeric(7,2)
)

drop table PRODUTOS -- comando p/ apagar a tabela
select*from PRODUTOS

create table UNIDADES
(
   cod_unidade tinyint primary key, -- inteiro(1byte) e chave primaria
   nome_unidade char(12)-- alfanumerico(12) e fixo
)
select*from UNIDADES

insert into UNIDADES
values (01,'Peças' ), -- '' apostrofo ou aspas simples
        (02,'Metros'), -- Quilogramas  Dúzias, pacote, Caixa       
        (03,'Quilogramas'),
        (04,'Dúzias'),
        (05,'Pacote'),
        (06,'Caixa')
        
-- Formas de inserção de dados
insert into UNIDADES
(nome_unidade,cod_unidade)values('quilogramas',3)

insert UNIDADES
(cod_unidade, nome_unidade,)values(4,'pacote')
        

create table CATEGORIAS
(
 cod_cat int primary key,-- inteiro (4bytes)  IDENTITY (auto numeração)
 nome_cat varchar(20)-- alfanumericos(20) e variavel
)

select*from CATEGORIAS


insert CATEGORIAS values ('mouse')

insert CATEGORIAS values (2,'teste')

/*  ERRO
Mensagem 8101, Nível 16, Estado 1, Linha 2
Um valor explícito para a coluna de identidade 
na tabela 'CATEGORIAS' só pode ser especificado 
quando uma lista de colunas é usada 
e o valor de IDENTITY_INSERT é ON.*/

/*comando p/ apagar a tabela*/ drop table CATEGORIAS


delete from categorias
select*from CATEGORIAS -- limpas todos os registros da TABELA

insert into categorias
values 
(01,'Mouse'),
(02,'Pen-Drive'),
(03,'Monitor de Video'),
(04,'Teclado'),
(05,'C.P.U'),
(06,'Cabo de Rede')

create table CLIENTE
(
  cod_cli int primary key,
  nome_cli char(30),
  cpf_cli int,
  tel_cli char(20),
  email_cli char(30)
  )
  
  select*from CLIENTE -- consultar todas as COLUNAS da tabela
  
  insert into CLIENTE values (1,'Maria',12345678911,'112222-4444','maria@uol.com.br'),
  (2,'Pedro',12345678933,'114444-8888','pedro@gmail.com'),
  (3,'Henrique',12345678955,'118888-9999','Henrique@yahoo.com')
  
  create table teste (valor int)
  
  select*from teste
  insert teste values(123)
  
  -- especicando colunas (consulta)
  
  select nome_cli from CLIENTE
  select nome_cli,cod_cli from CLIENTE -- podemos consultar em qualquer ordem
  
  /*OBS: Podemos selecionas quantos linhas (queries) e executar*/
  
  /*===================================================================*/
  -- UTILIZANDO A CLAUSULA -  AS 
  
  --somente altera para vizualização
  
  select nome_cli as nome_cliente,
  cod_cli as cod_cliente
  from CLIENTE
  
  select nome_cli as 'Nome do cliente',
  cod_cli as [Codigo do cliente] from cliente
  
  -- outras alternativas
  
  select cod_cli [fdsafas] from CLIENTE
  
  select [gasdgasdgsa] = cod_cli from CLIENTE
  
  /*====================================================================*/
  -- Criando Coluna VIRTUAL
  
  select cod_cat,nome_cat,'100' as [QTD_CATEG] from categorias
  
  --ou podemos multiplicar o campo * coluna virtual
  
  select cod_cat,nome_cat,[QTD] =  cod_cat*100 from categorias
  
  /*====================================================================*/
  -- ORDENAR OS DADOS     -  ORDER BY
  
  select*from categorias;
  select*from categorias order by nome_cat
  --ou
  select*from categorias order by nome_cat asc;
    select*from categorias order by nome_cat desc
    
  /*==================================================================*/
  
  
  --	FILTRANDO CONSULTAS - WHERE
  
  SELECT *FROM categorias where cod_cat = 2
  
  select*from categorias where cod_cat >3
  
  select cod_cat[Código da Categoria], nome_cat from categorias
  where cod_cat<=3
  order by nome_cat
  
  select*from categorias where nome_cat > 'p'
  
  select*from categorias where cod_cat > 2 and cod_cat<5
  
  select*from categorias where not (cod_cat>2 and cod_cat<5)
  
  select*from categorias
  Where cod_cat <=2 or cod_cat>5
  
  select*from categorias
  where not (cod_cat<=2 or cod_cat>5)
  
  /*=======================================================================*/
  
  -- CONSULTANDO FAIXA DE VALORES - BETWEEN (entre)
  
  
  select*from categorias
  where cod_cat>=3 and cod_cat<=5
  order by nome_cat
  --ou
    select*from categorias
  where cod_cat between 3 and 5 
    order by nome_cat
    
    /*=====================================================================*/
    
    -- CONSULTANDO COM BASE EM STRING - LIKE

select * from categorias
where nome_cat like 'M%' -- ou 'm%'

select*from categorias
where nome_cat like '%e' -- ou '%E'  

select *from categorias
where nome_cat like '%d%'
  
  
select *from categorias
where nome_cat not like  '%d%'
  