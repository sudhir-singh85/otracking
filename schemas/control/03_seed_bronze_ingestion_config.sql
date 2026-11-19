-- Seed the Bronze ingestion configuration with the four existing OTracking objects.
-- Values reproduce the previously hard-coded configuration in notebooks/bronze_load exactly.
-- Idempotent: re-running only updates rows (and updated_at) whose values actually differ.
MERGE INTO dev.control.bronze_ingestion_config AS tgt
USING (
  SELECT * FROM VALUES
    ('invoice',       'tracking', 'invoice/',       'dev.tracking_br.invoice',       'schema', 'checkpoint/invoice/',       'csv', true, 1),
    ('order',         'tracking', 'order/',         'dev.tracking_br.order',         'schema', 'checkpoint/order/',         'csv', true, 2),
    ('paymentdetail', 'tracking', 'paymentdetail/', 'dev.tracking_br.paymentdetail', 'schema', 'checkpoint/paymentdetail/', 'csv', true, 3),
    ('ordertracking', 'tracking', 'ordertracking/', 'dev.tracking_br.ordertracking', 'schema', 'checkpoint/ordertracking/', 'csv', true, 4)
  AS v(object_name, source_system, source_rel_path, target_table, schema_rel_path,
       checkpoint_rel_path, file_format, is_active, load_order)
) AS src
ON tgt.object_name = src.object_name
WHEN MATCHED AND NOT (
       tgt.source_system       <=> src.source_system
   AND tgt.source_rel_path     <=> src.source_rel_path
   AND tgt.target_table        <=> src.target_table
   AND tgt.schema_rel_path     <=> src.schema_rel_path
   AND tgt.checkpoint_rel_path <=> src.checkpoint_rel_path
   AND tgt.file_format         <=> src.file_format
   AND tgt.is_active           <=> src.is_active
   AND tgt.load_order          <=> src.load_order
) THEN UPDATE SET
   source_system       = src.source_system,
   source_rel_path     = src.source_rel_path,
   target_table        = src.target_table,
   schema_rel_path     = src.schema_rel_path,
   checkpoint_rel_path = src.checkpoint_rel_path,
   file_format         = src.file_format,
   is_active           = src.is_active,
   load_order          = src.load_order,
   updated_at          = current_timestamp()
WHEN NOT MATCHED THEN INSERT
  (object_name, source_system, source_rel_path, target_table, schema_rel_path,
   checkpoint_rel_path, file_format, is_active, load_order, updated_at)
VALUES
  (src.object_name, src.source_system, src.source_rel_path, src.target_table, src.schema_rel_path,
   src.checkpoint_rel_path, src.file_format, src.is_active, src.load_order, current_timestamp());
