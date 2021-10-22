SELECT d.object_id ,d.database_id, OBJECT_NAME(object_id, database_id) 'proc name',  
    d.cached_time, d.last_execution_time, d.total_elapsed_time,
    d.total_elapsed_time/d.execution_count AS [avg_elapsed_time],
    d.last_elapsed_time, d.execution_count
FROM sys.dm_exec_procedure_stats AS d
WHERE last_execution_time >= '5/20/2021 06:55:20'
--AND OBJECT_NAME(object_id, database_id) like '%InsertNursingWagesAsPercentRevenue%'
and d.database_id = 13  --DP_ODS
ORDER BY 5 ASC;