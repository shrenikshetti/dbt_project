with
	ord as (select * from {{source('src','orders')}} where O_ORDERPRIORITY = '1-URGENT' and O_ORDERSTATUS = 'F'),
final as (

select
	O_ORDERKEY order_id,
	O_CUSTKEY cust_id,
	O_ORDERSTATUS order_status,
	O_TOTALPRICE total_price,
	O_ORDERDATE order_date,
	O_ORDERPRIORITY order_priority,
	O_CLERK clerk,
	O_SHIPPRIORITY ship_priority,
	O_COMMENT comment
	
from ord
)

select * from final
