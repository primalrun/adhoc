SELECT P.*
FROM OPENROWSET(
'SQLNCLI'
,'DataSource=SQLWAYPOINT;Trusted_Connection=yes;Persist Security Info=False;'
,'SELECT TOP 10 *
FROM SQLWAYPOINT.ULTIPRODW.dbo.PgPayPer'
) P