﻿CREATE EXTENSION IF NOT EXISTS citext;
ALTER TABLE envelope ALTER COLUMN name TYPE citext;
ALTER TABLE envelope_category ALTER COLUMN name TYPE citext;
ALTER TABLE budget ALTER COLUMN name TYPE citext;
ALTER TABLE account ALTER COLUMN name TYPE citext;
ALTER TABLE payee ALTER COLUMN name TYPE citext;