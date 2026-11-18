-- Bronze Auto Loader object configuration consumed by notebooks/bronze_load.
-- Relative paths are resolved against the environment base paths from common/define_path:
--   source_rel_path                     -> tracking_raw_path
--   schema_rel_path, checkpoint_rel_path -> tracking_br_path
CREATE TABLE IF NOT EXISTS dev.control.bronze_ingestion_config (
  object_name          STRING    NOT NULL COMMENT 'Logical source object name, e.g. invoice',
  source_system        STRING    NOT NULL COMMENT 'Source system the object belongs to, e.g. tracking',
  source_rel_path      STRING    NOT NULL COMMENT 'Source folder relative to tracking_raw_path (define_path)',
  target_table         STRING    NOT NULL COMMENT 'Fully qualified Bronze target table',
  schema_rel_path      STRING    NOT NULL COMMENT 'Auto Loader schemaLocation relative to tracking_br_path',
  checkpoint_rel_path  STRING    NOT NULL COMMENT 'Checkpoint location relative to tracking_br_path',
  file_format          STRING    NOT NULL COMMENT 'cloudFiles.format value',
  is_active            BOOLEAN   NOT NULL COMMENT 'Only active rows are ingested',
  load_order           INT       NOT NULL COMMENT 'Ascending processing order',
  updated_at           TIMESTAMP NOT NULL COMMENT 'Last time this row was changed'
)
USING DELTA
COMMENT 'Bronze Auto Loader object configuration consumed by notebooks/bronze_load';
