select
	PS_PARTKEY part_id,
	PS_SUPPKEY supp_id,
	PS_AVAILQTY avail_qty,
	PS_SUPPLYCOST supply_cost,
	PS_COMMENT comment
FROM {{source('src','partsupp')}}