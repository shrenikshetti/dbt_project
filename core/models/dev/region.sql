select
	R_REGIONKEY region_id,
	R_NAME name,
	R_COMMENT comment
FROM {{source('src','region')}}