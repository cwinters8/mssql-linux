USE master;

-- get current memory utilization
INSERT INTO dbo.mssql_perf_tracking
select current_timestamp as timestamp, 'Memory used (MB)' as metric_name, memory_used_kb/1024 as metric_value
FROM
	(
		select (sum([Total Server Memory (KB)]) - sum([Free Memory (KB)])) AS memory_used_kb
		from sys.dm_os_performance_counters
		PIVOT
		(
			sum(cntr_value)
			FOR counter_name IN ([Free Memory (KB)], [Total Server Memory (KB)])
		) AS p
	) as t;

INSERT INTO dbo.mssql_perf_tracking
select current_timestamp as timestamp, 'Memory free (MB)' as metric_name, sum(cntr_value)/1024 as metric_value 
from sys.dm_os_performance_counters
where counter_name = 'Free Memory (KB)'
group by counter_name;

-- current CPU utilization
INSERT INTO dbo.mssql_perf_tracking
select current_timestamp as timestamp, 'CPU usage %' as metric_name, sum(cntr_value) as metric_value 
from sys.dm_os_performance_counters
where counter_name = 'CPU usage %'
group by counter_name;

-- current disk usage
INSERT INTO dbo.mssql_perf_tracking
select current_timestamp as timestamp, 'Total Size of Data Files (MB)' as metric_name, sum(cntr_value)/1024 as metric_value
from sys.dm_os_performance_counters
where counter_name = 'Data File(s) Size (KB)'
group by counter_name;
