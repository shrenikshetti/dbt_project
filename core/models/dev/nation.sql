with
	nation as (select * from {{source('src','nation')}} where N_REGIONKEY = 1),
final as (
select
	N_NATIONKEY nation_id,
	N_NAME name,
	N_REGIONKEY region_key,
	N_COMMENT comment
from nation
)

select * from nation
