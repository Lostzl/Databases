--ALUNOS: LUCAS VITOR DE SOUZA, DEBORA DA SILVA BORGES, MATHEUS FERNANDES DA SILVA.


--(1) - Qual é o total de vendas e o número de pedidos para cada categoria de produtos?

select mp.category
	   , sum(sd.sales) as total_vendas
	   , count(mp.category) as qtd_pedidos 
from store_data sd 
inner join master_product mp on mp.product_id = sd.product_id 
group by mp.category 
order by mp.category 

--(2) - Quais são as três principais cidades em termos de vendas totais?

select mc.city
	   , sum(sd.sales) as total_vendas 
from store_data sd 
inner join master_customer mc on mc.customer_id = sd.customer_id 
group by mc.city 
order by total_vendas desc
fetch first 3 rows only 

--(3) - Quais são as sub-categorias mais vendidas no segmento " Material de Escritório" nos últimos dois anos?
-- "O dataset tem dados no periodo de 01-2015 até 12-2018"

select mp.sub_category
	   , sum(sd.sales) as total_vendas 
from store_data sd 
inner join master_product mp on mp.product_id = sd.product_id 
where mp.category = 'Office Supplies'
and sd.order_date between '2017-01-01' and '2018-12-31'
group by mp.sub_category 
order by total_vendas desc

--(4) - Total de Vendas mensais em todo o período

select to_char(sd.order_date, 'MM/YYYY') as mes_ano
	   , sum(sd.sales) as total_vendas
from store_data sd 
group by mes_ano
order by mes_ano

