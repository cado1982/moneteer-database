CREATE EXTENSION IF NOT EXISTS citext;
ALTER TABLE app.envelope ALTER COLUMN name TYPE citext;
ALTER TABLE app.envelope_category ALTER COLUMN name TYPE citext;
ALTER TABLE app.budget ALTER COLUMN name TYPE citext;
ALTER TABLE app.account ALTER COLUMN name TYPE citext;
ALTER TABLE app.payee ALTER COLUMN name TYPE citext;