-- Write your query below
with positive_revenue as (
    select customer_id
    from customers
    where year = 2020 and revenue >0 
)
select customer_id from positive_revenue;