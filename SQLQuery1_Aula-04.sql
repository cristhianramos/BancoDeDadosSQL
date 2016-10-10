
/*
O que são constraints?
Constraints são restrições 
feitas para as colunas nas tabelas contendo diversos tipos

*/

/*
query

trata-se de um comando SQL, exemplos: create, select
*/

create database teste_constraint;
go
use teste_constraint


create table TIPO_PRODUTO
(
   cod_tipo int identity not null,
   tipo varchar (30) not null,
   
   constraint pk_tipo_produto primary key (cod_tipo),
   constraint uq_tipo_produto_tipo unique (tipo)  -- UNICO, ACEITA NULL, MAS NÃO PODE SER REPETIDO
)


insert TIPO_PRODUTO values ('mouse')
insert TIPO_PRODUTO values ('pen-drive')
insert TIPO_PRODUTO values ('hard-disk')
-- vai dar erro porque viola UNIQUE constraint
insert TIPO_PRODUTO values ('hard-disk')


create table PRODUTOS
(
  id_produto int identity not null,
  descricao varchar(50),
  cod_tipo int, -- foreingh key 
  preco_custo numeric(10,2),
  preco_venda numeric(10,2),
  qtd_real numeric (10,2),
  qtd_minima numeric(10,2),
  
  constraint pk_produtos primary key (id_produto),
  
  constraint pk_produtos_tipo_produto -- regras
  foreign key (cod_tipo)
  references tipo_produto (cod_tipo)
)

drop table PRODUTOS

insert produtos  values ('teste',1,2,1,50,25)

select* from produtos
select* from TIPO_PRODUTO

insert produtos  values ('MOUSE',1,2,1,50,25)


create database DB_CDS
go -- para executar as duas linhas
use DB_CDS


create table ARTISTA
(
  cod_art int,
  nome_art varchar (100),
  
  constraint pk_artista primary key (cod_art),
  constraint uq_artista_nome_art unique (nome_art)
)


select*from ARTISTA


create table GRAVADORA
(
  cod_grav int,
  nome_grav varchar(50),
  
  -- para criar a constraint uq_(nomeTabela)_(tipo)
  constraint pk_gravadora primary key (cod_grav),
  constraint uq_gravadora_nome_grav unique (nome_grav)
)

select*from GRAVADORA

create table CATEGORIA
(
 cod_cat int,
 nome_cat varchar(20),
 
 constraint pk_categoria primary key (cod_cat),
 constraint uq_categoria_nome_cat unique (nome_cat)
)

select * from CATEGORIA

CREATE TABLE ESTADO
(
  Sigla_Est 		char(2),
Nome_Est 		varchar(50),
Constraint PK_Estado Primary Key(Sigla_Est),
Constraint UQ_Estado_Nome_Est Unique(Nome_Est)
)

select*from Estado

drop table ESTADO


create table CIDADE
(
 cod_cid int,
 sigla_cid char(2),
 nome_cid varchar(100),
 
 constraint pk_cidade
    primary key (cod_cid),
   
  constraint fk_cidade_estado foreign key (sigla_cid)
    references estado (sigla_est)
)


create table CLIENTE
(
  cod_cli int, 
  cod_cid int,-- chave estrangeira da tabela Cidade (cod_cid)
  nome_cli varchar (100),
  end_cli varchar (200),
  renda_cli decimal(10,2) default 0,-- se a pessoa não informar será ZERO
  sexo_cli char (1) default 'F',
  
  constraint pk_cliente primary key (cod_cli),
  
  constraint fk_cliente_cidade foreign key (cod_cid)
  references cidade (cod_cid),
  
  constraint ch_cliente_renda_cli check (renda_cli >= 0),
  /*
  Check(CK)
Check, é uma constraint que especifica que condição a coluna precisa 
para salvar um registro.  */
  constraint ch_cliente_sexo_cli check (sexo_cli in ('m','f'))
)


insert into cliente values (01,null,'Pedro','rua azul',800.00,'M')
insert into cliente values (02,null,'Maria','rua verde',900.00,'F')

