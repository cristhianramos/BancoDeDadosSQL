

create database IMPACTA

use impacta

create table PRODUTO
(
  Cod_Prod int,
  Nome_Prod varchar(40),
  Tipo_Prod varchar (20),
  Qtd_Prod int,
  Val_Prod Decimal(10,2),
)
select*from produto


INSERT into produto values
(1,'Impressora','Informática',200,600.00),
(2,'Câmera Digital','Dgitais',300,400.00),
(3,'DVD Player','Eletrônicos',250,500.00),
(4,'Monitor','Informática',400,900.00),
(5,'Televisor','Eletrônicos',350,650.00),
(6,'Filmadora Digital','Digitais',500,700),
(7,'Celular','Telefone',450,850.00),
(8,'Teclado','Informática',300,450.00),
(9,'Videocassete','Eletrônicos',200,300.00),
(10,'Mouse','Informática',400,60.00)

delete from produto
select*from produto

select Cod_Prod,Nome_Prod,Val_Prod from produto


select Cod_Prod as [Código do Produto],
Nome_Prod as 'Nome do Produto',
Val_Prod as [Valor do Produto] from produto


select *, [Valor c/ Desconto] = Val_Prod*0.97  from produto

select *, [Valor c/ Desconto] = Val_Prod-Val_Prod*0.07  from produto

/*Listar nome,tipo, valor e campo virtual [] 
com desconto de 12% dos produtos de 'Eletronicos'*/

select Nome_Prod,Tipo_Prod,Val_Prod,[Valor c/ desconto] 
= Val_Prod*0.88 from produto where Tipo_Prod = 'Eletrônicos' 
