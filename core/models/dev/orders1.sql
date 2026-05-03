with
	ord as (select * from {{source('src','orders')}}),
    item as (select * from {{source('src','lineitem')}}),
    supp as (select * from {{source('src','supplier')}}),
final as (
select
	ord.O_ORDERKEY order_id,
	ord.O_CUSTKEY cust_id,
	ord.O_ORDERSTATUS order_status,
	ord.O_TOTALPRICE total_price,
	ord.O_ORDERDATE order_date,
	ord.O_ORDERPRIORITY order_priority,
	ord.O_CLERK clerk,
	ord.O_SHIPPRIORITY ship_priority,
	ord.O_COMMENT comment,
    item.L_SUPPKEY supp_id,
    supp.S_NAME name,
	supp.S_PHONE supp_phone
from ord
        left outer join item on ord.O_ORDERKEY = item.L_ORDERKEY
        left outer join supp on item.L_SUPPKEY = supp.S_SUPPKEY
)
select * from final