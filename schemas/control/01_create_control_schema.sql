-- Control/metadata schema for pipeline configuration.
-- Uses the managed storage location of the existing `dev` catalog (no MANAGED LOCATION specified).
CREATE SCHEMA IF NOT EXISTS dev.control
COMMENT 'Pipeline control and configuration tables';
