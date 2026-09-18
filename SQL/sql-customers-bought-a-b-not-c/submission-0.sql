-- Write your query below
with cutomers_purchase_A_B AS (
    select c.Customer_id, c.Customer_name 
    from customers c
    left join orders o
    ON c.customer_id = o.Customer_id
    group by c.customer_id, c.Customer_name
    having sum(case when o.product_name = 'A' then 1 else 0 end) > 0
       and sum(case when o.product_name = 'B' then 1 else 0 end) > 0
       and sum(case when o.product_name = 'C' then 1 else 0 end) = 0
)
select CP.customer_id, cp.customer_name from cutomers_purchase_A_B
as CP
order by customer_name;