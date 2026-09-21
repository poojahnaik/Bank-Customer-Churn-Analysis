select * from customerchurn

--how many active customers churn?
select exited, count(*) filter(where is_active_member=1) as no_of_active_churners
from customerchurn
group by exited

--total no of customers that churn/exited or not based on their gender
select gender, exited, count(customer_id) as no_of_customers
from customerchurn
group by exited, gender

--how many customers churn based on their demographic?
select geography, exited, count(customer_id) as no_of_customers
from customerchurn
group by geography, exited
order by geography, exited
	

--how many customers churn based on their group age?
select age_group, exited, count(customer_id) as no_of_customers
from customerchurn
group by age_group, exited
order by age_group, exited

--total no of customers that churn/exited or not based on how long they've been a customer
select tenure, count(*) as total_customers, 
count(*) filter(where exited=1) as no_of_churners, count(*) filter(where exited=0) as no_of_nonchurners
from customerchurn
group by tenure
order by tenure

--how many customers churn based on the amount of credit score (average, highest and lowest)?
select credit_score_range, 
count(*)filter(where exited=1) as no_of_churners,
round(avg(credit_score::numeric), 2) as avg_credit_score,
max(credit_score) as highest_credit_score,
min(credit_score) as lowest_credit_score
from customerchurn
group by credit_score_range
order by no_of_churners

--how many customers churn based on how many bank product they use?
select num_of_products, count(*) as total_customers, count(*) filter(where exited=1) as no_of_churners
from customerchurn
group by num_of_products
order by num_of_products

--how many customers churn based on the average score of customer satisfaction score towards the bank?
select exited, round(avg(satisfaction_score::numeric), 2) as avg_satisfaction,
count(*) as no_of_customers
from customerchurn
group by exited

--how many customers churn based on the amount of complain filed by customer?
select complain, exited, count(*) as no_of_customers
from customerchurn
group by complain, exited
order by complain, exited

--how many customer that churn based on credit card ownership?
select case when has_cr_card=1 then 'Yes' else 'No' end as credit_card_owner, exited, count(customer_id) as no_of_customers
from customerchurn
group by credit_card_owner, exited
order by credit_card_owner, exited

--how many customer that churn based on the their card type?
select card_type, count(customer_id) filter(where exited=1) as no_of_churners
from customerchurn
group by card_type
order by no_of_churners desc

--how many customer that churn based on the amount of point customer earned?
select 
	case 
	when point_earned<400 then 'Low'
	when point_earned<600 then 'Medium'
	when point_earned<800 then 'High'
	else 'Very High'
	end as points_segment,
	count(*)filter (where exited=1) as no_of_churners
from customerchurn
group by points_segment
order by no_of_churners desc

--how many customer that churn based on customer estimated salary?
select 
	case
	when estimated_salary<40000 then 'Low'
	when estimated_salary<80000 then 'Middle-Low'
	when estimated_salary<120000 then 'Middle'
	when estimated_salary<160000 then 'Upper-Middle'
	else 'High' 
	end as salary_segment,
	count(*) filter(where exited=1) as no_of_churners
from customerchurn
group by salary_segment
order by no_of_churners desc

--how many customers churn based on the amount of customer's bank balance (average, highest, lowest)?
select 
	case 
	when balance=0 then 'Zero'
	when balance<100000 then 'Low'
	when balance<150000 then 'Medium'
	else 'High'
	end as balance_segment,
	count(*) filter(where exited=1) as no_of_churners,
	round(avg(balance::numeric), 2) as avg_balance,
	max(balance) as highest_balance,
	min(balance) as min_balance
from customerchurn
group by balance_segment
order by no_of_churners desc

--Within each country, which age groups have the highest churn rate?
with seg as 
(select geography, age_group, round(100.0*count(*)filter(where exited=1)/count(*), 2) as churn_rate,
dense_rank()over(partition by geography order by count(*) filter(where exited=1)::numeric/count(*) desc) as churn_rank
from customerchurn
group by geography, age_group)
select geography, age_group, churn_rate 
from seg
where churn_rank<=3 
order by geography, churn_rate desc

--Which age groups account for most of the churners?
with age_seg as(select age_group, count(*)filter(where exited=1) as no_of_churners,
rank()over(order by count(*)filter(where exited=1) desc) as age_rank
from customerchurn
group by age_group)
select age_group, no_of_churners
from age_seg
where age_rank<=3
order by age_rank

--Does churn rise for customers with higher balances relative to others in their own country?
with balance_seg as
(select balance, geography, exited, 
ntile(4)over(partition by geography order by balance) as balance_quartile
from customerchurn)
select geography, balance_quartile, count(*)filter(where exited=1) as no_of_churners,
round(100*avg(exited), 2) as churn_rate
from balance_seg
group by geography, balance_quartile
order by geography, balance_quartile
