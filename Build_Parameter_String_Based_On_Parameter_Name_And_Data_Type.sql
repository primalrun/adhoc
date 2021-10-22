DECLARE @Parameter VARCHAR(MAX);
DECLARE @ParameterString VARCHAR(MAX) = '';

SET @Parameter = '2021-09-11^DATETIME_2021-09-30^DATETIME_Test1^VARCHAR_15^INTEGER'

SELECT @ParameterString += QUOTENAME(B.ParameterNameFormatted) + ','
FROM (
SELECT A.ParameterName
	,ParameterNameFormatted = CASE WHEN A.DataType IN ('DATE', 'DATETIME', 'CHAR', 'VARCHAR') THEN QUOTENAME(A.ParameterName, '''')
		ELSE A.ParameterName
		END
FROM (
SELECT Value
	,SUBSTRING(Value, 1 , CHARINDEX('^', Value) - 1) AS ParameterName
	,SUBSTRING(Value, CHARINDEX('^', Value) + 1, LEN(Value)) AS DataType
FROM STRING_SPLIT(@Parameter, '_') 
) A
) B;


SET @ParameterString = LEFT(@ParameterString, LEN(@ParameterString) - 1);
SET @ParameterString = REPLACE(REPLACE(@ParameterString, '[', ''), ']', '');
SELECT @ParameterString
