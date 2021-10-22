USE DP_ODS
GO

DECLARE @StringToSearch varchar(100) 
SET @StringToSearch = '%' + 'dbo.censussums' + '%'

 

   SELECT Distinct SO.Name, null as PARENT_TABLE, null as REFERENCE_TABLE, null as PARENT_COLUMN, null as REFERENCE_COLUMN
   FROM sysobjects SO (NOLOCK)
   INNER JOIN syscomments SC (NOLOCK) on SO.Id = SC.ID
   AND SO.Type = 'P'
   AND SC.Text LIKE @StringToSearch

 

UNION

 

select    fk.name as Name, 
        so2.name as PARENT_TABLE, 
        so3.name as REFERENCE_TABLE,
        c2.name as PARENT_COLUMN,
        c3.name as REFERENCE_COLUMN
from sys.foreign_keys fk
inner join sys.objects so (NOLOCK) on fk.object_id = so.object_id
inner join sys.objects so2 (NOLOCK) on fk.parent_object_id = so2.object_id
inner join sys.objects so3 (NOLOCK) on fk.referenced_object_id = so3.object_id
inner join sys.foreign_key_columns fkc (NOLOCK) on fk.object_id = fkc.constraint_object_id
inner join sys.columns c2 (NOLOCK) on fkc.parent_column_id = c2.column_id and fkc.parent_object_id = c2.object_id
inner join sys.columns c3 (NOLOCK) on fkc.referenced_column_id = c3.column_id and fkc.parent_object_id = c3.object_id
where fk.name like @StringToSearch
or so2.name like @StringToSearch
or so3.name like @StringToSearch
or c2.name like @StringToSearch
or c3.name like @StringToSearch

 

UNION

 

select TABLE_NAME as Name, 
        NULL as PARENT_TABLE, 
        NULL as REFERENCE_TABLE,
        NULL as PARENT_COLUMN,
        NULL as REFERENCE_COLUMN
from INFORMATION_SCHEMA.VIEWS
where VIEW_DEFINITION like @StringToSearch

 

ORDER BY SO.Name


