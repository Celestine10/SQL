use burrito_chain

select * from dbo.superstore

SELECT [Customer Name], Category, [State], [Ship Mode] FROM dbo.superstore
Where State like 'Kentucky'

Create View Florida_Sales 
as 
SELECT [Customer Name], Category, [State], [Ship Mode], Sales, Profit FROM dbo.superstore
Where State like 'Florida'

Select * From Florida_Sales 
where Category like 'Technology'