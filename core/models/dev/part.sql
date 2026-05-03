select
	P_PARTKEY part_id,
	P_NAME name,
	P_MFGR mfgr,
	P_BRAND brand,
	P_TYPE type,
	P_SIZE size,
	P_CONTAINER container,
	P_RETAILPRICE retail_price,
	P_COMMENT comment
FROM {{source('src','part')}}