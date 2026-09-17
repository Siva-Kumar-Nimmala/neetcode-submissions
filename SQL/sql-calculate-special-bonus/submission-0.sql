-- Write your query below
--select employee_id,bonus
--if employee_id is oddnumber and doestnot start with 'M' then he will get 100% bonus
-- order by employee_id

with Employee_bonus as (
    select employee_id,
    case when employee_id % 2 <> 0 and name not like 'M%' then salary else 0 end as bonus
    from employees
)
select employee_id, bonus from Employee_bonus order by employee_id;
