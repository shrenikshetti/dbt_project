with 
	cust as (select * from {{source('src','customer')}}),
    ord as (select * from {{source('src','orders')}} where O_ORDERDATE = '1998-08-02'),
final as (
SELECT
	concat_ws('~','SHETTI',cust.C_CUSTKEY) :: varchar(100) CUST_ID,
	cust.C_NAME NAME,
	cust.C_ADDRESS CUST_ADDR,
	{{get_nation_name('cust.C_NATIONKEY')}} AS NATION_NAME,         --taken from macro
    --DBT_DB.SRC.GET_NATION_NAME(cust.C_NATIONKEY) AS NATION_NAME,  -- taken from snowflake function
	cust.C_PHONE CUST_PHONE,
	ROUND((cust.C_ACCTBAL) :: varchar(100))*2 ACC_BAL,
	cust.C_MKTSEGMENT MKT_SEGMENT,
	cust.C_COMMENT COMMENT,
    ord.O_ORDERKEY order_id,
    ord.O_TOTALPRICE total_price,
    ord.O_ORDERDATE order_date,
	ord.O_ORDERPRIORITY order_priority
    FROM cust
        left outer join ord on cust.C_CUSTKEY = ord.O_CUSTKEY shernik
)

select * from final