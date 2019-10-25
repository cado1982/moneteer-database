ALTER TABLE app.transaction
	ADD COLUMN target_account_id uuid NULL references app.account(id) ON DELETE RESTRICT,
	ADD CONSTRAINT check__transaction__target_account_id CHECK ((target_account_id IS NULL AND payee_id IS NULL) OR (target_account_id IS NOT NULL AND payee_id IS NULL) OR (target_account_id IS NULL AND payee_id IS NOT NULL)),
	ADD CONSTRAINT check__transaction__target_account_id_not_empty CHECK (target_account_id <> '00000000-0000-0000-0000-000000000000');