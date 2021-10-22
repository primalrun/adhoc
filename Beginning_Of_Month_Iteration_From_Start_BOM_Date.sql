SELECT dateadd(month, num - 1, firstdate) AS mon
FROM (
	SELECT TOP 12 row_number() OVER (
			PARTITION BY NULL ORDER BY (
					SELECT NULL
					)
			) AS num
	FROM Information_Schema.Columns c
	) n
CROSS JOIN (
	SELECT cast('20181001' AS DATE) firstdate
	) const
