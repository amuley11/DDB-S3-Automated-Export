CREATE EXTERNAL TABLE IF NOT EXISTS ddb_exported_table (
  Item struct <delete_time:struct<N:string>,
               table_id:struct<S:string>>
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://borrowedcloud-ddb-export-bucket/ExportedData/'
TBLPROPERTIES ( 'has_encrypted_data'='true');


SELECT
    Item.delete_time.N as delete_time,
    Item.table_id.S as table_id
FROM ddb_exported_table;