select
	S_SUPPKEY suppl_id,
	S_NAME name,
	S_ADDRESS address,
	S_NATIONKEY nation_id,
	S_PHONE phone,
	S_ACCTBAL acct_bal,
	S_COMMENT comment
FROM {{source('src','supplier')}}