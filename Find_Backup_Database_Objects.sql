SELECT O.name
	,O.object_id
	,SchemaName = S.name
	,O.type
	,O.type_desc
	,Drop_Statement = CASE WHEN O.type = 'U' THEN 'DROP TABLE ' + S.name + '.' + O.name + ';'
		WHEN O.type = 'P' THEN 'DROP PROCEDURE ' + S.name + '.' + O.name + ';'
		WHEN O.type = 'V' THEN 'DROP VIEW ' + S.name + '.' + O.name + ';'
		ELSE NULL END
FROM SYS.objects O
INNER JOIN SYS.schemas S ON O.schema_id = S.schema_id
WHERE Type IN ('U', 'P', 'V')
	AND O.name LIKE '%BKP%'