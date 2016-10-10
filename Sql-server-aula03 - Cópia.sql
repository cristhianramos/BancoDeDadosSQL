use impacta

select*from Produto


/*
   Listar nome, tipo, valor, e o campo virtual  [valor c/ desconto] com desconto de 12% de eletr�nicos
   
*/


/*
Listar nome,tipo,valor, e campo virtual [valor c/aumento] com
aumento de 10% do produto de inform�tica
classificados por nome  ascendente
*/

-- NOME DA TABELA E NOME DO CAMPO pode ser tanto MAIUSCULO como MINUSCULO

select Nome_Prod,Tipo_Prod,val_prod,[valor c/ aumento] = Val_Prod*1.1 
from Produto 
where Tipo_Prod = 'Inform�tica' order by Nome_Prod asc

/*
   LISTAR nome,qtd,valor e o campo virtual [total] = qtd*val 
   dos produtos com quantidade acima de 400
*/

select *from produto
select nome_prod,qtd_prod,val_prod,[TOTAL]=qtd_prod*val_prod 
from Produto where Qtd_Prod > 400

/*
listar nome,qtd,valor, e o campo virtual [total]
= qtd*valor dos produtos com [total] acima de 300000
*/


select nome_prod,qtd_prod,val_prod,[TOTAL] = qtd_prod*val_prod 
from Produto where qtd_prod*val_prod > 300000

/*
 Listar todos os campos dos produtos de inform�tica com 
 valores acima de 500
*/

select * from Produto where Tipo_Prod = 'Inform�tica' and Val_Prod > 500 

/*
  Listar todos os campos dos produtos de inform�tica ou 
  os produtos com valores maiores ou iguais a 700,.00
*/

select * from Produto where tipo_Prod = 'Inform�tica' or Val_Prod >= 700

/*
  listar todos os campos dos produtos tipo 'Inform�tica' e 'eletr�nicos'
  */
  
  select * from Produto where Tipo_Prod = 'Inform�tica' or tipo_prod =  'Eletr�nicos'
  
  select * from Produto
  where Tipo_Prod not in  ('Inform�tica','Eletr�nicos')
  -- pode ser utilicar " not in"
  
/*
 Listar todos os campos dos produtos que n�o 
 s�o do tipo Inform�tica ou Eletr�nicos
*/

select * from Produto 
where Tipo_Prod != 'Inform�tica' and Tipo_prod <> 'Eletr�nicos'
  
 select*from Produto
 where Tipo_Prod not in('Inform�tica','Eletr�nicos')
 
 /*
 lISTAR	 todos os campos dos produtos cujos valores 
 estejam entre 300 e 500 utilizando a clausula between
 */
 
 select*from Produto where Val_Prod  between 300 and 500
  
  /*
  listar todos os campos dos produtos 
  cujos valores n�o est�o entre 300 e 500
  utilizando a cl�usula between
  */
  
  select * from Produto
  where val_prod not between 300 and 500
  
  /*
  listar todos os campos dos produtos cuja primeira letra seja M
  */
  
  select *from Produto
  where nome_prod
  like  'M%'
/*
listar todos os nomes de produtos cujo caractere
inicial seja M e que contenha S em qualquer posi��o na palavra
*/

select *from produto
where nome_prod like 'M%s%'
  
  
select *from produto
where nome_prod like 'M%' and  nome_prod like '%s%'

/*
listar todos os nomes de produtos onde o caractere M
esteja em qualquer posi��o.
classificados pelo nome em ordem ascendente
*/


select Nome_Prod,val_prod from Produto
order by 1

select tipo_prod,nome_prod,val_prod from Produto
order by Tipo_Prod,nome_prod

select tipo_prod,nome_prod,val_prod from Produto
order by Tipo_Prod asc,nome_prod desc

Select tipo_prod, nome_prod, val_prod from produto
Order by 1 desc, 3 desc


select top 5*from produto order by Val_Prod asc

/*
 listar tipo,nome e valor do produto ordenado
 pelo tipo desc e valor desc
 
*/

Select tipo_prod, nome_prod, val_prod from produto
Order by tipo_prod desc, val_prod desc

Select tipo_prod, nome_prod, val_prod from produto
Order by 1 desc, 3 desc


select top 1 * from Produto
order by qtd_prod

create database BDteste01

select top 1 with ties * from produto
order by Qtd_Prod

/*
Exerc�cio 25.
	Listar os 4 primeiros produtos de menor quantidade. e
	Listar os 4 primeiros produtos de menor quantidade, 
	al�m dos produtos que possuem a mesma quantidade de unidades do quarto produto.

*/

Select top 4 * from produto 
	order by qtd_prod
	
	Select top 4 with ties * from produto 
	order by qtd_prod


drop database BDteste01

/*=============Atualizando =========================*/
select*from Produto
where Tipo_Prod = 'Inform�tica'

begin tran
update Produto
set Val_Prod = Val_Prod*1.1
where Tipo_Prod = 'Inform�tica'

select*from Produto
where Tipo_Prod = 'Inform�tica'
rollback tran -- n�o efetiva a transa��o

select*from Produto
where Tipo_Prod = 'Inform�tica'

-- ===================Efetivar a Transa��o=============
select*from Produto
where Tipo_Prod = 'Inform�tica'

begin tran
update Produto
set Val_Prod = Val_Prod*1.1
where Tipo_Prod = 'Inform�tica'

select*from Produto
where Tipo_Prod = 'Inform�tica'
commit tran -- Efetiva a transa��o

select*from Produto
where Tipo_Prod = 'Inform�tica'

/*
Adicionar 53 unidades apenas aos produtos
que possuem 300 unidades ou menos
*/

update Produto
set Qtd_Prod = Qtd_Prod+53
where Qtd_Prod > 300

select * from Produto

update Produto
set Qtd_Prod = Qtd_Prod+53
where Qtd_Prod <= 300

select * from Produto

/*
Exerc�cio 2.
Atualizar o valor do produto com acr�scimo de 12%  
dos produtos de �Inform�tica� e com valor abaixo de 650,00.
*/


update Produto
set Val_Prod = Val_Prod*1.12
where Tipo_Prod = 'Inform�tica' and Val_Prod < 650.00

select*from Produto


/*
DELETE
	A sintaxe b�sica � a seguinte:
DELETE [FROM] tabela
[WHERE condi��o]
Obs. Se n�o for inserida a cl�usula WHERE, todas as linhas tabela ser�o exclu�das.
*/

select*from Produto
where Tipo_Prod = 'Inform�tica'

begin tran 
delete from Produto
where Tipo_Prod = 'Inform�tica'

select*from Produto
where Tipo_Prod = 'Inform�tica'

commit tran


select*from Produto
where Tipo_Prod = 'Inform�tica'

/*
Excluir todos os produtos com quantidade menor ou igual a 350.

*/

delete from Produto
where Qtd_Prod <= 350

select*from Produto