-- inserindo valor negativo
insert into cliente values (03,null,'João','rua amarela',-900.00,'m')
/*  ERRO
A instrução INSERT conflitou com a restrição do CHECK "ch_cliente_renda_cli". 
O conflito ocorreu no bando de dados "DB_CDS", tabela "dbo.CLIENTE", 
column 'renda_cli'. A instrução foi finalizada.
*/

-- inserindo o sexo diferente de M ou F
insert into cliente values (04,null,'Sabrina','rua violeta',1000.00,'r')
/* ERRO
A instrução INSERT conflitou com a restrição do CHECK "ch_cliente_sexo_cli".
 O conflito ocorreu no bando de dados "DB_CDS", tabela "dbo.CLIENTE", 
 column 'sexo_cli'. A instrução foi finalizada.
*/
drop table CLIENTE

select*from CLIENTE

create table CONJUGE
(
  cod_cli int,
  nome_conj varchar (100),
  renda_conj decimal (10,2),
  sexo_conj char(1) default 'M',
  
  constraint pk_conjuge_ primary key (cod_cli),
  constraint fk_conjuge_cliente foreign key (cod_cli)
  references cliente (cod_cli),
  
  Constraint CH_Conjuge_Renda_Conj  Check(Renda_Conj >=0),
  Constraint CH_Conjuge_Sexo_Conj   Check(Sexo_Conj IN ('F','M'))

)

create table FUNCIONARIO
(
  cod_func int,
  nome_func varchar(100),
  end_func varchar (200),
  sal_func decimal (10,2)default 0,
  sexo_func char (1) default 'M',
  
  constraint pk_funcionario primary key (cod_func),
  
  constraint ch_funcionario_sal_func check (sal_func >= 0),
  constraint ch_funcionario_sexo_func check (sexo_func in ('F','M'))
)

select*from FUNCIONARIO

create table DEPENDENTE
(
  cod_dep int,
  cod_func int,
  nome_dep varchar(100),
  sexo_dep char(1) default 'M',
  
  constraint pk_dependente primary key (cod_dep),
  
  constraint fk_dependente foreign key (cod_func)
  references funcionario (cod_func),
  
  constraint ch_funcionario_sexo_dep check (sexo_dep in ('F','M'))
)

create table TITULO
(
  cod_tit int,
  cod_cat int,
  cod_grav int,
  nome_cd varchar(100),
  val_cd decimal (10,2),
  qtd_estq int,
  
  constraint pk_titulo primary key (cod_tit),
  constraint fk_titulo_categoria foreign key (cod_cat)
  references categoria (cod_cat),
  
  constraint fk_titulo_gravadora foreign key (cod_grav)
  references gravadora (cod_grav),
  
  constraint uq_titulo_nome_cd unique (nome_cd),
  constraint ch_titulo_val_cd check (val_cd > 0),
  constraint ch_titulo_qtd_estq check (qtd_estq >=0)
)

create table PEDIDO
(
   num_ped int,
   cod_cli int,
   cod_func int,
   data_ped datetime,
   val_ped decimal(10,2),
   
   constraint pk_pedido primary key (num_ped),
   
   constraint fk_pedido_cliente foreign key (cod_cli)
   references cliente (cod_cli),
   
   constraint fk_pedido_funcionario foreign key (cod_func)
   references funcionario (cod_func)
)

CREATE TABLE TituloPedido
(
  num_ped int,
  cod_tit int,
  qtd_cd int,
  val_cd decimal (10,2),
  
  -- chave primaria composta
  constraint pk_TituloPedido primary key (num_ped,cod_tit),
  
  constraint fk_TituloPedido_pedido foreign key (num_ped)
  references pedido (num_ped),
  
  constraint fk_TituloPedido_titulo foreign key (cod_tit)
  references titulo (cod_tit),
  
  constraint ch_TituloPedido_qtd_cd check (qtd_cd >=1),
  
  constraint ch_TituloPedido_val_cd check (val_cd>0)
  
  
)

create table TituloArtista
(
  cod_tit int,
  cod_art int,
  -- chave primaria composta
  constraint pk_TituloArtista  primary key (cod_tit,cod_art),
  
  constraint fk_TituloArtista_titulo  foreign key (cod_tit)
  references titulo (cod_tit),
  
  constraint fk_TituloArtista foreign key (cod_art)
  references artista (cod_art)
  
)
 

drop table TituloArtista
