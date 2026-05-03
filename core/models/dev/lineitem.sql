with
	item as (select * from {{source('src','lineitem')}} where L_RETURNFLAG = 'A' or L_LINESTATUS = 'O'),
final as (
select 
	L_ORDERKEY orders_id,
	L_PARTKEY part_id,
	L_SUPPKEY supp_id,
	L_LINENUMBER line_number,
	L_QUANTITY qty,
	L_EXTENDEDPRICE extended_price,
	L_DISCOUNT disc,
	L_TAX tax,
	L_RETURNFLAG return_flag,
	L_LINESTATUS line_status,
	L_SHIPDATE ship_date,
	L_COMMITDATE commit_date,
	L_RECEIPTDATE reciept_date,
	L_SHIPINSTRUCT ship_instruct,
	L_SHIPMODE ship_mode,
	L_COMMENT comment
FROM item
)

select * from final