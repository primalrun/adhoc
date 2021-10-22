SELECT ViewName = V.name
	,SchemaName = S.name
	,C.column_id
	,ColumnName = c.name
	,DataType = TP.name
	,C.max_length
	,C.precision
	,c.scale
	,c.is_nullable
	,c.is_computed
	,c.is_identity
	,c.is_rowguidcol
	,c.system_type_id
	,c.user_type_id
FROM SYS.views V
INNER JOIN SYS.schemas S ON V.schema_id = S.schema_id
INNER JOIN SYS.columns C ON V.object_id = C.object_id
INNER JOIN SYS.types TP ON C.user_type_id = TP.user_type_id
WHERE V.name = 'PayReg'
	AND S.name = 'Staging'
ORDER BY C.column_id

